/* ofdisk.c - Open Firmware disk access.  */
/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2004,2006,2007,2008,2009,2011  Free Software Foundation, Inc.
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
#include <grub/disk.h>
#include <grub/mm.h>
#include <grub/alpha/srm/srm.h>

static grub_srm_fileno_t last_handle = 0;
static char *last_path = NULL;

static int lnum = 0;

struct srmdisk_hash_ent
{
  char *devpath;
  int num;
  struct srmdisk_hash_ent *next;
};

#define SRMDISK_HASH_SZ	8
static struct srmdisk_hash_ent *srmdisk_hash[SRMDISK_HASH_SZ];

static int
srmdisk_hash_fn (const char *devpath)
{
  int hash = 0;
  while (*devpath)
    hash ^= *devpath++;
  return (hash & (SRMDISK_HASH_SZ - 1));
}

static struct srmdisk_hash_ent *
srmdisk_hash_find (const char *devpath)
{
  struct srmdisk_hash_ent *p = srmdisk_hash[srmdisk_hash_fn (devpath)];

  while (p)
    {
      if (!grub_strcmp (p->devpath, devpath))
	break;
      p = p->next;
    }
  return p;
}

static struct srmdisk_hash_ent *
srmdisk_hash_add (char *devpath)
{
  struct srmdisk_hash_ent *p;
  struct srmdisk_hash_ent **head = &srmdisk_hash[srmdisk_hash_fn(devpath)];

  p = grub_malloc (sizeof (*p));
  if (!p)
    return NULL;

  p->devpath = devpath;
  p->next = *head;
  p->num = lnum++;
  *head = p;
  return p;
}


static int
grub_srmdisk_iterate (int (*hook) (const char *name))
{
  (void) hook;
  return 0;
}

static grub_err_t
reopen (const char *name)
{
  grub_uint64_t r;

  if (last_path && grub_strcmp (last_path, name) == 0)
    {
      grub_dprintf ("srmdisk", "using already opened %s\n", name);
      return GRUB_ERR_NONE;
    }
  if (last_path)
    {
      grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_CLOSE, last_handle);
      grub_free (last_path);
      last_path = NULL;
      last_handle = 0;
    }

  grub_dprintf ("srmdisk", "opening %s\n", name);
  r = grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_OPEN, name, grub_strlen (name));
  grub_printf ("<%lx>", r);
  while (1);
  if (r & (1ULL << 63))
    {
      grub_dprintf ("srmdisk", "couldn't open %s\n", name);
      return grub_error (GRUB_ERR_IO, "couldn't open %s", name);
    }
  last_path = grub_strdup (name);
  if (!last_path)
    return grub_errno;
  last_handle = r & 0xffffffff;
  grub_dprintf ("srmdisk", "opened %s\n", name);
  return GRUB_ERR_NONE;
}

static grub_err_t
grub_srmdisk_open (const char *name, grub_disk_t disk)
{
  char *fullname;
  grub_err_t err;
  struct srmdisk_hash_ent *hash;

  if (grub_memcmp (name, "srm/", 4) != 0)
    return grub_error (GRUB_ERR_UNKNOWN_DEVICE, "not srm device");
  fullname = grub_strdup (name + 4);
  if (!fullname)
    return grub_errno;
  disk->data = fullname;
  grub_dprintf ("srmdisk", "opening %s\n", fullname);

  hash = srmdisk_hash_find (fullname);
  if (!hash)
    hash = srmdisk_hash_add (fullname);
  if (!hash)
    return grub_errno;

  err = reopen (fullname);
  if (err)
    return err;

  {
    grub_uint64_t res = 0;
    int i;

    /* FIXME: findout the block size.  */
    for (i = 31; i >= 0; i--)
      {
	char buf[512];
	grub_dprintf ("srmdisk",
		      "seek to 0x%" PRIxGRUB_UINT64_T "\n",
		      res | (1UL << i));
	if (grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_READ, last_handle, 512,
				     buf, res | (1ULL << i)) & (1ULL << 63))
	    continue;
	  res |= (1ULL << i);
      }
    grub_dprintf ("srmdisk",
		  "determined disk size 0x%" PRIxGRUB_UINT64_T "\n", res);
    disk->total_sectors = res;
  }

  disk->id = hash->num;
  return GRUB_ERR_NONE;
}

static void
grub_srmdisk_close (grub_disk_t disk)
{
  grub_free (disk->data);
}

static grub_err_t
grub_srmdisk_read (grub_disk_t disk, grub_disk_addr_t sector,
		   grub_size_t size, char *buf)
{
  grub_err_t err;

  err = reopen (disk->data);
  if (err)
    return err;

  /* FIXME: handle incomplete read.  */
  if (grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_READ, last_handle, 
			       size << 9,
			       buf, sector) & (1ULL << 63))
	return grub_error (GRUB_ERR_READ_ERROR, "read failed");

  return GRUB_ERR_NONE;
}

static grub_err_t
grub_srmdisk_write (grub_disk_t disk __attribute ((unused)),
		   grub_disk_addr_t sector __attribute ((unused)),
		   grub_size_t size __attribute ((unused)),
		   const char *buf __attribute ((unused)))
{
  return GRUB_ERR_NOT_IMPLEMENTED_YET;
}

static struct grub_disk_dev grub_srmdisk_dev =
  {
    .name = "srmdisk",
    .id = GRUB_DISK_DEVICE_SRMDISK_ID,
    .iterate = grub_srmdisk_iterate,
    .open = grub_srmdisk_open,
    .close = grub_srmdisk_close,
    .read = grub_srmdisk_read,
    .write = grub_srmdisk_write,
    .next = 0
  };

void
grub_srmdisk_init (void)
{
  grub_disk_dev_register (&grub_srmdisk_dev);
}

void
grub_srmdisk_fini (void)
{
  if (last_path)
    {
      grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_CLOSE, last_handle);
      grub_free (last_path);
      last_path = NULL;
      last_handle = 0;
    }

  grub_disk_dev_unregister (&grub_srmdisk_dev);
}
