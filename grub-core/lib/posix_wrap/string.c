#include <grub/posix.h>
#include <grub/misc.h>
#include <grub/mm.h>

char *grub_posix_strtok_storage;

char *
grub_strtok_r (char *str, const char *delim, char **saveptr)
{
  char *ptr;
  char *ret;
  if (str)
    *saveptr = str;
  ret = *saveptr;
  if (!ret)
    return NULL;
  ptr = grub_strpbrk (*saveptr, delim);
  if (ptr)
    {
      *ptr = 0;
      *saveptr = ptr + 1;
      return ret;
    }
  *saveptr = NULL;
  return ret;  
}
