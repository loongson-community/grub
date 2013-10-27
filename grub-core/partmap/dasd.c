/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2012  Free Software Foundation, Inc.
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

#include <grub/partition.h>
#include <grub/disk.h>
#include <grub/mm.h>
#include <grub/misc.h>
#include <grub/dl.h>
#include <grub/symbol.h>
#include <grub/types.h>
#include <grub/err.h>

GRUB_MOD_LICENSE ("GPLv3+");

static struct grub_partition_map grub_dasd_partition_map;

struct addr
{
  grub_uint16_t cyl;
  grub_uint16_t head;
  grub_uint8_t sec;
} __attribute__ ((packed));

struct anchor
{
  grub_uint8_t unused1[4];
  grub_uint8_t magic[4];
  grub_uint8_t unused2[7];
  struct addr vtoc_addr;
} __attribute__ ((packed));

/* VOL1 in EBCDIC.  */
#define ANCHOR_MAGIC "\xe5\xd6\xd3\xf1"

struct grub_disk_addr_t
address_to_block (const struct addr *a)
{
  return a->cyl * + a->head *  + a->sec;
}

static grub_err_t
dasd_partition_map_iterate (grub_disk_t disk,
			    int (*hook) (grub_disk_t disk,
					 const grub_partition_t partition))
{
  grub_err_t err;
  grub_partition_t p;
  struct anchor anchor;

  err = grub_disk_read (disk, 2 * 8, 0, sizeof (anchor), &anchor);
  if (err)
    return err;
  if (grub_memcmp (anchor.magic, ANCHOR_MAGIC, sizeof (ANCHOR_MAGIC) - 1) != 0)
    return grub_error (GRUB_ERR_BAD_PART_TABLE, 
		       "not a dasd partition table");

  p = (grub_partition_t) grub_zalloc (sizeof (struct grub_partition));
  if (! p)
    return grub_errno;
  p->partmap = &grub_dasd_partition_map;

  p->start = 0x18 << 3;
  p->len = disk->total_sectors - p->start;
  p->number = 0;
  if (hook (disk, p))
    {
      grub_free (p);
      return GRUB_ERR_NONE;
    }

  grub_free (p);
  return GRUB_ERR_NONE;
}

/* Partition map type.  */
static struct grub_partition_map grub_dasd_partition_map =
  {
    .name = "dasd",
    .iterate = dasd_partition_map_iterate,
  };

GRUB_MOD_INIT(part_dasd)
{
  grub_partition_map_register (&grub_dasd_partition_map);
}

GRUB_MOD_FINI(part_dasd)
{
  grub_partition_map_unregister (&grub_dasd_partition_map);
}

