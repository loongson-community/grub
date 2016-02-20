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

#include <grub/fdtbus.h>
#include <grub/fdt.h>
#include <grub/term.h>

static const void *dtb;

struct grub_fdtbus_device
{
  struct grub_fdtbus_device *next;
  int node;
  struct grub_fdtbus_driver *driver;
};

struct grub_fdtbus_device *devs;
struct grub_fdtbus_driver *drivers;

static int
is_compatible (struct grub_fdtbus_driver *driver,
	       int node)
{
  const char *compatible = grub_fdt_get_prop (dtb, node, "compatible",
					      0);
  return grub_strcmp (driver->compatible, compatible) == 0;
}

void
grub_fdtbus_scan (int parent)
{
  int node;
  for (node = grub_fdt_first_node (dtb, parent); node >= 0;
       node = grub_fdt_next_node (dtb, node))
    {
      struct grub_fdtbus_device *dev;
      struct grub_fdtbus_driver *driver;
      dev = grub_zalloc (sizeof (*dev));
      if (!dev)
	{
	  grub_print_error ();
	  return;
	}
      dev->node = node;
      dev->next = devs;
      devs = dev;
      FOR_LIST_ELEMENTS(driver, drivers)
	if (is_compatible (driver, node))
	  {
	    if (driver->attach(dtb, dev->node) == GRUB_ERR_NONE)
	      {
		dev->driver = driver;
		break;
	      }
	    grub_print_error ();
	  }
      grub_printf ("C: %s; %s\n", grub_fdt_get_nodename (dtb, node), compatible);
    }
}

void
grub_fdtbus_register (struct grub_fdtbus_driver *driver)
{
  struct grub_fdtbus_device *dev;
  grub_list_push (GRUB_AS_LIST_P (&drivers),
		  GRUB_AS_LIST (driver));
  FOR_LIST_ELEMENTS(dev, devs)
    if (is_compatible (driver, node))
      {
	if (driver->attach(dtb, dev->node) == GRUB_ERR_NONE)
	  {
	    dev->driver = driver;
	    break;
	  }
	grub_print_error ();
      }
}

void
grub_fdtbus_unregister (struct grub_fdtbus_driver *driver)
{
  grub_list_remove (GRUB_AS_LIST (driver));
  struct grub_fdtbus_device *dev;
  grub_list_push (GRUB_AS_LIST_P (&drivers),
		  GRUB_AS_LIST (driver));
  FOR_LIST_ELEMENTS(dev, devs)
    if (dev->driver == driver)
      {
	if (driver->detach)
	  driver->detach(dtb, dev->node);
	dev->driver = 0;
      }
}

void
grub_fdtbus_init (const void *dtb_in, grub_size_t size)
{
  if (!dtb_in || grub_fdt_check_header (dtb_in, size) < 0)
    return;
  dtb = dtb_in;
  grub_fdtbus_scan (0);
}
