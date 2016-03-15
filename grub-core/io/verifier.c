/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2013  Free Software Foundation, Inc.
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

#include <grub/types.h>
#include <grub/misc.h>
#include <grub/mm.h>
#include <grub/err.h>
#include <grub/dl.h>
#include <grub/file.h>
#include <grub/command.h>
#include <grub/crypto.h>
#include <grub/i18n.h>
#include <grub/pubkey.h>
#include <grub/env.h>
#include <grub/kernel.h>
#include <grub/extcmd.h>

GRUB_MOD_LICENSE ("GPLv3+");

const struct grub_file_verifier *grub_file_verifiers[GRUB_FILE_VERIFIER_MAX];

struct grub_verified
{
  grub_file_t file;
  void *buf;
};
typedef struct grub_verified *grub_verified_t;

static void
verified_free (grub_verified_t verified)
{
  if (verified)
    {
      grub_free (verified->buf);
      grub_free (verified);
    }
}

static grub_ssize_t
verified_read (struct grub_file *file, char *buf, grub_size_t len)
{
  grub_memcpy (buf, (char *) file->data + file->offset, len);
  return len;
}

static grub_err_t
verified_close (struct grub_file *file)
{
  grub_free (file->data);
  file->data = 0;
  return GRUB_ERR_NONE;
}

struct grub_fs verified_fs =
{
  .name = "verified_read",
  .read = verified_read,
  .close = verified_close
};

static grub_file_t
grub_verifier_open (grub_file_t io, const char *filename)
{
  grub_err_t err;
  grub_file_t ret = NULL;
  grub_verified_t verified = NULL;
  void *ctxt[GRUB_FILE_FILTER_MAX];
  int i;
  int has_verif = 0;

  if (io->device->disk && 
      (io->device->disk->dev->id == GRUB_DISK_DEVICE_MEMDISK_ID
       || io->device->disk->dev->id == GRUB_DISK_DEVICE_PROCFS_ID))
    return io;

  for (i = 0; i < GRUB_FILE_VERIFIER_MAX; i++)
    ctxt[i] = 0;

  for (i = 0; i < GRUB_FILE_VERIFIER_MAX; i++)
    {
      int skip = 0;
      if (!grub_file_verifiers[i])
	continue;

      ctxt[i] = grub_file_verifiers[i]->init (io, filename, &skip);

      if (skip)
	{
	  grub_errno = GRUB_ERR_NONE;
	  continue;
	}

      if (!ctxt[i])
	goto fail;
      has_verif = 1;
    }

  
  if (!has_verif)
    return io;

  ret = grub_malloc (sizeof (*ret));
  if (!ret)
    {
      goto fail;
    }
  *ret = *io;

  ret->fs = &verified_fs;
  ret->not_easily_seekable = 0;
  if (ret->size >> (sizeof (grub_size_t) * GRUB_CHAR_BIT - 1))
    {
      grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET,
		  "big file signature isn't implemented yet");
      goto fail;
    }
  verified = grub_malloc (sizeof (*verified));
  if (!verified)
    {
      goto fail;
    }
  verified->buf = grub_malloc (ret->size);
  if (!verified->buf)
    {
      goto fail;
    }
  if (grub_file_read (io, verified->buf, ret->size) != (grub_ssize_t) ret->size)
    {
      if (!grub_errno)
	grub_error (GRUB_ERR_FILE_READ_ERROR, N_("premature end of file %s"),
		    filename);
      goto fail;
    }

  for (i = 0; i < GRUB_FILE_VERIFIER_MAX; i++)
    if (ctxt[i])
      {
	err = grub_file_verifiers[i]->read(ctxt[i], verified->buf, ret->size);
	if (err)
	  goto fail;
      }

  for (i = 0; i < GRUB_FILE_VERIFIER_MAX; i++)
    if (grub_file_verifiers[i] && ctxt[i])
      {
	err = grub_file_verifiers[i]->final(ctxt[i]);
	if (err)
	  goto fail;
	grub_file_verifiers[i]->close(ctxt[i]);
	grub_free (ctxt[i]);
	ctxt[i] = 0;
      }
  verified->file = io;
  ret->data = verified;
  return ret;
 fail:
  verified_free (verified);
  grub_free (ret);
  for (i = 0; i < GRUB_FILE_VERIFIER_MAX; i++)
    if (ctxt[i])
      {
	grub_file_verifiers[i]->close(ctxt[i]);
	grub_free (ctxt[i]);
      }
  if (!grub_errno)
    grub_error (GRUB_ERR_BAD_SIGNATURE, N_("bad signature"));
  return NULL;
}

GRUB_MOD_INIT(verifier)
{
  grub_file_filter_register (GRUB_FILE_FILTER_PUBKEY, grub_verifier_open);
}

GRUB_MOD_FINI(verifier)
{
  grub_file_filter_unregister (GRUB_FILE_FILTER_PUBKEY);
}
