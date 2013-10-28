/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2009, 2010  Free Software Foundation, Inc.
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

#ifndef GRUB_POSIX_ERRNO_H
#define GRUB_POSIX_ERRNO_H	1

#include <grub/err.h>
#include <grub/posix.h>

#define errno  grub_posix_errno
#define EINVAL GRUB_ERR_BAD_NUMBER
#define ENOMEM GRUB_ERR_OUT_OF_MEMORY
#define EAGAIN GRUB_ERR_WAIT
    /* FIXME: Disambiguate this.  */
#define ENODEV GRUB_ERR_IO
#define ENOSYS GRUB_ERR_IO
#define ENOENT GRUB_ERR_IO
#define EIO GRUB_ERR_IO
#define EROFS GRUB_ERR_POSIX_EROFS
#define EINTR GRUB_ERR_WAIT
#define EACCES GRUB_ERR_ACCESS_DENIED
#define ERANGE GRUB_ERR_BAD_ARGUMENT
#define EEXIST GRUB_ERR_POSIX_EEXIST

static inline const char *
strerror (grub_err_t err)
{
  return grub_posix_strerror (err);
}

#endif
