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

#ifndef GRUB_GREFFS_HEADER
#define GRUB_GREFFS_HEADER	1

#include <grub/types.h>

/*
  Layout:
  header
  grub_uint32_t[] pointers to names
  inodes
  names
  contents.
  Everything is little-endian.
 */

struct grub_greffs_header
{
  char magic[4];
#define GRUB_GREFFS_MAGIC "gref"
  grub_uint32_t nfiles;
  /* must be divisible by 4.  */
  grub_uint32_t inodes_offset;
  /* must be divisible by 4.  */
  grub_uint32_t string_ptrs_offset;
};

struct grub_greffs_inode
{
  grub_uint32_t start;
  grub_uint32_t size;
  grub_uint32_t mtime;
  /* Currently always 0. If we ever need symlinks,
     it could be added.  */
  grub_uint32_t type;
};

#endif
