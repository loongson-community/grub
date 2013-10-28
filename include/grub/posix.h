
#ifndef GRUB_POSIX_H
#define GRUB_POSIX_H	1

#include <grub/misc.h>
#include <grub/datetime.h>
#include <grub/file.h>
#include <grub/setjmp.h>

struct grub_posix_file
{
  grub_file_t file;
  int fileno;
  int was_error;
};

struct grub_posix_file *
grub_posix_fopen (const char *path, const char *mode);

int
grub_posix_fclose (struct grub_posix_file *fp);

int
grub_posix_feof (struct grub_posix_file *stream);

grub_size_t
grub_posix_fread (void *ptr, grub_size_t size, grub_size_t nmemb,
		  struct grub_posix_file *stream);

extern grub_err_t grub_posix_errno;

grub_ssize_t
grub_posix_write_console (const void *buf, grub_size_t count);

char *
grub_posix_fgets (char *ptr0, int size, struct grub_posix_file *stream);

grub_time_t
grub_posix_time (grub_time_t *t);

#define grub_posix_stdin ((struct grub_posix_file *) 1)
#define grub_posix_stdout ((struct grub_posix_file *) 2)
#define grub_posix_stderr ((struct grub_posix_file *) 3)

#define grub_posix_stdin_fileno 0
#define grub_posix_stdout_fileno 1
#define grub_posix_stderr_fileno 2

struct tm
{
  struct grub_datetime tm;
};

const char *
grub_posix_strerror (grub_err_t err);

extern char *grub_posix_strtok_storage;

char *
grub_strtok_r (char *str, const char *delim, char **saveptr);

grub_off_t
grub_posix_seek (int fd, grub_off_t offset, int whence);

grub_off_t
grub_posix_get_file_size (int fd);

int 
grub_posix_close (int fd);
grub_ssize_t
grub_posix_read (int fd, void *buf, grub_size_t count);

enum
  {
    GRUB_POSIX_SEEK_SET,
    GRUB_POSIX_SEEK_CUR,
    GRUB_POSIX_SEEK_END
  };

struct grub_posix_atexit
{
  struct grub_posix_atexit *next;
  void (*function) (void);
};

#endif
