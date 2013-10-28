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

#ifndef GRUB_POSIX_STDLIB_H
#define GRUB_POSIX_STDLIB_H	1

#include <grub/mm.h>
#include <grub/misc.h>
#include <grub/charset.h>
#include <grub/posix.h>
#include <grub/bsearch.h>
#include <grub/sort.h>
#include <grub/env.h>

#include <wchar.h>

static inline void 
free (void *ptr)
{
  grub_free (ptr);
}

static inline void *
malloc (grub_size_t size)
{
  void *ret;
  ret = grub_malloc (size);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

static inline void *
calloc (grub_size_t size, grub_size_t nelem)
{
  void *ret;
  ret = grub_zalloc (size * nelem);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

static inline void *
realloc (void *ptr, grub_size_t size)
{
  void *ret;
  ret = grub_realloc (ptr, size);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

static inline int
abs (int c)
{
  return (c >= 0) ? c : -c;
}

static inline long
labs (long c)
{
  return (c >= 0) ? c : -c;
}

static inline unsigned long int
strtoul (const char *nptr, char **endptr, int base)
{
  unsigned long int ret;
  ret = grub_strtoul (nptr, endptr, base);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

static inline long 
atol (const char *nptr)
{
  long ret;
  ret = grub_strtol (nptr, NULL, 10);
  grub_errno = 0;
  return ret;
}

static inline grub_size_t
mbstowcs (wchar_t *dest, const char *src, grub_size_t n)
{
  COMPILE_TIME_ASSERT( sizeof (grub_uint32_t) == sizeof (wchar_t));
  grub_size_t ret = grub_utf8_to_ucs4 ((grub_uint32_t *) dest,
				       n, (const grub_uint8_t *) src,
				       -1, NULL);
  if (ret < n)
    dest[ret] = 0;
  return ret;
}

static inline void *
bsearch(const void *key, const void *base,
	grub_size_t nmemb, grub_size_t size,
	int (*compar)(const void *, const void *))
{
  return grub_bsearch (key, base, nmemb, size, compar);
}

static inline void
qsort (void *base, grub_size_t nmemb, grub_size_t size,
       grub_comparator_t compar)
{
  grub_qsort (base, nmemb, size, compar);
}

static inline const char *
getenv (const char *name)
{
  /* FIXME: Add standard POSIX variables.  */
  return grub_env_get (name);
}

#endif
