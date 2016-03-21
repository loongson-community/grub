/* dwc2.c - DWC2 Support.  */
/*
 *  GRUB  --  GRand Unified Bootloader
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

#include <grub/dl.h>
#include <grub/mm.h>
#include <grub/usb.h>
#include <grub/usbtrans.h>
#include <grub/misc.h>
#include <grub/time.h>
#include <grub/loader.h>
#include <grub/disk.h>
#include <grub/dma.h>
#include <grub/cache.h>

GRUB_MOD_LICENSE ("GPLv3+");

/* This simple GRUB implementation of DWC2 driver:
 *      - assumes no IRQ
 *      - is not supporting isochronous transfers (iTD, siTD)
 *      - is not supporting interrupt transfers
 */


/* Operational registers offsets */
enum
{
  GRUB_DWC2_PORT_STAT_CMD = 0x440,
  GRUB_DWC2_CHANNEL_REGISTERS = 0x500,
};

enum
  {
    GRUB_DWC2_CHANNEL_EP_CHAR = 0x00,
    GRUB_DWC2_CHANNEL_INTERRUPT = 0x08,
    GRUB_DWC2_CHANNEL_SIZE = 0x10,
    GRUB_DWC2_CHANNEL_DATA = 0x14,
    GRUB_DWC2_CHANNEL_MAX = 0x20,
  };

#define NAK_RETRY_COUNT 5
#define NAK_RETRY_DELAY_MS 1

/* Operational register PORT_STAT_CMD bits */
enum
{
  GRUB_DWC2_PORT_CONNECT = (1 << 0),
  GRUB_DWC2_PORT_CONNECT_CH = (1 << 1),
  GRUB_DWC2_PORT_ENABLED = (1 << 2),
  GRUB_DWC2_PORT_ENABLED_CH = (1 << 3),
  GRUB_DWC2_PORT_OVERCUR = (1 << 4),
  GRUB_DWC2_PORT_OVERCUR_CH = (1 << 5),
  GRUB_DWC2_PORT_RESUME = (1 << 6),
  GRUB_DWC2_PORT_SUSPEND = (1 << 7),
  GRUB_DWC2_PORT_RESET = (1 << 8),
  GRUB_DWC2_PORT_LINE_STAT = (3 << 10),
  GRUB_DWC2_PORT_POWER = (1 << 12),
  GRUB_DWC2_PORT_OWNER = (1 << 13),
  GRUB_DWC2_PORT_INDICATOR = (3 << 14),
  GRUB_DWC2_PORT_TEST = (0xf << 16),
  GRUB_DWC2_PORT_WON_CONN_E = (1 << 20),
  GRUB_DWC2_PORT_WON_DISC_E = (1 << 21),
  GRUB_DWC2_PORT_WON_OVER_E = (1 << 22),

  GRUB_DWC2_PORT_LINE_SE0 = (0 << 10),
  GRUB_DWC2_PORT_LINE_K = (1 << 10),
  GRUB_DWC2_PORT_LINE_J = (2 << 10),
  GRUB_DWC2_PORT_LINE_UNDEF = (3 << 10),
  GRUB_DWC2_PORT_LINE_LOWSP = GRUB_DWC2_PORT_LINE_K,	/* K state means low speed */
  GRUB_DWC2_PORT_WMASK = ~(GRUB_DWC2_PORT_CONNECT_CH
			   | GRUB_DWC2_PORT_ENABLED
			   | GRUB_DWC2_PORT_ENABLED_CH
			   | GRUB_DWC2_PORT_OVERCUR_CH)
};
struct grub_dwc2
{
  volatile grub_uint32_t *iobase;	/* Operational registers */
  grub_uint16_t busy;
  grub_uint32_t reset;		/* bits 1-15 are flags if port was reset from connected time or not */
  struct grub_dwc2 *next;
};

static struct grub_dwc2 *dwc2;

/* Operational registers access functions */
static inline grub_uint32_t
grub_dwc2_oper_read32 (struct grub_dwc2 *e, grub_uint32_t addr)
{
  return
    grub_le_to_cpu32 (*
		      ((volatile grub_uint32_t *) e->iobase +
		       (addr / sizeof (grub_uint32_t))));
}

static inline void
grub_dwc2_oper_write32 (struct grub_dwc2 *e, grub_uint32_t addr,
		   grub_uint32_t value)
{
  *((volatile grub_uint32_t *) e->iobase + (addr / sizeof (grub_uint32_t))) =
    grub_cpu_to_le32 (value);
}

static inline void
grub_dwc2_channel_write32 (struct grub_dwc2 *e, int channel,
			   grub_uint32_t addr,
			   grub_uint32_t value)
{
  grub_dwc2_oper_write32 (e, GRUB_DWC2_CHANNEL_REGISTERS
			  + addr + GRUB_DWC2_CHANNEL_MAX * channel, value);
}

static inline grub_uint32_t
grub_dwc2_channel_read32 (struct grub_dwc2 *e, int channel,
			  grub_uint32_t addr)
{
  return grub_dwc2_oper_read32 (e, GRUB_DWC2_CHANNEL_REGISTERS
				+ addr + GRUB_DWC2_CHANNEL_MAX * channel);
}

static inline grub_uint32_t
grub_dwc2_port_read (struct grub_dwc2 *e)
{
  return grub_dwc2_oper_read32 (e, GRUB_DWC2_PORT_STAT_CMD);
}

static inline void
grub_dwc2_port_resbits (struct grub_dwc2 *e,
			grub_uint32_t bits)
{
  grub_dwc2_oper_write32 (e, GRUB_DWC2_PORT_STAT_CMD,
			  grub_dwc2_port_read (e) & GRUB_DWC2_PORT_WMASK &
			  ~(bits));
  grub_dwc2_port_read (e);
}

static inline void
grub_dwc2_port_setbits (struct grub_dwc2 *e,
			grub_uint32_t bits)
{
  grub_dwc2_oper_write32 (e, GRUB_DWC2_PORT_STAT_CMD,
			  (grub_dwc2_port_read (e) &
			   GRUB_DWC2_PORT_WMASK) | bits);
  grub_dwc2_port_read (e);
}

/* DWC2 HC init */
static grub_usb_err_t
grub_dwc2_init (struct grub_dwc2 *e)
{
  // WIP

  grub_dwc2_port_setbits (e, GRUB_DWC2_PORT_POWER);
  return GRUB_USB_ERR_NONE;
}

/* PCI iteration function... */
void
grub_dwc2_init_device (volatile void *regs)
{
  struct grub_dwc2 *e;

  /* Allocate memory for the controller and fill basic values. */
  e = grub_zalloc (sizeof (*e));
  if (!e)
    return;
  e->iobase = regs;

  grub_dprintf ("dwc2", "DWC2 init %p\n", regs);

  grub_dwc2_init (e);
  
  /* Link to dwc2 now that initialisation is successful.  */
  e->next = dwc2;
  dwc2 = e;

  grub_dprintf ("dwc2", "DWC2 grub_dwc2_pci_iter: OK at all\n");
}

static int
grub_dwc2_iterate (grub_usb_controller_iterate_hook_t hook, void *hook_data)
{
  struct grub_dwc2 *e;
  struct grub_usb_controller dev;

  for (e = dwc2; e; e = e->next)
    {
      dev.data = e;
      if (hook (&dev, hook_data))
	return 1;
    }

  return 0;
}


struct grub_dwc2_transfer_controller_data
{
  int current_transaction;
  int transferred;
  int channel;
  int nak_should_retry;
  grub_uint64_t nak_retry_at;
  int nak_retry_cnt;
};

static grub_usb_err_t
program_transaction (grub_usb_controller_t dev,
		     grub_usb_transfer_t transfer)
{
  struct grub_dwc2_transfer_controller_data *cdata
    = transfer->controller_data;
  struct grub_dwc2 *e = (struct grub_dwc2 *) dev->data;
  grub_usb_transaction_t tr
    = &transfer->transactions[cdata->current_transaction];
  grub_uint32_t size_reg;
  grub_uint32_t ep_char = 0;

  grub_dprintf ("dwc2", "program transaction\n");

  if (tr->size >= (1 << 19) || transfer->max >= (1 << 11))
    return GRUB_USB_ERR_INTERNAL;

  grub_dprintf ("dwc2", "program transaction: sanity checks done\n");
  
  /* Claer interrupts.  */
  grub_dwc2_channel_write32 (e, cdata->channel,
			     GRUB_DWC2_CHANNEL_INTERRUPT, ~0);
  
  // FIXME: support aggregating several packets in one dwc2-side transaction
  size_reg = tr->size | (1 << 19);
  if (tr->pid == GRUB_USB_TRANSFER_TYPE_SETUP)
    size_reg |= 0x60000000;
  else
    size_reg |= tr->toggle << 30;

  ep_char = (transfer->max & 0x7ff) | (transfer->endpoint << 11)
    | ((tr->pid == GRUB_USB_TRANSFER_TYPE_IN) << 15)
    | ((transfer->dev->speed == GRUB_USB_SPEED_LOW) << 17)
    | (1 << 20) | (transfer->devaddr << 22) | (1 << 31);

  switch (transfer->type)
    {
    case GRUB_USB_TRANSACTION_TYPE_CONTROL:
      break;
    case GRUB_USB_TRANSACTION_TYPE_BULK:
      ep_char |= 1 << 19;
      break;
    }
  grub_dprintf ("dwc2", "program transaction: data=0x%08x, "
		"size_reg=0x%08x, ep_char=0x%x\n",
		tr->data, size_reg, ep_char);
  grub_dwc2_channel_write32 (e, cdata->channel,
			     GRUB_DWC2_CHANNEL_DATA, tr->data);
  grub_dwc2_channel_write32 (e, cdata->channel, GRUB_DWC2_CHANNEL_SIZE,
			     size_reg);
  grub_dwc2_channel_write32 (e, cdata->channel,
			     GRUB_DWC2_CHANNEL_EP_CHAR, ep_char);
  grub_dprintf ("dwc2", "program transaction: done\n");
  return GRUB_USB_ERR_NONE;
}

static void
stop_channel (struct grub_dwc2 *e, int channel)
{
  grub_uint64_t endtime;
  e->busy &= ~(1 << channel);

  if (!(grub_dwc2_channel_read32 (e, channel, GRUB_DWC2_CHANNEL_EP_CHAR)
	& (1 << 31)))
    {
      grub_dwc2_channel_write32 (e, channel,
				 GRUB_DWC2_CHANNEL_INTERRUPT, ~0);
      grub_dprintf ("dwc2", "channel already stopped\n");
      return;
    }

  grub_dprintf ("dwc2", "forceful DWC2 channel stop\n");
  grub_dwc2_channel_write32 (e, channel, GRUB_DWC2_CHANNEL_EP_CHAR,
			     (1 << 30) | (1 << 31));
  endtime = grub_get_time_ms () + 5;
  while (grub_dwc2_channel_read32 (e, channel, GRUB_DWC2_CHANNEL_EP_CHAR)
	 & (1 << 31))
    if (grub_get_time_ms () > endtime)
      {
	grub_dprintf ("dwc2", "forceful DWC2 channel stop timeout\n");
	grub_dwc2_channel_write32 (e, channel,
				   GRUB_DWC2_CHANNEL_INTERRUPT, ~0);
	return;
      }
  grub_dprintf ("dwc2", "forceful DWC2 channel stop successful\n");
  grub_dwc2_channel_write32 (e, channel,
			     GRUB_DWC2_CHANNEL_INTERRUPT, ~0);
}

static grub_usb_err_t
grub_dwc2_setup_transfer (grub_usb_controller_t dev,
			  grub_usb_transfer_t transfer)
{
  struct grub_dwc2 *e = dev->data;
  struct grub_dwc2_transfer_controller_data *cdata;
  grub_usb_err_t err;

  grub_dprintf ("dwc2", "setup_transfer\n");

  /* Allocate memory for controller transfer data.  */
  cdata = grub_zalloc (sizeof (*cdata));
  if (!cdata)
    return GRUB_USB_ERR_INTERNAL;

  transfer->controller_data = cdata;
  // FIXME: support more channels.
  //  if (e->busy & 1)
  //  return GRUB_USB_ERR_INTERNAL;

  cdata->channel = 0;
  e->busy |= 1 << cdata->channel;

  cdata->nak_retry_cnt = NAK_RETRY_COUNT;
  err = program_transaction (dev, transfer);
  if (err)
    stop_channel (e, cdata->channel);
  return err;
}

static grub_usb_err_t
grub_dwc2_check_transfer (grub_usb_controller_t dev,
			  grub_usb_transfer_t transfer, grub_size_t * actual)
{
  struct grub_dwc2 *e = dev->data;
  struct grub_dwc2_transfer_controller_data *cdata =
    transfer->controller_data;
  grub_uint32_t intr;
  grub_usb_err_t err;
  grub_usb_transaction_t tr
    = &transfer->transactions[cdata->current_transaction];

  if (cdata->nak_should_retry)
    {
      if ((grub_int64_t) (grub_get_time_ms () - cdata->nak_retry_at) < 0)
	return GRUB_USB_ERR_WAIT;
      cdata->nak_should_retry = 0;
      err = program_transaction (dev, transfer);
      if (err)
	{
	  stop_channel (e, cdata->channel);
	  return err;
	}
      return GRUB_USB_ERR_WAIT;
    }

  intr = grub_dwc2_channel_read32 (e, cdata->channel,
				   GRUB_DWC2_CHANNEL_INTERRUPT);
  grub_dprintf ("dwc2", "check transfer: 0x%x\n", intr);

  /* Case 1: wait. */
  if ((intr & 2) == 0)
    return GRUB_USB_ERR_WAIT;

  grub_dprintf ("dwc2", "check transfer: 0x%x\n", intr);
  /* Otherwise ack interrupts.  */
  grub_dwc2_channel_write32 (e, cdata->channel,
			     GRUB_DWC2_CHANNEL_INTERRUPT, intr);
  /* Case 2: NAK or frame overrrun retry.  */
  if (!((intr & 1) || (intr & 0x20)) && (intr & 0x210)
      && cdata->nak_retry_cnt)
    {
      cdata->nak_should_retry = 1;
      cdata->nak_retry_cnt--;
      cdata->nak_retry_at = grub_get_time_ms () + NAK_RETRY_DELAY_MS;
      return GRUB_USB_ERR_WAIT;
    }

  /* Case 3: error. */
  if (!((intr & 1) || (intr & 0x20)))
    {
      stop_channel (e, cdata->channel);
      if (intr & 0x100)
	return GRUB_USB_ERR_BABBLE;
      if (intr & 0x08)
	return GRUB_USB_ERR_STALL;
      if (intr & 0x80)
	return GRUB_USB_ERR_DATA;
      return GRUB_USB_ERR_NAK;
    }
  
  /* Case 4: Success: add bytes to transfered and schedule
     next transaction if any.  */
  if (tr->pid != GRUB_USB_TRANSFER_TYPE_SETUP)
    {
      int trans;
      trans = tr->size
	- (grub_dwc2_channel_read32 (e, 0, GRUB_DWC2_CHANNEL_SIZE)
	   & 0x7ffff);
      grub_dprintf ("dwc2", "transfered 0x%x\n", trans);

      cdata->transferred += trans;
    }
  if (++cdata->current_transaction < transfer->transcnt)
    {
      grub_dprintf ("dwc2", "transfer continue: %d\n", cdata->current_transaction);
      cdata->nak_retry_cnt = NAK_RETRY_COUNT;
      err = program_transaction (dev, transfer);
      if (err)
	{
	  stop_channel (e, cdata->channel);
	  return err;
	}
      return GRUB_USB_ERR_WAIT;
    }

  grub_dprintf ("dwc2", "transfer complete\n");
  e->busy &= ~(1 << cdata->channel);
  *actual = cdata->transferred;
  return GRUB_USB_ERR_NONE;
}

static grub_usb_err_t
grub_dwc2_cancel_transfer (grub_usb_controller_t dev,
			   grub_usb_transfer_t transfer)
{
  struct grub_dwc2 *e = dev->data;
  struct grub_dwc2_transfer_controller_data *cdata =
    transfer->controller_data;
  stop_channel (e, cdata->channel);
  return GRUB_USB_ERR_NONE;
}

static int
grub_dwc2_hubports (grub_usb_controller_t dev __attribute__((unused)))
{
  return 1;
}

static grub_usb_err_t
grub_dwc2_reset_port (grub_usb_controller_t dev,
		      unsigned int port)
{
  struct grub_dwc2 *e = (struct grub_dwc2 *) dev->data;
  grub_uint64_t endtime;

  grub_dprintf ("dwc2",
		"portstatus: begin, iobase=%p, port=%d\n",
		e->iobase, port);

  /* In any case we need to disable port:
   * - if enable==false - we should disable port
   * - if enable==true we will do the reset and the specification says
   *   PortEnable should be FALSE in such case */
  /* Disable the port and wait for it. */
  grub_dwc2_port_setbits (e, GRUB_DWC2_PORT_ENABLED);
  endtime = grub_get_time_ms () + 1000;
  while (grub_dwc2_port_read (e) & GRUB_DWC2_PORT_ENABLED)
    if (grub_get_time_ms () > endtime)
      return GRUB_USB_ERR_TIMEOUT;

  grub_dprintf ("dwc2", "portstatus: enable\n");

  grub_boot_time ("Resetting port %d", port);

  /* Now we will do reset - if HIGH speed device connected, it will
   * result in Enabled state, otherwise port remains disabled. */
  /* Set RESET bit for 50ms */
  grub_dwc2_port_setbits (e, GRUB_DWC2_PORT_RESET);
  grub_millisleep (50);

  /* Reset RESET bit and wait for the end of reset */
  grub_dwc2_port_resbits (e, GRUB_DWC2_PORT_RESET);
  endtime = grub_get_time_ms () + 1000;
  while (grub_dwc2_port_read (e) & GRUB_DWC2_PORT_RESET)
    if (grub_get_time_ms () > endtime)
      return GRUB_USB_ERR_TIMEOUT;
  grub_millisleep (1);
  grub_boot_time ("Port %d reset", port);
  /* Remember "we did the reset" - needed by detect_dev */
  e->reset |= (1 << port);
  /* Test if port enabled, i.e. HIGH speed device connected */
  if ((grub_dwc2_port_read (e) & GRUB_DWC2_PORT_ENABLED) != 0)	/* yes! */
    {
      grub_dprintf ("dwc2", "portstatus: Enabled!\n");
      /* "Reset recovery time" (USB spec.) */
      grub_millisleep (10);
    }

  grub_dprintf ("dwc2", "portstatus: end\n");

  return GRUB_USB_ERR_NONE;
}

static grub_usb_speed_t
grub_dwc2_detect_dev (grub_usb_controller_t dev, int port __attribute__ ((unused)), int *changed)
{
  struct grub_dwc2 *e = (struct grub_dwc2 *) dev->data;
  grub_uint32_t status;

  status = grub_dwc2_port_read (e);

  /* Connect Status Change bit - it detects change of connection */
  if (status & GRUB_DWC2_PORT_CONNECT_CH)
    {
      *changed = 1;
      /* Reset bit Connect Status Change */
      grub_dwc2_port_setbits (e, GRUB_DWC2_PORT_CONNECT_CH);
      grub_dprintf ("dwc2", "detect_dev=0x%x\n", status);
    }
  else
    *changed = 0;

  if (!(status & GRUB_DWC2_PORT_CONNECT))
    {				/* We should reset related "reset" flag in not connected state */
      e->reset &= ~(1 << 0);
      return GRUB_USB_SPEED_NONE;
    }
  switch ((status >> 17) & 3)
    {
    case 0:
      return GRUB_USB_SPEED_HIGH;
    case 1:
      return GRUB_USB_SPEED_FULL;
    case 2:
      return GRUB_USB_SPEED_LOW;
    default:
      return GRUB_USB_SPEED_NONE;
    }
}

static grub_err_t
grub_dwc2_restore_hw (void)
{
  struct grub_dwc2 *e;

  /* We should re-enable all DWC2 HW similarly as on inithw */
  for (e = dwc2; e; e = e->next)
    {
      /* Check if DWC2 is halted and halt it if not */
      if (grub_dwc2_init (e) != GRUB_USB_ERR_NONE)
	grub_error (GRUB_ERR_IO, "restore_hw: DWC2 couldn't reinit");
    }

  return GRUB_ERR_NONE;
}

static grub_err_t
grub_dwc2_fini_hw (int noreturn __attribute__ ((unused)))
{
#if 0
  struct grub_dwc2 *e;

  /* We should disable all DWC2 HW to prevent any DMA access etc. */
  for (e = dwc2; e; e = e->next)
    {
      /* Disable both lists */
      grub_dwc2_oper_write32 (e, GRUB_DWC2_COMMAND,
        ~(GRUB_DWC2_CMD_AS_ENABL | GRUB_DWC2_CMD_PS_ENABL)
        & grub_dwc2_oper_read32 (e, GRUB_DWC2_COMMAND));

      /* Check if DWC2 is halted and halt it if not */
      grub_dwc2_halt (e);

      /* Reset DWC2 */
      grub_dwc2_reset (e);
    }

  return GRUB_ERR_NONE;
#endif
  // WIP
  return GRUB_ERR_NOT_IMPLEMENTED_YET;
}

static struct grub_usb_controller_dev usb_controller = {
  .name = "dwc2",
  .iterate = grub_dwc2_iterate,
  .setup_transfer = grub_dwc2_setup_transfer,
  .check_transfer = grub_dwc2_check_transfer,
  .cancel_transfer = grub_dwc2_cancel_transfer,
  .hubports = grub_dwc2_hubports,
  .reset_port = grub_dwc2_reset_port,
  .detect_dev = grub_dwc2_detect_dev,
  /* estimated max. count of packets for one bulk transfer */
  .max_bulk_tds = 1023 
};


GRUB_MOD_INIT (dwc2)
{
  grub_stop_disk_firmware ();

  grub_boot_time ("Initing DWC2 hardware");
  grub_dwc2_pci_scan ();
  grub_boot_time ("Registering DWC2 driver");
  grub_usb_controller_dev_register (&usb_controller);
  grub_boot_time ("DWC2 driver registered");
  grub_loader_register_preboot_hook (grub_dwc2_fini_hw, grub_dwc2_restore_hw,
				     GRUB_LOADER_PREBOOT_HOOK_PRIO_DISK);
}

GRUB_MOD_FINI (dwc2)
{
  grub_dwc2_fini_hw (0);
  grub_usb_controller_dev_unregister (&usb_controller);
}
