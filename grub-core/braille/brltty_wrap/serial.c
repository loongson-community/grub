#include "prologue.h"

#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include <errno.h>
#include <locale.h>
#include <grub/misc.h>
#include <grub/time.h>
#include <grub/serial.h>

#include "io_serial.h"
#include "log.h"

struct SerialDeviceStruct
{
  struct grub_serial_port *port;
  int pending;
  struct grub_serial_config config;
  int pending_config;
};

int
isSerialDevice (const char **path)
{
  return (grub_strncmp (*path, "serial/", sizeof ("serial/") - 1) == 0);
}

SerialDevice *
serialOpenDevice (const char *path)
{
  struct grub_serial_port *port;
  struct SerialDeviceStruct *ret;
  if (grub_strncmp (path, "serial/", sizeof ("serial/") - 1) != 0)
    return 0;
  port = grub_serial_find (path + sizeof ("serial/") - 1);
  if (!port)
    return NULL;
  ret = grub_malloc (sizeof (*ret));
  if (!ret)
    return NULL;
  ret->port = port;
  ret->pending = -1;
  ret->config = port->config;
  ret->pending_config = 0;
  return ret;
}

void
serialCloseDevice (SerialDevice *serial)
{
  grub_free (serial);
}

int
serialAwaitInput (SerialDevice *serial, int timeout)
{
  grub_uint64_t end;
  if (serial->pending != -1)
    return 1;
  end = grub_get_time_ms () + timeout;
  do
    serial->pending = serial->port->driver->fetch (serial->port);
  while (serial->pending == -1 && grub_get_time_ms () < end);
  return serial->pending != -1;
}

ssize_t
serialReadData (SerialDevice *serial,
		void *buffer, size_t size,
		int initialTimeout, int subsequentTimeout)
{
  grub_uint64_t end;
  grub_uint8_t *ptr = buffer;
  if (serial->pending_config)
    {
      grub_err_t err;
      err = serial->port->driver->configure (serial->port, &serial->config);
      if (err)
	return -1;
      serial->pending_config = 0;
    }
  for (ptr = buffer; ptr < (grub_uint8_t *) buffer + size; ptr++)
    {
      int key;
      if (serial->pending)
	{
	  *ptr = serial->pending;
	  serial->pending = -1;
	  continue;
	}
      end = grub_get_time_ms () + ((ptr == buffer) ? initialTimeout
				   : subsequentTimeout);
      do
	key = serial->port->driver->fetch (serial->port);
      while (key == -1 && grub_get_time_ms () < end);
      *ptr = key;
    }
  return ptr - (grub_uint8_t *) buffer;
}

int
serialSetParity (SerialDevice *serial, SerialParity parity)
{
  if (!serial->pending_config)
    {
      serial->config = serial->port->config;
      serial->pending_config = 1;
    }

  switch (parity) 
    {
    case SERIAL_PARITY_NONE:
      serial->config.parity = GRUB_SERIAL_PARITY_NONE;
      return 1;

    case SERIAL_PARITY_ODD:
      serial->config.parity = GRUB_SERIAL_PARITY_ODD;
      return 1;

    case SERIAL_PARITY_EVEN:
      serial->config.parity = GRUB_SERIAL_PARITY_EVEN;
      return 1;

    default:
      logMessage (LOG_WARNING, "unsupported serial parity: %d", parity);
      return 0;
    }
}

int
serialRestartDevice (SerialDevice *serial, unsigned int baud)
{
  grub_err_t err;

  serial->pending = -1;
  if (!serial->pending_config)
    serial->config = serial->port->config;
  serial->config.speed = baud;
  err = serial->port->driver->configure (serial->port, &serial->config);
  if (err)
    return 0;
  return 1;
}

ssize_t
serialWriteData (SerialDevice *serial, const void *data, size_t size)
{
  const grub_uint8_t *ptr;
  if (serial->pending_config)
    {
      grub_err_t err;
      err = serial->port->driver->configure (serial->port, &serial->config);
      if (err)
	return -1;
      serial->pending_config = 0;
    }
  for (ptr = data; ptr < (grub_uint8_t *) data + size; ptr++)
    serial->port->driver->put (serial->port, *ptr);
  return size;
}
