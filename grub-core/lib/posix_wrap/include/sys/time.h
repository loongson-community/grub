/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2011  Free Software Foundation, Inc.
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

#ifndef GRUB_POSIX_SYS_TIME_H
#define GRUB_POSIX_SYS_TIME_H	1

#include <grub/time.h>
#include <grub/datetime.h>

struct timeval
{
  grub_time_t tv_sec;
  long int tv_usec;
};

typedef grub_time_t time_t;

static inline time_t
time (time_t *t)
{
  return grub_posix_time (t);
}

extern struct tm grub_posix_tm_result;

static inline struct tm *
localtime_r (const time_t *timep, struct tm *result)
{
  grub_unixtime2datetime (*timep, &result->tm);
  return result;
}

static inline struct tm *
localtime (const time_t *timep)
{
  return localtime_r (timep, &grub_posix_tm_result);
}

#define tm_hour tm.hour
#define tm_min tm.minute

static inline grub_size_t
strftime (char *s, grub_size_t max, const char *format,
	       const struct tm *tm)
{
  return grub_strftime (s, max, format, &tm->tm);
}

struct timezone;

static inline int
gettimeofday_fake (struct timeval *tv, struct timezone *tz)
{
  grub_uint64_t ms = grub_get_time_ms ();
  grub_uint64_t t;
  tv->tv_sec = grub_divmod64 (ms, 1000, &t);
  tv->tv_usec = t * 1000;
  return 0;
}


#endif
