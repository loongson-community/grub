/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2013 Free Software Foundation, Inc.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <grub/misc.h>
#include <grub/disk.h>
#include <grub/archelp.h>

#include <grub/file.h>
#include <grub/mm.h>
#include <grub/dl.h>
#include <grub/i18n.h>
#include <grub/greffs.h>

GRUB_MOD_LICENSE ("GPLv3+");

struct grub_greffs_data
{
  grub_uint32_t dofs;
};

static grub_err_t
get_string (grub_disk_t disk,
	    const struct grub_greffs_header *head,
	    grub_uint32_t fn,
	    char **buf, grub_size_t *size)
{
  grub_uint32_t desc[2];
  grub_size_t read_size;

  if (grub_disk_read (disk, 0,
		      grub_cpu_to_le32 (head->string_ptrs_offset)
		      + fn * sizeof (desc[0]), sizeof (desc), &desc))
    return grub_errno;
  read_size = desc[1] - desc[0];
  if (*size < read_size + 1)
    {
      grub_free (*buf);
      *size = (read_size + 4) * 2;
      *buf = grub_malloc (*size);
      if (!*buf)
	{
	  *size = 0;
	  return grub_errno;
	}
    }
  if (grub_disk_read (disk, 0, desc[0], read_size, *buf))
    return grub_errno;
  (*buf)[read_size] = '\0';
  return GRUB_ERR_NONE;
}

static grub_err_t
find_file (grub_disk_t disk,
	   struct grub_greffs_header *head,
	   const char *name_in, grub_uint32_t *f, int exact)
{
  grub_uint32_t num_files, cur_file = 0;
  int i;
  char *buf = NULL;
  grub_size_t buf_size = 0;
  grub_err_t err;

  num_files = grub_le_to_cpu32 (head->nfiles);

  for (i = 31; i >= 0; i--)
    {
      int cmp;
      if ((cur_file | (1 << i)) > num_files)
	continue;
      err = get_string (disk, head, (cur_file | (1 << i)) - 1, &buf, &buf_size);
      if (err)
	{
	  grub_free (buf);
	  return err;
	}
      cmp = grub_strcmp (buf, name_in);
      if (cmp <= 0)
	cur_file |= (1 << i);
      if (cmp == 0)
	{
	  grub_free (buf);
	  *f = cur_file - 1;
	  return GRUB_ERR_NONE;
	}
    }

  grub_free (buf);
  if (!exact)
    {
      *f = cur_file;
      return GRUB_ERR_NONE;
    }
  return grub_error (GRUB_ERR_FILE_NOT_FOUND, N_("file `%s' not found"),
		     name_in);
}

static char *
canonicalize (const char *name_in, int make_dir)
{
  const char *iptr;
  char *out, *optr;
  out = grub_malloc (grub_strlen (name_in) + 2);
  if (!out)
    return NULL;
  for (iptr = name_in, optr = out; *iptr; )
    {
      while (*iptr == '/')
	iptr++;
      if (iptr[0] == '.' && (iptr[1] == '/' || iptr[1] == 0))
	{
	  iptr += 2;
	  continue;
	}
      if (iptr[0] == '.' && iptr[1] == '.' && (iptr[2] == '/' || iptr[2] == 0))
	{
	  iptr += 3;
	  if (optr == out)
	    continue;
	  for (optr -= 2; optr >= out && *optr != '/'; optr--);
	  optr++;
	  continue;
	}
      while (*iptr && *iptr != '/')
	*optr++ = *iptr++;
      if (*iptr)
	*optr++ = *iptr++;
      else if (make_dir && optr != out)
	*optr++ = '/';
    }
  *optr = 0;
  return out;
}

static grub_err_t
grub_greffs_dir (grub_device_t device, const char *path_in,
	       grub_fs_dir_hook_t hook, void *hook_data)
{
  grub_err_t err;
  grub_uint32_t cur_file, num_files;
  char *buf = 0;
  grub_size_t buf_size = 0;
  char *can;
  grub_size_t len;
  struct grub_greffs_header head;

  if (grub_disk_read (device->disk, 0, 0, sizeof (head), &head))
    return grub_error (GRUB_ERR_BAD_FS, "not a greffs filesystem");

  if (grub_memcmp (head.magic, GRUB_GREFFS_MAGIC, sizeof (head.magic)) != 0)
    return grub_error (GRUB_ERR_BAD_FS, "not a greffs filesystem");

  can = canonicalize (path_in, 1);
  if (!can)
    return grub_errno;

  if (can[0] == '\0')
    cur_file = 0;
  else
    {
      err = find_file (device->disk, &head, can, &cur_file, 0);
      if (err)
	goto fail;
    }

  num_files = grub_le_to_cpu32 (head.nfiles);

  len = grub_strlen (can);

  while (cur_file < num_files)
    {
      char *p, *n;
      struct grub_dirhook_info info;

      err = get_string (device->disk, &head, cur_file, &buf, &buf_size);
      if (err)
	goto fail;
      if (grub_memcmp (can, buf, len) != 0)
	break;
      grub_memset (&info, 0, sizeof (info));

      n = buf + len;
      while (*n == '/')
	n++;

      p = grub_strchr (n, '/');
      if (p)
	*p = 0;
      info.dir = (p != NULL);
      if (hook (n, &info, hook_data))
	goto fail;
      if (!p)
	cur_file++;
      else
	{
	  *p = '/' + 1;
	  p[1] = '\0';
	  err = find_file (device->disk, &head, buf, &cur_file, 0);
	  if (err)
	    goto fail;
	}	
    }

 fail:
  grub_free (buf);
  grub_free (can);
  return grub_errno;
}


static grub_err_t
grub_greffs_open (grub_file_t file, const char *name_in)
{
  struct grub_greffs_header head;
  struct grub_greffs_data *data;
  struct grub_greffs_inode inode;
  grub_err_t err;
  grub_uint32_t cur_file;
  char *can;

  if (grub_disk_read (file->device->disk, 0, 0, sizeof (head), &head))
    return grub_error (GRUB_ERR_BAD_FS, "not a greffs filesystem");

  if (grub_memcmp (head.magic, GRUB_GREFFS_MAGIC, sizeof (head.magic)) != 0)
    return grub_error (GRUB_ERR_BAD_FS, "not a greffs filesystem");

  can = canonicalize (name_in, 0);
  if (!can)
    return grub_errno;

  err = find_file (file->device->disk, &head, can, &cur_file, 1);
  grub_free (can);
  if (err)
    return err;

  data = grub_malloc (sizeof (*data));
  if (!data)
    return grub_errno;
  if (grub_disk_read (file->device->disk,
		      0, grub_le_to_cpu32 (head.inodes_offset)
		      + sizeof (inode) * cur_file, sizeof (inode), &inode))
    return grub_error (GRUB_ERR_BAD_FS, "not a greffs filesystem");

  data->dofs = grub_cpu_to_le32 (inode.start);
  file->size = grub_cpu_to_le32 (inode.size);

  file->data = data;

  return GRUB_ERR_NONE;
}

static grub_ssize_t
grub_greffs_read (grub_file_t file, char *buf, grub_size_t len)
{
  struct grub_greffs_data *data;
  grub_ssize_t ret;

  data = file->data;

  file->device->disk->read_hook = file->read_hook;
  file->device->disk->read_hook_data = file->read_hook_data;
  ret = (grub_disk_read (file->device->disk, 0, data->dofs + file->offset,
			 len, buf)) ? -1 : (grub_ssize_t) len;
  file->device->disk->read_hook = 0;

  return ret;
}

static grub_err_t
grub_greffs_close (grub_file_t file)
{
  struct grub_greffs_data *data;

  data = file->data;
  grub_free (data);

  return grub_errno;
}

static struct grub_fs grub_greffs_fs = {
  .name = "greffs",
  .dir = grub_greffs_dir,
  .open = grub_greffs_open,
  .read = grub_greffs_read,
  .close = grub_greffs_close,
#ifdef GRUB_UTIL
  .reserved_first_sector = 0,
  .blocklist_install = 0,
#endif
};

GRUB_MOD_INIT (greffs)
{
  grub_fs_register (&grub_greffs_fs);
}

GRUB_MOD_FINI (greffs)
{
  grub_fs_unregister (&grub_greffs_fs);
}
