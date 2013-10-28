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

#ifndef GRUB_POSIX_WCHAR_H
#define GRUB_POSIX_WCHAR_H	1

#include <grub/charset.h>
#include <grub/misc.h>

#include <stddef.h>

#define mbstate_t grub_posix_mbstate_t

/* UCS-4.  */
enum
  {
    WEOF = -1
  };

typedef int wint_t;

typedef struct mbstate {
  grub_uint32_t code;
  int count;
} mbstate_t;


/* UTF-8. */
#define MB_CUR_MAX 4
#define MB_LEN_MAX 4

static inline grub_size_t
mbrtowc (wchar_t *pwc, const char *s, grub_size_t n, mbstate_t *ps)
{
  const char *ptr;
  if (!s)
    {
      pwc = 0;
      s = "";
      n = 1;
    }

  if (pwc)
    *pwc = 0;

  for (ptr = s; ptr < s + n; ptr++)
    {
      if (!grub_utf8_process (*ptr, &ps->code, &ps->count))
	return -1;
      if (ps->count)
	continue;
      if (pwc)
	*pwc = ps->code;
      if (ps->code == 0)
	return 0;
      return ptr - s + 1;
    }
  return -2;
}

static inline int
mbsinit(const mbstate_t *ps)
{
  return ps->count == 0;
}

static inline grub_size_t
wcrtomb (char *s, wchar_t wc, mbstate_t *ps __attribute__ ((unused)))
{
  if (s == 0)
    return 1;
  return grub_encode_utf8_character ((grub_uint8_t *) s,
				     (grub_uint8_t *) s + MB_LEN_MAX,
				     wc);
}

static inline wint_t btowc (int c)
{
  if (c & ~0x7f)
    return WEOF;
  return c;
}


static inline int
wcscoll (const wchar_t *s1, const wchar_t *s2)
{
  while (*s1 && *s2)
    {
      if (*s1 != *s2)
	break;

      s1++;
      s2++;
    }

  if (*s1 < *s2)
    return -1;
  if (*s1 > *s2)
    return +1;
  return 0;
}

static inline wchar_t *
wmemset (wchar_t *wcs, wchar_t wc, grub_size_t n)
{
  wchar_t *ptr = wcs;
  while (n--)
    *ptr++ = wc;
  return wcs;
}

static inline wchar_t *
wmemcpy (wchar_t *dest, const wchar_t *src, grub_size_t n)
{
  memcpy (dest, src, sizeof (dest[0]) * n);
  return dest;
}

static inline int
wmemcmp (const wchar_t *s1, const wchar_t *s2, grub_size_t n)
{
  const wchar_t *t1 = s1;
  const wchar_t *t2 = s2;

  while (n--)
    {
      if (*t1 != *t2)
	return (int) *t1 - (int) *t2;

      t1++;
      t2++;
    }

  return 0;
}

static inline wchar_t *
wmemchr (const wchar_t *s, wchar_t c, grub_size_t n)
{
  for (; n--; s++)
    {
      if (*s == c)
	return (wchar_t *) s;
    }

  return 0;
}

static inline grub_size_t
wcslen (const wchar_t *s)
{
  const wchar_t *ptr;
  for (ptr = s; *ptr; ptr++);
  return ptr - s;
}

static inline wchar_t *
wmemmove (wchar_t *dest, const wchar_t *src, grub_size_t n)
{
  grub_memmove (dest, src, n * sizeof (dest[0]));
  return dest;
}

static inline wchar_t *
wcschr (const wchar_t *s, wchar_t c)
{
  do
    {
      if (*s == c)
	return (wchar_t *) s;
    }
  while (*s++);

  return 0;
}

int wcwidth (wchar_t c);

static inline grub_size_t
mbslen (const char *src)
{
  int count = 0;
  grub_size_t ret = 0;
  grub_uint32_t code = 0;

  while (1)
    {
      int was_count = count;
      if (!grub_utf8_process (*src++, &code, &count))
	{
	  code = '?';
	  count = 0;
	  /* Character c may be valid, don't eat it.  */
	  if (was_count)
	    src--;
	}
      if (count != 0)
	continue;
      if (code == 0)
	break;
      ret++;
    }

  return ret;
}

#endif
