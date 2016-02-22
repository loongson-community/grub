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

typedef int (*SendCommandFunc)(int cmd, int cmd_version, const void *dout,
			       int dout_len, void *dinp, int din_len);

SendCommandFunc send_command_func;

static struct ec_host_request *proto3_request;
static int proto3_request_size;

static struct ec_host_response *proto3_response;
static int proto3_response_size;

static int max_param_size;
static int passthru_param_size;
static int initialized;

static const uint64_t FramingTimeoutUs = 1000 * 1000;

static const uint8_t EcFramingByte = 0xec;

/* Command version mask */
#define EC_VER_MASK(version) (1UL << (version))

/* The actual block is 0x800-0x8ff, but some BIOSes think it's 0x880-0x8ff
 * and they tell the kernel that so we have to think of it as two parts. */
#define EC_HOST_CMD_REGION0    0x800
#define EC_HOST_CMD_REGION1    0x880
#define EC_HOST_CMD_REGION_SIZE 0x80



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

/*
 * Value written to legacy command port / prefix byte to indicate protocol
 * 3+ structs are being used.  Usage is bus-dependent.
 */
#define EC_COMMAND_PROTOCOL_3 0xda

#define EC_HOST_REQUEST_VERSION 3

/* Version 3 request from host */
struct ec_host_request {
	/* Struct version (=3)
	 *
	 * EC will return EC_RES_INVALID_HEADER if it receives a header with a
	 * version it doesn't know how to parse.
	 */
	uint8_t struct_version;

	/*
	 * Checksum of request and data; sum of all bytes including checksum
	 * should total to 0.
	 */
	uint8_t checksum;

	/* Command code */
	uint16_t command;

	/* Command version */
	uint8_t command_version;

	/* Unused byte in current protocol version; set to 0 */
	uint8_t reserved;

	/* Length of data which follows this header */
	uint16_t data_len;
} __packed;

#define EC_HOST_RESPONSE_VERSION 3

/* Version 3 response from EC */
struct ec_host_response {
	/* Struct version (=3) */
	uint8_t struct_version;

	/*
	 * Checksum of response and data; sum of all bytes including checksum
	 * should total to 0.
	 */
	uint8_t checksum;

	/* Result code (EC_RES_*) */
	uint16_t result;

	/* Length of data which follows this header */
	uint16_t data_len;

	/* Unused bytes in current protocol version; set to 0 */
	uint16_t reserved;
} __packed;

/*****************************************************************************/
/*
 * Notes on commands:
 *
 * Each command is an 16-bit command value.  Commands which take params or
 * return response data specify structs for that data.  If no struct is
 * specified, the command does not input or output data, respectively.
 * Parameter/response length is implicit in the structs.  Some underlying
 * communication protocols (I2C, SPI) may add length or checksum headers, but
 * those are implementation-dependent and not defined here.
 */

/*****************************************************************************/
/* General / test commands */

/*
 * Get protocol version, used to deal with non-backward compatible protocol
 * changes.
 */
#define EC_CMD_PROTO_VERSION 0x00

struct ec_response_proto_version {
	uint32_t version;
} __packed;

/*
 * Hello.  This is a simple command to test the EC is responsive to
 * commands.
 */
#define EC_CMD_HELLO 0x01

struct ec_params_hello {
	uint32_t in_data;  /* Pass anything here */
} __packed;

struct ec_response_hello {
	uint32_t out_data;  /* Output will be in_data + 0x01020304 */
} __packed;

/* Get version number */
#define EC_CMD_GET_VERSION 0x02

enum ec_current_image {
	EC_IMAGE_UNKNOWN = 0,
	EC_IMAGE_RO,
	EC_IMAGE_RW
};

struct ec_response_get_version {
	/* Null-terminated version strings for RO, RW */
	char version_string_ro[32];
	char version_string_rw[32];
	char reserved[32];       /* Was previously RW-B string */
	uint32_t current_image;  /* One of ec_current_image */
} __packed;

/* Read test */
#define EC_CMD_READ_TEST 0x03

struct ec_params_read_test {
	uint32_t offset;   /* Starting value for read buffer */
	uint32_t size;     /* Size to read in bytes */
} __packed;

struct ec_response_read_test {
	uint32_t data[32];
} __packed;

/*
 * Get build information
 *
 * Response is null-terminated string.
 */
#define EC_CMD_GET_BUILD_INFO 0x04

/* Get chip info */
#define EC_CMD_GET_CHIP_INFO 0x05

struct ec_response_get_chip_info {
	/* Null-terminated strings */
	char vendor[32];
	char name[32];
	char revision[32];  /* Mask version */
} __packed;

/* Get board HW version */
#define EC_CMD_GET_BOARD_VERSION 0x06

struct ec_response_board_version {
	uint16_t board_version;  /* A monotonously incrementing number. */
} __packed;

/*
 * Read memory-mapped data.
 *
 * This is an alternate interface to memory-mapped data for bus protocols
 * which don't support direct-mapped memory - I2C, SPI, etc.
 *
 * Response is params.size bytes of data.
 */
#define EC_CMD_READ_MEMMAP 0x07

struct ec_params_read_memmap {
	uint8_t offset;   /* Offset in memmap (EC_MEMMAP_*) */
	uint8_t size;     /* Size to read in bytes */
} __packed;

/* Read versions supported for a command */
#define EC_CMD_GET_CMD_VERSIONS 0x08

struct ec_params_get_cmd_versions {
	uint8_t cmd;      /* Command to check */
} __packed;

struct ec_params_get_cmd_versions_v1 {
	uint16_t cmd;     /* Command to check */
} __packed;

struct ec_response_get_cmd_versions {
	/*
	 * Mask of supported versions; use EC_VER_MASK() to compare with a
	 * desired version.
	 */
	uint32_t version_mask;
} __packed;

/*
 * Check EC communcations status (busy). This is needed on i2c/spi but not
 * on lpc since it has its own out-of-band busy indicator.
 *
 * lpc must read the status from the command register. Attempting this on
 * lpc will overwrite the args/parameter space and corrupt its data.
 */
#define EC_CMD_GET_COMMS_STATUS		0x09

/* Avoid using ec_status which is for return values */
enum ec_comms_status {
	EC_COMMS_STATUS_PROCESSING	= 1 << 0,	/* Processing cmd */
};

struct ec_response_get_comms_status {
	uint32_t flags;		/* Mask of enum ec_comms_status */
} __packed;

/* Fake a variety of responses, purely for testing purposes. */
#define EC_CMD_TEST_PROTOCOL		0x0a

/* Tell the EC what to send back to us. */
struct ec_params_test_protocol {
	uint32_t ec_result;
	uint32_t ret_len;
	uint8_t buf[32];
} __packed;

/* Here it comes... */
struct ec_response_test_protocol {
	uint8_t buf[32];
} __packed;

/* Get prococol information */
#define EC_CMD_GET_PROTOCOL_INFO	0x0b

/* Flags for ec_response_get_protocol_info.flags */
/* EC_RES_IN_PROGRESS may be returned if a command is slow */
#define EC_PROTOCOL_INFO_IN_PROGRESS_SUPPORTED (1 << 0)

struct ec_response_get_protocol_info {
	/* Fields which exist if at least protocol version 3 supported */

	/* Bitmask of protocol versions supported (1 << n means version n)*/
	uint32_t protocol_versions;

	/* Maximum request packet size, in bytes */
	uint16_t max_request_packet_size;

	/* Maximum response packet size, in bytes */
	uint16_t max_response_packet_size;

	/* Flags; see EC_PROTOCOL_INFO_* */
	uint32_t flags;
} __packed;


/*****************************************************************************/
/* Get/Set miscellaneous values */

/* The upper byte of .flags tells what to do (nothing means "get") */
#define EC_GSV_SET        0x80000000

/* The lower three bytes of .flags identifies the parameter, if that has
   meaning for an individual command. */
#define EC_GSV_PARAM_MASK 0x00ffffff

struct ec_params_get_set_value {
	uint32_t flags;
	uint32_t value;
} __packed;

struct ec_response_get_set_value {
	uint32_t flags;
	uint32_t value;
} __packed;

/* More than one command can use these structs to get/set parameters. */
#define EC_CMD_GSV_PAUSE_IN_S5	0x0c

/*****************************************************************************/
/* List the features supported by the firmware */
#define EC_CMD_GET_FEATURES  0x0d

/* Supported features */
enum ec_feature_code {
	/*
	 * This image contains a limited set of features. Another image
	 * in RW partition may support more features.
	 */
	EC_FEATURE_LIMITED = 0,
	/*
	 * Commands for probing/reading/writing/erasing the flash in the
	 * EC are present.
	 */
	EC_FEATURE_FLASH = 1,
	/*
	 * Can control the fan speed directly.
	 */
	EC_FEATURE_PWM_FAN = 2,
	/*
	 * Can control the intensity of the keyboard backlight.
	 */
	EC_FEATURE_PWM_KEYB = 3,
	/*
	 * Support Google lightbar, introduced on Pixel.
	 */
	EC_FEATURE_LIGHTBAR = 4,
	/* Control of LEDs  */
	EC_FEATURE_LED = 5,
	/* Exposes an interface to control gyro and sensors.
	 * The host goes through the EC to access these sensors.
	 * In addition, the EC may provide composite sensors, like lid angle.
	 */
	EC_FEATURE_MOTION_SENSE = 6,
	/* The keyboard is controlled by the EC */
	EC_FEATURE_KEYB = 7,
	/* The AP can use part of the EC flash as persistent storage. */
	EC_FEATURE_PSTORE = 8,
	/* The EC monitors BIOS port 80h, and can return POST codes. */
	EC_FEATURE_PORT80 = 9,
	/*
	 * Thermal management: include TMP specific commands.
	 * Higher level than direct fan control.
	 */
	EC_FEATURE_THERMAL = 10,
	/* Can switch the screen backlight on/off */
	EC_FEATURE_BKLIGHT_SWITCH = 11,
	/* Can switch the wifi module on/off */
	EC_FEATURE_WIFI_SWITCH = 12,
	/* Monitor host events, through for example SMI or SCI */
	EC_FEATURE_HOST_EVENTS = 13,
	/* The EC exposes GPIO commands to control/monitor connected devices. */
	EC_FEATURE_GPIO = 14,
	/* The EC can send i2c messages to downstream devices. */
	EC_FEATURE_I2C = 15,
	/* Command to control charger are included */
	EC_FEATURE_CHARGER = 16,
	/* Simple battery support. */
	EC_FEATURE_BATTERY = 17,
	/*
	 * Support Smart battery protocol
	 * (Common Smart Battery System Interface Specification)
	 */
	EC_FEATURE_SMART_BATTERY = 18,
	/* EC can dectect when the host hangs. */
	EC_FEATURE_HANG_DETECT = 19,
	/* Report power information, for pit only */
	EC_FEATURE_PMU = 20,
	/* Another Cros EC device is present downstream of this one */
	EC_FEATURE_SUB_MCU = 21,
	/* Support USB Power delivery (PD) commands */
	EC_FEATURE_USB_PD = 22,
	/* Control USB multiplexer, for audio through USB port for instance. */
	EC_FEATURE_USB_MUX = 23,
	/* Motion Sensor code has an internal software FIFO */
	EC_FEATURE_MOTION_SENSE_FIFO = 24,
};

#define EC_FEATURE_MASK_0(event_code) (1UL << (event_code % 32))
#define EC_FEATURE_MASK_1(event_code) (1UL << (event_code - 32))
struct ec_response_get_features {
	uint32_t flags[2];
} __packed;

/*****************************************************************************/
/* Real-time clock */

/* RTC params and response structures */
struct ec_params_rtc {
	uint32_t time;
} __packed;

struct ec_response_rtc {
	uint32_t time;
} __packed;

/* These use ec_response_rtc */
#define EC_CMD_RTC_GET_VALUE 0x44
#define EC_CMD_RTC_GET_ALARM 0x45

/* These all use ec_params_rtc */
#define EC_CMD_RTC_SET_VALUE 0x46
#define EC_CMD_RTC_SET_ALARM 0x47

/*****************************************************************************/
/* MKBP - Matrix KeyBoard Protocol */

/*
 * Read key state
 *
 * Returns raw data for keyboard cols; see ec_response_mkbp_info.cols for
 * expected response size.
 */
#define EC_CMD_MKBP_STATE 0x60


/* Simulate key press */
#define EC_CMD_MKBP_SIMULATE_KEY 0x62

struct ec_params_mkbp_simulate_key {
	uint8_t col;
	uint8_t row;
	uint8_t pressed;
} __packed;

/* Configure keyboard scanning */
#define EC_CMD_MKBP_SET_CONFIG 0x64
#define EC_CMD_MKBP_GET_CONFIG 0x65

/* flags */
enum mkbp_config_flags {
	EC_MKBP_FLAGS_ENABLE = 1,	/* Enable keyboard scanning */
};

enum mkbp_config_valid {
	EC_MKBP_VALID_SCAN_PERIOD		= 1 << 0,
	EC_MKBP_VALID_POLL_TIMEOUT		= 1 << 1,
	EC_MKBP_VALID_MIN_POST_SCAN_DELAY	= 1 << 3,
	EC_MKBP_VALID_OUTPUT_SETTLE		= 1 << 4,
	EC_MKBP_VALID_DEBOUNCE_DOWN		= 1 << 5,
	EC_MKBP_VALID_DEBOUNCE_UP		= 1 << 6,
	EC_MKBP_VALID_FIFO_MAX_DEPTH		= 1 << 7,
};

/* Configuration for our key scanning algorithm */
struct ec_mkbp_config {
	uint32_t valid_mask;		/* valid fields */
	uint8_t flags;		/* some flags (enum mkbp_config_flags) */
	uint8_t valid_flags;		/* which flags are valid */
	uint16_t scan_period_us;	/* period between start of scans */
	/* revert to interrupt mode after no activity for this long */
	uint32_t poll_timeout_us;
	/*
	 * minimum post-scan relax time. Once we finish a scan we check
	 * the time until we are due to start the next one. If this time is
	 * shorter this field, we use this instead.
	 */
	uint16_t min_post_scan_delay_us;
	/* delay between setting up output and waiting for it to settle */
	uint16_t output_settle_us;
	uint16_t debounce_down_us;	/* time for debounce on key down */
	uint16_t debounce_up_us;	/* time for debounce on key up */
	/* maximum depth to allow for fifo (0 = no keyscan output) */
	uint8_t fifo_max_depth;
} __packed;

struct ec_params_mkbp_set_config {
	struct ec_mkbp_config config;
} __packed;

struct ec_response_mkbp_get_config {
	struct ec_mkbp_config config;
} __packed;

/* Run the key scan emulation */
#define EC_CMD_KEYSCAN_SEQ_CTRL 0x66

enum ec_keyscan_seq_cmd {
	EC_KEYSCAN_SEQ_STATUS = 0,	/* Get status information */
	EC_KEYSCAN_SEQ_CLEAR = 1,	/* Clear sequence */
	EC_KEYSCAN_SEQ_ADD = 2,		/* Add item to sequence */
	EC_KEYSCAN_SEQ_START = 3,	/* Start running sequence */
	EC_KEYSCAN_SEQ_COLLECT = 4,	/* Collect sequence summary data */
};

enum ec_collect_flags {
	/*
	 * Indicates this scan was processed by the EC. Due to timing, some
	 * scans may be skipped.
	 */
	EC_KEYSCAN_SEQ_FLAG_DONE	= 1 << 0,
};

struct ec_collect_item {
	uint8_t flags;		/* some flags (enum ec_collect_flags) */
};

struct ec_params_keyscan_seq_ctrl {
	uint8_t cmd;	/* Command to send (enum ec_keyscan_seq_cmd) */
	union {
		struct {
			uint8_t active;		/* still active */
			uint8_t num_items;	/* number of items */
			/* Current item being presented */
			uint8_t cur_item;
		} status;
		struct {
			/*
			 * Absolute time for this scan, measured from the
			 * start of the sequence.
			 */
			uint32_t time_us;
			uint8_t scan[0];	/* keyscan data */
		} add;
		struct {
			uint8_t start_item;	/* First item to return */
			uint8_t num_items;	/* Number of items to return */
		} collect;
	};
} __packed;

struct ec_result_keyscan_seq_ctrl {
	union {
		struct {
			uint8_t num_items;	/* Number of items */
			/* Data for each item */
			struct ec_collect_item item[0];
		} collect;
	};
} __packed;

/*
 * Get the next pending MKBP event.
 *
 * Returns EC_RES_UNAVAILABLE if there is no event pending.
 */
#define EC_CMD_GET_NEXT_EVENT 0x67

enum ec_mkbp_event {
	/* Keyboard matrix changed. The event data is the new matrix state. */
	EC_MKBP_EVENT_KEY_MATRIX = 0,

	/* New host event. The event data is 4 bytes of host event flags. */
	EC_MKBP_EVENT_HOST_EVENT = 1,

	/* New Sensor FIFO data. The event data is fifo_info structure. */
	EC_MKBP_EVENT_SENSOR_FIFO = 2,

	/* Number of MKBP events */
	EC_MKBP_EVENT_COUNT,
};

/*****************************************************************************/
/* Temperature sensor commands */

/* Read temperature sensor info */
#define EC_CMD_TEMP_SENSOR_GET_INFO 0x70

struct ec_params_temp_sensor_get_info {
	uint8_t id;
} __packed;

struct ec_response_temp_sensor_get_info {
	char sensor_name[32];
	uint8_t sensor_type;
} __packed;

/*****************************************************************************/

/*
 * Note: host commands 0x80 - 0x87 are reserved to avoid conflict with ACPI
 * commands accidentally sent to the wrong interface.  See the ACPI section
 * below.
 */

/*****************************************************************************/
/* Host event commands */

/*
 * Host event mask params and response structures, shared by all of the host
 * event commands below.
 */
struct ec_params_host_event_mask {
	uint32_t mask;
} __packed;

struct ec_response_host_event_mask {
	uint32_t mask;
} __packed;

/* These all use ec_response_host_event_mask */
#define EC_CMD_HOST_EVENT_GET_B         0x87
#define EC_CMD_HOST_EVENT_GET_SMI_MASK  0x88
#define EC_CMD_HOST_EVENT_GET_SCI_MASK  0x89
#define EC_CMD_HOST_EVENT_GET_WAKE_MASK 0x8d

/* These all use ec_params_host_event_mask */
#define EC_CMD_HOST_EVENT_SET_SMI_MASK  0x8a
#define EC_CMD_HOST_EVENT_SET_SCI_MASK  0x8b
#define EC_CMD_HOST_EVENT_CLEAR         0x8c
#define EC_CMD_HOST_EVENT_SET_WAKE_MASK 0x8e
#define EC_CMD_HOST_EVENT_CLEAR_B       0x8f

/*****************************************************************************/
/* Switch commands */

/* Enable/disable LCD backlight */
#define EC_CMD_SWITCH_ENABLE_BKLIGHT 0x90

struct ec_params_switch_enable_backlight {
	uint8_t enabled;
} __packed;

/* Enable/disable WLAN/Bluetooth */
#define EC_CMD_SWITCH_ENABLE_WIRELESS 0x91
#define EC_VER_SWITCH_ENABLE_WIRELESS 1

/* Version 0 params; no response */
struct ec_params_switch_enable_wireless_v0 {
	uint8_t enabled;
} __packed;

/* Version 1 params */
struct ec_params_switch_enable_wireless_v1 {
	/* Flags to enable now */
	uint8_t now_flags;

	/* Which flags to copy from now_flags */
	uint8_t now_mask;

	/*
	 * Flags to leave enabled in S3, if they're on at the S0->S3
	 * transition.  (Other flags will be disabled by the S0->S3
	 * transition.)
	 */
	uint8_t suspend_flags;

	/* Which flags to copy from suspend_flags */
	uint8_t suspend_mask;
} __packed;

/* Version 1 response */
struct ec_response_switch_enable_wireless_v1 {
	/* Flags to enable now */
	uint8_t now_flags;

	/* Flags to leave enabled in S3 */
	uint8_t suspend_flags;
} __packed;

/*****************************************************************************/
/* GPIO commands. Only available on EC if write protect has been disabled. */

/* Set GPIO output value */
#define EC_CMD_GPIO_SET 0x92

struct ec_params_gpio_set {
	char name[32];
	uint8_t val;
} __packed;

/* Get GPIO value */
#define EC_CMD_GPIO_GET 0x93

/* Version 0 of input params and response */
struct ec_params_gpio_get {
	char name[32];
} __packed;
struct ec_response_gpio_get {
	uint8_t val;
} __packed;

/* Version 1 of input params and response */
struct ec_params_gpio_get_v1 {
	uint8_t subcmd;
	union {
		struct {
			char name[32];
		} get_value_by_name;
		struct {
			uint8_t index;
		} get_info;
	};
} __packed;

struct ec_response_gpio_get_v1 {
	union {
		struct {
			uint8_t val;
		} get_value_by_name, get_count;
		struct {
			uint8_t val;
			char name[32];
			uint32_t flags;
		} get_info;
	};
} __packed;

enum gpio_get_subcmd {
	EC_GPIO_GET_BY_NAME = 0,
	EC_GPIO_GET_COUNT = 1,
	EC_GPIO_GET_INFO = 2,
};

/*
 * Resend last response (not supported on LPC).
 *
 * Returns EC_RES_UNAVAILABLE if there is no response available - for example,
 * there was no previous command, or the previous command's response was too
 * big to save.
 */
#define EC_CMD_RESEND_RESPONSE 0xdb

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


/*****************************************************************************/
/*
 * Blob commands are just opaque chunks of data, sent with proto v3.
 * params is struct ec_host_request, response is struct ec_host_response.
 */
#define EC_CMD_BLOB 0x200

/*****************************************************************************/
/*
 * Reserve a range of host commands for board-specific, experimental, or
 * special purpose features. These can be (re)used without updating this file.
 *
 * CAUTION: Don't go nuts with this. Shipping products should document ALL
 * their EC commands for easier development, testing, debugging, and support.
 *
 * In your experimental code, you may want to do something like this:
 *
 *   #define EC_CMD_MAGIC_FOO (EC_CMD_BOARD_SPECIFIC_BASE + 0x000)
 *   #define EC_CMD_MAGIC_BAR (EC_CMD_BOARD_SPECIFIC_BASE + 0x001)
 *   #define EC_CMD_MAGIC_HEY (EC_CMD_BOARD_SPECIFIC_BASE + 0x002)
 */
#define EC_CMD_BOARD_SPECIFIC_BASE 0x3E00
#define EC_CMD_BOARD_SPECIFIC_LAST 0x3FFF

/*****************************************************************************/
/*
 * Passthru commands
 *
 * Some platforms have sub-processors chained to each other.  For example.
 *
 *     AP <--> EC <--> PD MCU
 *
 * The top 2 bits of the command number are used to indicate which device the
 * command is intended for.  Device 0 is always the device receiving the
 * command; other device mapping is board-specific.
 *
 * When a device receives a command to be passed to a sub-processor, it passes
 * it on with the device number set back to 0.  This allows the sub-processor
 * to remain blissfully unaware of whether the command originated on the next
 * device up the chain, or was passed through from the AP.
 *
 * In the above example, if the AP wants to send command 0x0002 to the PD MCU,
 *     AP sends command 0x4002 to the EC
 *     EC sends command 0x0002 to the PD MCU
 *     EC forwards PD MCU response back to the AP
 */

/* Offset and max command number for sub-device n */
#define EC_CMD_PASSTHRU_OFFSET(n) (0x4000 * (n))
#define EC_CMD_PASSTHRU_MAX(n) (EC_CMD_PASSTHRU_OFFSET(n) + 0x3fff)

/*****************************************************************************/
/*
 * Deprecated constants. These constants have been renamed for clarity. The
 * meaning and size has not changed. Programs that use the old names should
 * switch to the new names soon, as the old names may not be carried forward
 * forever.
 */
#define EC_HOST_PARAM_SIZE      EC_PROTO2_MAX_PARAM_SIZE
#define EC_LPC_ADDR_OLD_PARAM   EC_HOST_CMD_REGION1
#define EC_OLD_PARAM_SIZE       EC_HOST_CMD_REGION_SIZE

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

static int send_packet(const void *dout, uint32_t dout_len,
		       void *din, uint32_t din_len)
{
  while (grub_get_time_us() - last_transfer < 200)
		;

	if (spi_start())
		return -1;

	// Allow EC to ramp up clock after being awaken.
	// See chrome-os-partner:32223 for more details.
	grub_microsleep (100);

	if (spi_send (dout, dout_len)) {
		stop_bus();
		return -1;
	}

	// Wait until the EC is ready.
	if (wait_for_frame()) {
		stop_bus();
		return -1;
	}

	if (spi_read(din, din_len)) {
		stop_bus();
		return -1;
	}

	stop_bus();
	return 0;
}

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

static void cros_ec_dump_data(const char *name, int cmd, const void *data, int len)
{
  (void) name;
  (void) cmd;
  (void) data;
  (void) len;
#ifdef DEBUG
	const uint8_t *bytes = data;
	int i;

	printf("%s: ", name);
	if (cmd != -1)
		printf("cmd=%#x: ", cmd);
	for (i = 0; i < len; i++)
		printf("%02x ", bytes[i]);
	printf("\n");
#endif
}

/**
 * Create a request packet for protocol version 3.
 *
 * @param rq		Request structure to fill
 * @param rq_size	Size of request structure, including data
 * @param cmd		Command to send (EC_CMD_...)
 * @param cmd_version	Version of command to send (EC_VER_...)
 * @param dout          Output data (may be NULL If dout_len=0)
 * @param dout_len      Size of output data in bytes
 * @return packet size in bytes, or <0 if error.
 */
static int create_proto3_request(struct ec_host_request *rq, int rq_size,
				 int cmd, int cmd_version,
				 const void *dout, int dout_len)
{
	int out_bytes = dout_len + sizeof(*rq);

	/* Fail if output size is too big */
	if (out_bytes > rq_size) {
		printf("%s: Cannot send %d bytes\n", __func__, dout_len);
		return -EC_RES_REQUEST_TRUNCATED;
	}

	/* Fill in request packet */
	rq->struct_version = EC_HOST_REQUEST_VERSION;
	rq->checksum = 0;
	rq->command = cmd;
	rq->command_version = cmd_version;
	rq->reserved = 0;
	rq->data_len = dout_len;

	/* Copy data after header */
	memcpy(rq + 1, dout, dout_len);

	/* Write checksum field so the entire packet sums to 0 */
	rq->checksum = (uint8_t)(-cros_ec_calc_checksum(rq, out_bytes));

	cros_ec_dump_data("out", cmd, rq, out_bytes);

	/* Return size of request packet */
	return out_bytes;
}

/**
 * Prepare the device to receive a protocol version 3 response.
 *
 * @param rs_size	Maximum size of response in bytes
 * @param din_len       Maximum amount of data in the response
 * @return maximum expected number of bytes in response, or <0 if error.
 */
static int prepare_proto3_response_buffer(int rs_size, int din_len)
{
	int in_bytes = din_len + sizeof(struct ec_host_response);

	/* Fail if input size is too big */
	if (in_bytes > rs_size) {
		printf("%s: Cannot receive %d bytes\n", __func__, din_len);
		return -EC_RES_RESPONSE_TOO_BIG;
	}

	/* Return expected size of response packet */
	return in_bytes;
}

/**
 * Process a protocol version 3 response packet.
 *
 * @param resp		Response structure to parse
 * @param dinp          Returns pointer to response data
 * @param din_len       Maximum size of data in response in bytes
 * @return number of bytes of response data, or <0 if error
 */
static int handle_proto3_response(struct ec_host_response *rs,
				  uint8_t **dinp, int din_len)
{
	int in_bytes;
	int csum;

	cros_ec_dump_data("in-header", -1, rs, sizeof(*rs));

	/* Check input data */
	if (rs->struct_version != EC_HOST_RESPONSE_VERSION) {
		printf("%s: EC response version mismatch\n", __func__);
		return -EC_RES_INVALID_RESPONSE;
	}

	if (rs->reserved) {
		printf("%s: EC response reserved != 0\n", __func__);
		return -EC_RES_INVALID_RESPONSE;
	}

	if (rs->data_len > din_len) {
		printf("%s: EC returned too much data\n", __func__);
		return -EC_RES_RESPONSE_TOO_BIG;
	}

	cros_ec_dump_data("in-data", -1, rs + sizeof(*rs), rs->data_len);

	/* Update in_bytes to actual data size */
	in_bytes = sizeof(*rs) + rs->data_len;

	/* Verify checksum */
	csum = cros_ec_calc_checksum(rs, in_bytes);
	if (csum) {
		printf("%s: EC response checksum invalid: 0x%02x\n", __func__,
		      csum);
		return -EC_RES_INVALID_CHECKSUM;
	}

	/* Return error result, if any */
	if (rs->result)
		return -(int)rs->result;

	/* If the caller wants the response data, copy it out */
	if (dinp)
		memcpy(dinp, rs + 1, din_len);

	return rs->data_len;
}

static int send_command_proto3_work(int cmd, int cmd_version,
				    const void *dout, int dout_len,
				    void *dinp, int din_len)
{
	int out_bytes, in_bytes;
	int rv;

	/* Create request packet */
	out_bytes = create_proto3_request(proto3_request, proto3_request_size,
					  cmd, cmd_version, dout, dout_len);
	if (out_bytes < 0)
		return out_bytes;

	/* Prepare response buffer */
	in_bytes = prepare_proto3_response_buffer(proto3_response_size,
						  din_len);

	if (in_bytes < 0)
		return in_bytes;

	rv = send_packet(proto3_request, out_bytes,
				      proto3_response, in_bytes);

	if (rv < 0)
		return rv;

	/* Process the response */
	return handle_proto3_response(proto3_response, dinp, din_len);
}

static int send_command_proto3(int cmd, int cmd_version,
			       const void *dout, int dout_len,
			       void *dinp, int din_len)
{
	int rv;

	rv = send_command_proto3_work(cmd, cmd_version, dout, dout_len,
				      dinp, din_len);

	/* If the command doesn't complete, wait a while */
	if (rv == -EC_RES_IN_PROGRESS) {
		struct ec_response_get_comms_status resp;
		uint64_t start;

		/* Wait for command to complete */
		start = grub_get_time_ms();
		do {
			int ret;

			mdelay(50);	/* Insert some reasonable delay */
			ret = send_command_proto3_work(EC_CMD_GET_COMMS_STATUS,
				0, NULL, 0, &resp, sizeof(resp));
			if (ret < 0)
				return ret;

			if (grub_get_time_ms() - start > CROS_EC_CMD_TIMEOUT_MS) {
				printf("%s: Command %#02x timeout",
				      __func__, cmd);
				return -EC_RES_TIMEOUT;
			}
		} while (resp.flags & EC_COMMS_STATUS_PROCESSING);

		/* OK it completed, so read the status response */
		rv = send_command_proto3_work(EC_CMD_RESEND_RESPONSE,
			0, NULL, 0, dinp, din_len);
	}

	return rv;
}

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

	/* If the command doesn't complete, wait a while */
	if (len == -EC_RES_IN_PROGRESS) {
		struct ec_response_get_comms_status resp;
		uint64_t start;

		/* Wait for command to complete */
		start = grub_get_time_ms();
		do {
			int ret;

			mdelay(50);	/* Insert some reasonable delay */
			ret = send_command(
				EC_CMD_GET_COMMS_STATUS,
				0, NULL, 0, &resp, sizeof(resp));
			if (ret < 0)
				return ret;

			if (grub_get_time_ms() - start > CROS_EC_CMD_TIMEOUT_MS) {
				printf("%s: Command %#02x timeout",
				      __func__, cmd);
				return -EC_RES_TIMEOUT;
			}
		} while (resp.flags & EC_COMMS_STATUS_PROCESSING);

		/* OK it completed, so read the status response */
		len = send_command(
			EC_CMD_RESEND_RESPONSE,
			0, NULL, 0, din, din_len);
	}

#ifdef DEBUG
	printf("%s: len=%d, din=%p\n", __func__, len, din);
#endif

	return len;
}

static int ec_command(int cmd, int cmd_version,
		      const void *dout, int dout_len,
		      void *din, int din_len)
{
	if (!initialized && cros_ec_init())
		return -1;

	return send_command_func(cmd, cmd_version, dout, dout_len,
				 din, din_len);
}

static int cros_ec_get_protocol_info(int devidx,
				     struct ec_response_get_protocol_info *info)
{
	if (ec_command(EC_CMD_PASSTHRU_OFFSET(devidx) +
		       EC_CMD_GET_PROTOCOL_INFO, 0, NULL, 0, info,
		       sizeof(*info)) < (int)sizeof(*info))
		return -1;

	return 0;
}

int cros_ec_scan_keyboard(struct cros_ec_keyscan *scan)
{
	if (ec_command(EC_CMD_MKBP_STATE, 0, NULL, 0, scan,
		       sizeof(*scan)) < (int)sizeof(*scan))
		return -1;

	return 0;
}

static int set_max_proto3_sizes(int request_size, int response_size,
				int passthru_size)
{
	grub_free(proto3_request);
	grub_free(proto3_response);

	if (request_size)
		proto3_request = grub_malloc(request_size);
	else
		proto3_request = NULL;
	if (response_size)
		proto3_response = grub_malloc(response_size);
	else
		proto3_response = NULL;

	proto3_request_size = request_size;
	proto3_response_size = response_size;

	max_param_size = proto3_request_size - sizeof(struct ec_host_request);

	passthru_param_size = passthru_size - sizeof(struct ec_host_request);
	if (passthru_param_size > max_param_size)
		passthru_param_size = max_param_size;

	return 0;
}


int cros_ec_init(void)
{
	if (initialized)
		return 0;

	initialized = 1;

	// Figure out what protocol version to use.

	send_command_func = &send_command_proto3;
	if (set_max_proto3_sizes(DEFAULT_BUF_SIZE, DEFAULT_BUF_SIZE,
				 DEFAULT_BUF_SIZE))
	  return -1;

	struct ec_response_get_protocol_info info;
	if (cros_ec_get_protocol_info(0, &info)) {
	  set_max_proto3_sizes(0, 0, 0);
	  send_command_func = NULL;
	} else {
	  printf("%s: CrosEC protocol v3 supported (%d, %d)\n",
		 __func__,
		 info.max_request_packet_size,
		 info.max_response_packet_size);

	  set_max_proto3_sizes(info.max_request_packet_size,
			       info.max_response_packet_size,
			       0);
	}

	if (!send_command_func) {
		// Fall back to protocol version 2.
		send_command_func = &send_command_proto2;
		max_param_size = EC_PROTO2_MAX_PARAM_SIZE;
	}

	return 0;
}
