#include <grub/types.h>
/*
 * Hard-code the number of columns we happen to know we have right now.  It
 * would be more correct to call cros_ec_mkbp_info() at startup and determine
 * the actual number of keyboard cols from there.
 */
#define CROS_EC_KEYSCAN_COLS 13
#define CROS_EC_KEYSCAN_ROWS 8

/* Information returned by a key scan */
struct cros_ec_keyscan {
	grub_uint8_t data[CROS_EC_KEYSCAN_COLS];
};

typedef struct CrosEcBusOps
{
	int (*init)(struct CrosEcBusOps *me);

	/**
	 * Send a command to a ChromeOS EC device and return the reply.
	 *
	 * The device's internal input/output buffers are used.
	 *
	 * @param bus		ChromeOS EC bus ops
	 * @param cmd		Command to send (EC_CMD_...)
	 * @param cmd_version	Version of command to send (EC_VER_...)
	 * @param dout          Output data (may be NULL If dout_len=0)
	 * @param dout_len      Size of output data in bytes
	 * @param dinp          Returns pointer to response data
	 * @param din_len       Maximum size of response in bytes
	 * @return number of bytes in response, or -1 on error
	 */
	int (*send_command)(struct CrosEcBusOps *me, grub_uint8_t cmd,
			    int cmd_version,
			    const void *dout, grub_uint32_t dout_len,
			    void *din, grub_uint32_t din_len);

	int (*send_packet)(struct CrosEcBusOps *me,
			   const void *dout, grub_uint32_t dout_len,
			   void *din, grub_uint32_t din_len);

	/**
	 * Byte I/O functions.
	 *
	 * Read or write a sequence a bytes over the desired protocol.
	 * Used to support protocol variants - currently only implemented
	 * for LPC.
	 *
	 * @param data		Read / write data buffer
	 * @param port		I/O port
	 * @size		Number of bytes to read / write
	 */
	void (*read)(grub_uint8_t *data, grub_uint16_t port, int size);
	void (*write)(const grub_uint8_t *data, grub_uint16_t port, int size);
} CrosEcBusOps;

int cros_ec_set_bus(CrosEcBusOps *bus);
int cros_ec_scan_keyboard(struct cros_ec_keyscan *scan);
int cros_ec_init(void);
