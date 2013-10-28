#include <grub/posix.h>

struct tm grub_posix_tm_result;

grub_time_t
grub_posix_time (grub_time_t *t)
{
  struct grub_datetime datetime;
  grub_err_t err;
  grub_int32_t nix;
  err = grub_get_datetime (&datetime);
  if (err)
    {
      grub_posix_errno = err;
      grub_errno = 0;
      return -1;
    }
  if (!grub_datetime2unixtime (&datetime, &nix))
    {
      grub_posix_errno = GRUB_ERR_IO;
      return -1;
    }
  if (t)
    *t = nix;
  return nix;
}

grub_size_t
grub_strftime (char *s, grub_size_t max, const char *format,
	       const struct grub_datetime *tm)
{
  char *s0 = s;
  const char *fmt;
  int over = 0;
  auto void insert_char (char c);
  void insert_char (char c)
  {
    if (max <= 1)
      {
	over = 1;
	return;
      }
    *s++ = c;
    max--;
  }
  auto void insert_number (unsigned n, grub_size_t w);
  void insert_number (unsigned n, grub_size_t w)
  {
    grub_size_t i;
    if (max <= w)
      {
	over = 1;
	return;
      }
    for (i = 0; i < w; i++)
      {
	s[w - i - 1] = (n % 10) + '0';
	n /= 10;
      }
    s += w;
    max -= w;
  }

  for (fmt = format; *fmt && !over; fmt++)
    {
      if (*fmt != '%')
	{
	  insert_char (*fmt);
	  continue;
	}
      fmt++;
      switch (*fmt)
	{
	case 'Y':
	  insert_number (tm->year, 4);
	  break;
	case 'm':
	  insert_number (tm->month, 2);
	  break;
	case 'd':
	  insert_number (tm->day, 2);
	  break;
	case 'H':
	  insert_number (tm->hour, 2);
	  break;
	case 'M':
	  insert_number (tm->minute, 2);
	  break;
	case 'S':
	  insert_number (tm->second, 2);
	  break;
	case '%':
	  insert_char ('%');
	  break;
	default:
	  insert_char ('%');
	  insert_char (*fmt);	  
	}
    }
  *s = 0;
  if (over)
    return 0;
  return s - s0;
}
