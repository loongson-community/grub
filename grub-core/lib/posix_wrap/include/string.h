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

#ifndef GRUB_POSIX_STRING_H
#define GRUB_POSIX_STRING_H	1

#include <grub/misc.h>
#include <grub/charset.h>
#include <grub/posix.h>
#include <sys/types.h>

#define HAVE_STRCASECMP 1

static inline grub_size_t
strlen (const char *s)
{
  return grub_strlen (s);
}

static inline int 
strcmp (const char *s1, const char *s2)
{
  return grub_strcmp (s1, s2);
}

static inline int 
strcasecmp (const char *s1, const char *s2)
{
  return grub_strcasecmp (s1, s2);
}

static inline char *
strpbrk (const char *s, const char *accept)
{
  return grub_strpbrk (s, accept);
}

static inline grub_size_t
strcspn (const char *s, const char *reject)
{
  const char *ptr, *ptr2;
  for (ptr = s; *ptr; ptr++)
    for (ptr2 = reject; *ptr2; ptr2++)
      if (*ptr == *ptr2)
	return ptr - s;
  return ptr - s;
}

static inline int atoi(const char *nptr)
{
  int ret;
  ret = grub_strtol (nptr, 0, 10);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

static inline long
strtol (const char *str, char **end, int base)
{
  long ret;
  ret = grub_strtol (str, end, base);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

#ifdef GRUB_UTIL
static inline void *
memcpy (void *dest, const void *src, grub_size_t n)
{
  return grub_memcpy (dest, src, n);
}

static inline int
memcmp (const void *s1, const void *s2, grub_size_t n)
{
  return grub_memcmp (s1, s2, n);
}

#endif

static inline void
bcopy (const void *src, void *dest, grub_size_t n)
{
  grub_memcpy (dest, src, n);
}

static inline char *
strcpy (char *dest, const char *src)
{
  return grub_strcpy (dest, src);
}

static inline char *
strstr (const char *haystack, const char *needle)
{
  return grub_strstr (haystack, needle);
}

static inline char *
strchr (const char *s, int c)
{
  return grub_strchr (s, c);
}

static inline char *
strrchr (const char *s, int c)
{
  return grub_strrchr (s, c);
}

static inline char *
strncpy (char *dest, const char *src, grub_size_t n)
{
  return grub_strncpy (dest, src, n);
}

static inline char *
strcat (char *dest, const char *src)
{
  return grub_strcat (dest, src);
}

static inline int
strcoll (const char *s1, const char *s2)
{
  return grub_strcmp (s1, s2);
}

static inline int
strncasecmp (const char *s1, const char *s2, grub_size_t n)
{
  return grub_strncasecmp (s1, s2, n);
}

static inline int
strncmp (const char *s1, const char *s2, grub_size_t n)
{
  return grub_strncmp (s1, s2, n);
}

static inline void *
memchr (const void *s, int c, grub_size_t n)
{
  return grub_memchr (s, c, n);
}

static inline char *
strdup (const char *s)
{
  return grub_strdup (s);
}

static inline wchar_t *
wmempcpy (wchar_t *dest, const wchar_t *src, grub_size_t n)
{
  grub_memcpy (dest, src, sizeof (dest[0]) * n);
  return dest + n;
}

static inline void *
mempcpy (void *dest, const void *src, grub_size_t n)
{
  grub_memcpy (dest, src, n);
  return (char *) dest + n;
}

static inline char *
stpcpy (char *dest, const char *src)
{
  return grub_stpcpy (dest, src);
}

static inline char *
strtok_r (char *str, const char *delim, char **saveptr)
{
  return grub_strtok_r (str, delim, saveptr);
}

static inline char *
strtok (char *str, const char *delim)
{
  return grub_strtok_r (str, delim, &grub_posix_strtok_storage);
}

static inline int
mbsncasecmp (const char *s1, const char *s2, grub_size_t n)
{
  return strncasecmp (s1, s2, n);
}

static inline int
mbscasecmp (const char *s1, const char *s2)
{
  return strcasecmp (s1, s2);
}

static inline char *
mbschr (const char *src, int c)
{
  int count = 0;
  grub_uint32_t code = 0;
  const char *last_start = src;

  while (1)
    {
      int was_count = count;
      if (!grub_utf8_process (*src++, &code, &count))
	{
	  /* Character c may be valid, don't eat it.  */
	  if (was_count)
	    src--;
	  last_start = src;
	  continue;
	}
      if (count != 0)
	continue;
      if (code == 0)
	break;
      if ((int) code == c)
	return (char *) last_start;
      last_start = src;
    }
  return 0;
}

/* FIXME: Use KMP.  */
static inline void *
memmem(const void *haystack, size_t haystacklen,
       const void *needle, size_t needlelen)
{
  const grub_uint8_t *ptr;
  if (needlelen > haystacklen)
    return 0;
  for (ptr = haystack;
       (grub_uint8_t *) ptr + needlelen < (grub_uint8_t *) haystack + haystacklen; 
       ptr++)
    if (grub_memcmp (ptr, needle, needlelen) == 0)
      return (void *) ptr;
  return 0;
}


#endif
