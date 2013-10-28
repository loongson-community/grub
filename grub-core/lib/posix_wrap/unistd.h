#include <sys/types.h>
#include <stdio.h>
#include <getopt.h>
#include <grub/posix.h>

enum
  {
    F_OK
  };

struct stat
{
  int st_mode;
  grub_off_t st_size;
};

typedef grub_off_t off_t;

static inline grub_ssize_t
write (int fd, const void *buf, grub_size_t count)
{
  if (fd != 2)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return -1;
    }

  return grub_posix_write_console (buf, count);
}

static inline int 
isatty (int fd)
{
  return fd == grub_posix_stdin_fileno || fd == grub_posix_stdout_fileno
    || fd == grub_posix_stderr_fileno;
}

static inline off_t
lseek (int fd, off_t offset, int whence)
{
  return grub_posix_seek (fd, offset, whence);
}

static inline grub_ssize_t
read (int fd, void *buf, grub_size_t count)
{
  return grub_posix_read (fd, buf, count);
}
