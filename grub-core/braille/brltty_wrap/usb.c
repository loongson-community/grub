#include "prologue.h"

#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include <errno.h>
#include <locale.h>
#include <grub/misc.h>
#include <grub/time.h>
#include <grub/usb.h>
#include "io_usb.h"
#include "usb_internal.h"
#include "device.h"

struct UsbDeviceExtensionStruct
{
  struct grub_usb_device dev;
};

UsbDevice *
usbFindDevice (UsbDeviceChooser chooser, void *data)
{
  UsbDevice *dev_out = NULL;
  auto int hook (struct grub_usb_device *dev);
  int hook (struct grub_usb_device *dev)
  {
    dev_out = usbTestDevice ((struct UsbDeviceExtensionStruct *) dev,
			     chooser, data);
    return !!dev_out;
  }

  grub_usb_iterate (hook);
  return dev_out;
}

int
usbDisableAutosuspend (UsbDevice *device)
{
  return 1;
}

/* FIXME: Implement claim.  */
int
usbClaimInterface (UsbDevice *device, unsigned char interface)
{
  return 1;
}

int
usbReleaseInterface (UsbDevice *device, unsigned char interface)
{
  return 1;
}

int
usbAllocateEndpointExtension (UsbEndpoint *endpoint)
{
  return 1;
}

void
usbDeallocateEndpointExtension (UsbEndpointExtension *eptx)
{
}

void
usbDeallocateDeviceExtension (UsbDeviceExtension *dev)
{
}

/* FIXME: Support partial and respect timeout.  */
ssize_t
usbControlTransfer (UsbDevice *device, uint8_t direction, uint8_t recipient,
		    uint8_t type, uint8_t request, uint16_t value,
		    uint16_t index, void *buffer, uint16_t length,
		    int timeout)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;
  grub_usb_err_t result;

  result = grub_usb_control_msg (dev, direction|recipient|type,
				 request, value, index, length, buffer);
  if (result)
    return -1;
  return length;
}

ssize_t
usbReadEndpoint (UsbDevice *device, unsigned char endpointNumber,
		 void *buffer, size_t length,
		 int timeout)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;
  const UsbEndpoint *endpoint;
  const UsbEndpointDescriptor *descriptor;
  grub_usb_err_t err = 0;
  grub_size_t actual;
  int result;

  endpoint = usbGetInputEndpoint(device, endpointNumber);
  if (!endpoint)
    return -1;

  descriptor = endpoint->descriptor;

  err = grub_usb_bulk_read_extended (dev,
				     descriptor->bEndpointAddress,
				     length, buffer, timeout, &actual);
  if (err)
    return -1;
  result = actual;

  if (!usbApplyInputFilters (device, buffer, length, &result))
    return -EIO;

  return result;
}

/* FIXME: support partial.  */
ssize_t
usbWriteEndpoint (UsbDevice *device, unsigned char endpointNumber,
		  const void *buffer, size_t length,
		  int timeout)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;
  const UsbEndpoint *endpoint;
  const UsbEndpointDescriptor *descriptor;
  grub_usb_err_t err = 0;

  endpoint = usbGetInputEndpoint (device, endpointNumber);
  if (!endpoint)
    return -1;

  descriptor = endpoint->descriptor;

  err = grub_usb_bulk_write (dev,
			     descriptor->bEndpointAddress,
			     length, buffer);
  if (err)
    return -1;

  return length;
}

int
usbSetConfiguration (UsbDevice *device, unsigned char configuration)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;
  grub_usb_err_t err;
  err = grub_usb_set_configuration (dev, configuration);
  return !err;
}

void *
usbSubmitRequest (UsbDevice *device,
		  unsigned char endpoint,
		  void *buffer,
		  size_t size,
		  void *data)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;
  return grub_usb_bulk_read_background (dev, endpoint, size, buffer);
}

int
usbCancelRequest (UsbDevice *device, void *request)
{
  grub_usb_cancel_transfer (request);
  return 1;
}

int
usbReadDeviceDescriptor (UsbDevice *device)
{
  grub_usb_device_t dev = (grub_usb_device_t) device->extension;

  COMPILE_TIME_ASSERT(sizeof (device->descriptor) == sizeof (dev->descdev));

  memcpy (&device->descriptor, &dev->descdev, sizeof (device->descriptor));
  return 1;
}

/* FIXME: Implement this.  */
int
usbSetAlternative (UsbDevice *device, unsigned char interface,
		   unsigned char alternative)
{
  return 1;
}

/* FIXME: Implement this.  */
void *
usbReapResponse (UsbDevice *device, unsigned char endpointAddress,
		 UsbResponse *response, int wait)
{
  return NULL;
}

void
usbForgetDevices (void) {
}
