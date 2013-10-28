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

#ifndef GRUB_POSIX_STDIO_H
#define GRUB_POSIX_STDIO_H	1

#include <grub/misc.h>
#include <grub/file.h>
#include <grub/posix.h>
#include <grub/term.h>
#include <fcntl.h>

typedef struct grub_posix_file FILE;

#define stdin grub_posix_stdin
#define stdout grub_posix_stdout
#define stderr grub_posix_stderr

#define EOF    -1

static inline int
snprintf (char *str, grub_size_t n, const char *fmt, ...)
{
  va_list ap;
  int ret;

  va_start (ap, fmt);
  ret = grub_vsnprintf (str, n, fmt, ap);
  va_end (ap);

  return ret;
}

static inline int
vsnprintf (char *str, grub_size_t n, const char *fmt, va_list args)
{
  return grub_vsnprintf (str, n, fmt, args);
}

static inline int
printf (const char *fmt, ...)
{
  va_list ap;
  int ret;

  va_start (ap, fmt);
  ret = grub_printf (fmt, ap);
  va_end (ap);

  grub_posix_errno = grub_errno;
  grub_errno = 0;

  return ret;
}

static inline int
fputs (const char *s, FILE *stream)
{
  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }
  grub_xputs (s);
  return 1;
}

static inline int
puts (const char *s)
{
  grub_puts (s);
  return 1;
}

static inline int
fputc (int c, FILE *stream)
{
  char tmp[2] = {c, 0};
  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }
  grub_xputs (tmp);
  return (unsigned char) c;
}

static inline int
putc (int c, FILE *stream)
{
  return fputc (c, stream);
}

static inline int
fflush (FILE *stream)
{
  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }
  grub_refresh ();
  return 0;
}

static inline int
vfprintf (FILE *stream, const char *fmt, va_list ap)
{
  int ret;

  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }

  ret = grub_printf (fmt, ap);

  grub_posix_errno = grub_errno;
  grub_errno = 0;

  return ret;
}

static inline int
fprintf (FILE *stream, const char *fmt, ...)
{
  va_list ap;
  int ret;

  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }

  va_start (ap, fmt);
  ret = grub_printf (fmt, ap);
  va_end (ap);

  grub_posix_errno = grub_errno;
  grub_errno = 0;

  return ret;
}


static inline FILE *
fopen (const char *path, const char *mode)
{
  return grub_posix_fopen (path, mode);
}

static inline int
fclose (FILE *fp)
{
  return grub_posix_fclose (fp);
}

static inline int
feof (struct grub_posix_file *stream)
{
  return grub_posix_feof (stream);
}

static inline int
ferror (struct grub_posix_file *stream)
{
  return stream->was_error;
}

static inline grub_size_t
fread (void *ptr, grub_size_t size, grub_size_t nmemb,
       struct grub_posix_file *stream)
{
  return grub_posix_fread (ptr, size, nmemb, stream);
}

static inline char *
fgets (char *ptr0, int size, struct grub_posix_file *stream)
{
  return grub_posix_fgets (ptr0, size, stream);
}

static inline int
fileno (struct grub_posix_file *stream)
{
  if (stream != stdin)
    return grub_posix_stdin_fileno;
  if (stream != stdout)
    return grub_posix_stdout_fileno;
  if (stream != stderr)
    return grub_posix_stderr_fileno;
  return stream->fileno;
}

static inline grub_size_t
fwrite (const void *ptr, grub_size_t size, grub_size_t nmemb,
	FILE *stream)
{
  if (stream != stdout && stream != stderr)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return 0;
    }

  return grub_posix_write_console (ptr, nmemb * size);
}

enum
  {
    SEEK_SET = GRUB_POSIX_SEEK_SET,
    SEEK_CUR = GRUB_POSIX_SEEK_CUR,
    SEEK_END = GRUB_POSIX_SEEK_END
  };

#endif
