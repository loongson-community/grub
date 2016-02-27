/* ehci.c - EHCI Support.  */
/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2011  Free Software Foundation, Inc.
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

#include <grub/misc.h>
#include <grub/mm.h>
#include <grub/time.h>
#include <grub/usb.h>
#include <grub/fdtbus.h>

static grub_err_t
dwc2_attach(const struct grub_fdtbus_dev *dev)
{
  grub_dprintf ("dwc2", "Found snps-dwc2\n");

  grub_dwc2_init_device (grub_fdtbus_map_reg (dev, 0, 0));
  return 0;
}

struct grub_fdtbus_driver dwc2 =
{
  .compatible = "snps,dwc2",
  .attach = dwc2_attach
};

void
grub_dwc2_pci_scan (void)
{
  grub_fdtbus_register (&dwc2);
}
