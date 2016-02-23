/*
 *  GRUB  --  GRand Unified Bootloader
 *
 *  Copyright (C) 2012  Google Inc.
 *  Copyright (C) 2016  Free Software Foundation, Inc.
 *
 *  GRUB is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  GRUB is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <grub/mm.h>
#include <grub/time.h>
#include <grub/misc.h>
#include <grub/cros_ec.h>

static grub_uint64_t
grub_get_time_us (void)
{
  return 1000 * grub_get_time_ms();
}

static void
grub_microsleep (grub_uint64_t len)
{
  grub_uint64_t end_time = grub_get_time_us () + len;
  while (grub_get_time_us () < end_time)
    grub_cpu_idle ();
}

volatile grub_uint32_t *spi = (volatile grub_uint32_t *) 0xff110000;

static int
spi_send (const void *data, grub_size_t sz)
{
  const grub_uint8_t *ptr = data, *end = ptr + sz;
  spi[2] = 0;
  spi[1] = sz - 1;
  spi[0] = ((1 << 18) | spi[0]) & ~(1 << 19);
  spi[2] = 1;
  while (ptr < end)
    {
      while (spi[9] & 2);
      spi[256] = *ptr++;
    }
  while (spi[9] & 1);
  return 0;
}

static int
spi_read (void *data, grub_size_t sz)
{
  grub_uint8_t *ptr = data, *end = ptr + sz;
  spi[2] = 0;
  spi[1] = sz - 1;
  spi[0] = ((1 << 19) | spi[0]) & ~(1 << 18);
  spi[2] = 1;
  while (ptr < end)
    {
      while (spi[9] & 8);
      *ptr++ = spi[512];
    }
  while (spi[9] & 1);
  return 0;
}

static int
spi_start (void)
{
  spi[3] = 1;
  return 0;
}

static void
spi_stop (void)
{
  spi[3] = 0;
}

#define uint8_t grub_uint8_t
#define uint16_t grub_uint16_t
#define uint32_t grub_uint32_t
#define uint64_t grub_uint64_t
#define mdelay grub_millisleep
#define memcpy grub_memcpy

static const uint64_t FramingTimeoutMs = 300 * 1000;

static const uint8_t EcFramingByte = 0xec;

#define EC_CMD_MKBP_STATE 0x60
#define EC_CMD_VERSION0 0xdc

static uint64_t last_transfer;

static void stop_bus(void)
{
	spi_stop();
	last_transfer = grub_get_time_us();
}

static int wait_for_frame(void)
{
	uint64_t start = grub_get_time_us();
	uint8_t byte;
	do {
		if (spi_read(&byte, 1))
			return -1;
		if (byte != EcFramingByte &&
			grub_get_time_us() - start > FramingTimeoutUs) {
			grub_dprintf("cros", "Timeout waiting for framing byte.\n");
			return -1;
		}
	} while (byte != EcFramingByte);
	return 0;
}

/*
 * Calculate a simple 8-bit checksum of a data block
 *
 * @param data	Data block to checksum
 * @param size	Size of data block in bytes
 * @return checksum value (0 to 255)
 */
static uint8_t cros_ec_calc_checksum(const void *data, int size)
{
	uint8_t csum;
	const uint8_t *bytes = data;
	int i;

	for (i = csum = 0; i < size; i++)
		csum += bytes[i];
	return csum & 0xff;
}

enum {
	// response, arglen
	CROS_EC_SPI_IN_HDR_SIZE = 2,
	// version, cmd, arglen
	CROS_EC_SPI_OUT_HDR_SIZE = 3
};

static grub_uint8_t busbuf[256];
#define MSG_BYTES ((int)sizeof (busbuf))

static int ec_command(int cmd, int cmd_version,
		      const void *dout, int dout_len,
		      void *din, int din_len)
{
	uint8_t *bytes;

	// Header + data + checksum.
	uint32_t out_bytes = CROS_EC_SPI_OUT_HDR_SIZE + dout_len + 1;
	uint32_t in_bytes = CROS_EC_SPI_IN_HDR_SIZE + din_len + 1;

	/*
	 * Sanity-check I/O sizes given transaction overhead in internal
	 * buffers.
	 */
	if (out_bytes > MSG_BYTES) {
		grub_dprintf("cros", "Cannot send %d bytes\n", dout_len);
		return -1;
	}
	if (in_bytes > MSG_BYTES) {
		grub_dprintf("cros", "Cannot receive %d bytes\n", din_len);
		return -1;
	}

	// Prepare the output.
	bytes = busbuf;
	*bytes++ = EC_CMD_VERSION0 + cmd_version;
	*bytes++ = cmd;
	*bytes++ = dout_len;
	memcpy(bytes, dout, dout_len);
	bytes += dout_len;

	*bytes++ = cros_ec_calc_checksum(busbuf,
					 CROS_EC_SPI_OUT_HDR_SIZE + dout_len);

	while (grub_get_time_us() - last_transfer < 200)
		;

	if (spi_start())
		return -1;

	// Allow EC to ramp up clock after being awoken.
	// See chrome-os-partner:32223 for more details.
	grub_microsleep (100);

	if (spi_send(busbuf, out_bytes)) {
		stop_bus();
		return -1;
	}

	// Wait until the EC is ready.
	if (wait_for_frame()) {
		stop_bus();
		return -1;
	}

	// Read the response code and the data length.
	bytes = busbuf;
	if (spi_read(bytes, 2)) {
		stop_bus();
		return -1;
	}
	uint8_t result = *bytes++;
	uint8_t length = *bytes++;

	// Make sure there's enough room for the data.
	if (CROS_EC_SPI_IN_HDR_SIZE + length + 1 > MSG_BYTES) {
		grub_dprintf("cros", "Received length %#02x too large\n",
			     length);
		stop_bus();
		return -1;
	}

	// Read the data and the checksum, and finish up.
	if (spi_read(bytes, length + 1)) {
		stop_bus();
		return -1;
	}
	bytes += length;
	int expected = *bytes++;
	stop_bus();

	// Check the integrity of the response.
	if (result != 0) {
		grub_dprintf("cros", "Received bad result code %d\n", result);
		return -result;
	}

	int csum = cros_ec_calc_checksum(busbuf,
					 CROS_EC_SPI_IN_HDR_SIZE + length);

	if (csum != expected) {
		grub_dprintf("cros", "Invalid checksum rx %#02x, calced %#02x\n",
			     expected, csum);
		return -1;
	}

	// If the caller wants the response, copy it out for them.
	din_len = MIN(din_len, length);
	if (din) {
		memcpy(din, (uint8_t *)busbuf + CROS_EC_SPI_IN_HDR_SIZE,
		       din_len);
	}

	return din_len;
}

int
grub_cros_ec_scan_keyboard(struct grub_cros_ec_keyscan *scan)
{
	if (ec_command(EC_CMD_MKBP_STATE, 0, NULL, 0, scan,
		       sizeof(*scan)) < (int)sizeof(*scan))
		return -1;

	return 0;
}
