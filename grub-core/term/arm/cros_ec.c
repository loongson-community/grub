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

#include "cros_ec.h"
#include <grub/mm.h>
#include <grub/time.h>
#include <grub/misc.h>

#define assert(x)
#define MIN(a,b) ((a) < (b) ? (a) : (b))

#define printf grub_printf

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

#pragma GCC diagnostic ignored "-Wsign-compare"

static const uint64_t FramingTimeoutUs = 1000 * 1000;

static const uint8_t EcFramingByte = 0xec;


/*
 * This header file is used in coreboot both in C and ACPI code.  The ACPI code
 * is pre-processed to handle constants but the ASL compiler is unable to
 * handle actual C code so keep it separate.
 */
#ifndef __ACPI__

/*
 * Define __packed if someone hasn't beat us to it.  Linux kernel style
 * checking prefers __packed over __attribute__((packed)).
 */
#ifndef __packed
#define __packed __attribute__((packed))
#endif


/* Host command response codes */
enum ec_status {
	EC_RES_SUCCESS = 0,
	EC_RES_INVALID_COMMAND = 1,
	EC_RES_ERROR = 2,
	EC_RES_INVALID_PARAM = 3,
	EC_RES_ACCESS_DENIED = 4,
	EC_RES_INVALID_RESPONSE = 5,
	EC_RES_INVALID_VERSION = 6,
	EC_RES_INVALID_CHECKSUM = 7,
	EC_RES_IN_PROGRESS = 8,		/* Accepted, command in progress */
	EC_RES_UNAVAILABLE = 9,		/* No response available */
	EC_RES_TIMEOUT = 10,		/* We got a timeout */
	EC_RES_OVERFLOW = 11,		/* Table / data overflow */
	EC_RES_INVALID_HEADER = 12,     /* Header contains invalid data */
	EC_RES_REQUEST_TRUNCATED = 13,  /* Didn't get the entire request */
	EC_RES_RESPONSE_TOO_BIG = 14,   /* Response was too big to handle */
	EC_RES_BUS_ERROR = 15,          /* Communications bus error */
	EC_RES_BUSY = 16                /* Up but too busy.  Should retry */
};

/*
 * Framing byte which precedes a response packet from the EC.  After sending a
 * request, the AP will clock in bytes until it sees the framing byte, then
 * clock in the response packet.
 */
#define EC_SPI_FRAME_START    0xec

/*
 * Padding bytes which are clocked out after the end of a response packet.
 */
#define EC_SPI_PAST_END       0xed

/*
 * EC is ready to receive, and has ignored the byte sent by the AP.  EC expects
 * that the AP will send a valid packet header (starting with
 * EC_COMMAND_PROTOCOL_3) in the next 32 bytes.
 */
#define EC_SPI_RX_READY       0xf8

/*
 * EC has started receiving the request from the AP, but hasn't started
 * processing it yet.
 */
#define EC_SPI_RECEIVING      0xf9

/* EC has received the entire request from the AP and is processing it. */
#define EC_SPI_PROCESSING     0xfa

/*
 * EC received bad data from the AP, such as a packet header with an invalid
 * length.  EC will ignore all data until chip select deasserts.
 */
#define EC_SPI_RX_BAD_DATA    0xfb

/*
 * EC received data from the AP before it was ready.  That is, the AP asserted
 * chip select and started clocking data before the EC was ready to receive it.
 * EC will ignore all data until chip select deasserts.
 */
#define EC_SPI_NOT_READY      0xfc

/*
 * EC was ready to receive a request from the AP.  EC has treated the byte sent
 * by the AP as part of a request packet, or (for old-style ECs) is processing
 * a fully received packet but is not ready to respond yet.
 */
#define EC_SPI_OLD_READY      0xfd

/*****************************************************************************/

/*
 * Protocol version 2 for I2C and SPI send a request this way:
 *
 *	0	EC_CMD_VERSION0 + (command version)
 *	1	Command number
 *	2	Length of params = N
 *	3..N+2	Params, if any
 *	N+3	8-bit checksum of bytes 0..N+2
 *
 * The corresponding response is:
 *
 *	0	Result code (EC_RES_*)
 *	1	Length of params = M
 *	2..M+1	Params, if any
 *	M+2	8-bit checksum of bytes 0..M+1
 */
#define EC_PROTO2_REQUEST_HEADER_BYTES 3
#define EC_PROTO2_REQUEST_TRAILER_BYTES 1
#define EC_PROTO2_REQUEST_OVERHEAD (EC_PROTO2_REQUEST_HEADER_BYTES +	\
				    EC_PROTO2_REQUEST_TRAILER_BYTES)

#define EC_PROTO2_RESPONSE_HEADER_BYTES 2
#define EC_PROTO2_RESPONSE_TRAILER_BYTES 1
#define EC_PROTO2_RESPONSE_OVERHEAD (EC_PROTO2_RESPONSE_HEADER_BYTES +	\
				     EC_PROTO2_RESPONSE_TRAILER_BYTES)

/* Parameter length was limited by the LPC interface */
#define EC_PROTO2_MAX_PARAM_SIZE 0xfc

/* Maximum request and response packet sizes for protocol version 2 */
#define EC_PROTO2_MAX_REQUEST_SIZE (EC_PROTO2_REQUEST_OVERHEAD +	\
				    EC_PROTO2_MAX_PARAM_SIZE)
#define EC_PROTO2_MAX_RESPONSE_SIZE (EC_PROTO2_RESPONSE_OVERHEAD +	\
				     EC_PROTO2_MAX_PARAM_SIZE)

/*****************************************************************************/

#define EC_CMD_MKBP_STATE 0x60


/*
 * This header byte on a command indicate version 0. Any header byte less
 * than this means that we are talking to an old EC which doesn't support
 * versioning. In that case, we assume version 0.
 *
 * Header bytes greater than this indicate a later version. For example,
 * EC_CMD_VERSION0 + 1 means we are using version 1.
 *
 * The old EC interface must not use commands 0xdc or higher.
 */
#define EC_CMD_VERSION0 0xdc

#endif  /* !__ACPI__ */



#define DEFAULT_BUF_SIZE 0x100

#define EC_CMD_HELLO 0x01

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
		//		grub_printf ("%x\n", byte);
		if (byte != EcFramingByte &&
			grub_get_time_us() - start > FramingTimeoutUs) {
			printf("Timeout waiting for framing byte.\n");
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
#define MSG_BYTES sizeof (busbuf)

static int send_command(uint8_t cmd, int cmd_version,
			const void *dout, uint32_t dout_len,
			void *din, uint32_t din_len)
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
		printf("%s: Cannot send %d bytes\n", __func__, dout_len);
		return -1;
	}
	if (in_bytes > MSG_BYTES) {
		printf("%s: Cannot receive %d bytes\n", __func__, din_len);
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

	assert(out_bytes == bytes - (uint8_t *)busbuf);

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
		printf("%s: Received length %#02x too large\n",
		       __func__, length);
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
	if (result != EC_RES_SUCCESS) {
		printf("%s: Received bad result code %d\n", __func__, result);
		return -result;
	}

	int csum = cros_ec_calc_checksum(busbuf,
					 CROS_EC_SPI_IN_HDR_SIZE + length);

	if (csum != expected) {
		printf("%s: Invalid checksum rx %#02x, calced %#02x\n",
		       __func__, expected, csum);
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


/* Timeout waiting for a flash erase command to complete */
static const int CROS_EC_CMD_TIMEOUT_MS = 5000;

/**
 * Send a command to the ChromeOS EC device and optionally return the reply.
 *
 * The device's internal input/output buffers are used.
 *
 * @param cmd		Command to send (EC_CMD_...)
 * @param cmd_version	Version of command to send (EC_VER_...)
 * @param dout          Output data (may be NULL If dout_len=0)
 * @param dout_len      Size of output data in bytes
 * @param din           Response data (may be NULL If din_len=0).
 * @param din_len       Maximum size of response in bytes
 * @return number of bytes in response, or -1 on error
 */
static int send_command_proto2(int cmd, int cmd_version,
			       const void *dout, int dout_len,
			       void *din, int din_len)
{
	int len;

	/* Proto2 can't send 16-bit command codes */
	if (cmd > 0xff)
		return -EC_RES_INVALID_COMMAND;

	len = send_command(cmd, cmd_version, dout,
					dout_len, din, din_len);

#ifdef DEBUG
	printf("%s: len=%d, din=%p\n", __func__, len, din);
#endif

	return len;
}

static int ec_command(int cmd, int cmd_version,
		      const void *dout, int dout_len,
		      void *din, int din_len)
{
	return send_command_proto2(cmd, cmd_version, dout, dout_len,
				   din, din_len);
}

int cros_ec_scan_keyboard(struct cros_ec_keyscan *scan)
{
	if (ec_command(EC_CMD_MKBP_STATE, 0, NULL, 0, scan,
		       sizeof(*scan)) < (int)sizeof(*scan))
		return -1;

	return 0;
}
