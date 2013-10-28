#ifndef GRUB_POSIX_FCNTL_H
#define GRUB_POSIX_FCNTL_H 1

#include <grub/posix.h>

#define O_RDONLY 1
#define O_RDWR 3
#define O_CREAT 4
#define S_IRUSR 0
#define S_IWUSR 0

static inline int
open (const char *pathname, int flags, ...)
{
  struct grub_posix_file *f;
  if (flags != O_RDONLY)
    return -1;
  f = grub_posix_fopen (pathname, "r");
  if (!f)
    return -1;
  return f->fileno;
}

static inline int 
close (int fd)
{
  return grub_posix_close (fd);
}


#endif
