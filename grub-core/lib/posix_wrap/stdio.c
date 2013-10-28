#include <grub/err.h>
#include <grub/posix.h>
#include <grub/mm.h>
#include <grub/misc.h>
#include <grub/file.h>
#include <grub/term.h>

static grub_size_t current_fileno = 16;
static grub_size_t fileno_allocated = 0;
static const grub_size_t min_fileno = 16;
static struct grub_posix_file **files = 0;

struct grub_posix_file *
grub_posix_fopen (const char *path, const char *mode)
{
  struct grub_posix_file *ret;
  if (grub_strcmp (mode, "r") != 0)
    {
      grub_posix_errno = GRUB_ERR_POSIX_EROFS;
      return NULL;
    }
  ret = grub_zalloc (sizeof (*ret));
  if (!ret)
    goto fail;
  if (current_fileno >= fileno_allocated)
    {
	struct grub_posix_file **n;
	n = grub_realloc (files, sizeof (files[0]) * 2 * fileno_allocated);
	if (!n)
	  goto fail;
	fileno_allocated *= 2;
	files = n;
    }
  ret->file = grub_file_open (path);
  if (!ret->file)
    goto fail;
  ret->fileno = current_fileno;
  files[current_fileno] = ret;
  return ret;
 fail:
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  grub_free (ret);
  return NULL;
}

int
grub_posix_fclose (struct grub_posix_file *fp)
{
  if (fp == grub_posix_stdin || fp == grub_posix_stdout
      || fp == grub_posix_stderr)
    return 0;
  grub_file_close (fp->file);
  files[fp->fileno] = 0;
  return 0;
}

int
grub_posix_feof (struct grub_posix_file *fp)
{
  if (fp == grub_posix_stdin || fp == grub_posix_stdout
      || fp == grub_posix_stderr)
    return 0;
  if (fp->file->offset == fp->file->size)
    return 1;
  return 0;
}

grub_size_t
grub_posix_fread (void *ptr0, grub_size_t size, grub_size_t nmemb,
		  struct grub_posix_file *stream)
{
  grub_ssize_t st;
  if (stream == grub_posix_stdout || stream == grub_posix_stderr)
    {
      stream->was_error = 1;
      return 0;
    }
  if (stream == grub_posix_stdin)
    {
      grub_uint8_t *ptr;
      for (ptr = ptr0; ptr < (grub_uint8_t *) ptr0 + size * nmemb; ptr++)
	{
	  int key;
	  key = grub_getkey ();
	  if (key == (GRUB_TERM_CTRL | 'd') || key == (GRUB_TERM_CTRL | 'D'))
	    break;
	  *ptr = key;
	}
      st = ptr - (grub_uint8_t *) ptr0;
    }
  else
    st = grub_file_read (ptr0, stream, size * nmemb);
  if (st < 0)
    {
      stream->was_error = 1;
      grub_posix_errno = grub_errno;
      grub_errno = 0;
      return 0;
    }
  return st / size;
}

static struct grub_posix_file *
get_file (int fd)
{
  if (fd == grub_posix_stdin_fileno)
    return grub_posix_stdin;
  if (fd == grub_posix_stdout_fileno)
    return grub_posix_stdout;
  if (fd == grub_posix_stderr_fileno)
    return grub_posix_stderr;
  if ((grub_size_t) fd < min_fileno || (grub_size_t) fd >= current_fileno
      || files[(grub_size_t) fd] == 0)
    return NULL;
  return files[(grub_size_t) fd];
}

grub_ssize_t
grub_posix_read (int fd, void *buf, grub_size_t count)
{
  grub_ssize_t st;
  struct grub_posix_file *file;
  file = get_file (fd);
  if (file == NULL)
    return -1;
  return grub_posix_fread (buf, 1, count, file);
}

char *
grub_posix_fgets (char *ptr0, int size, struct grub_posix_file *stream)
{
  if (stream == grub_posix_stdout || stream == grub_posix_stderr)
    return 0;
  if (size <= 0)
    return 0;
  if (stream == grub_posix_stdin)
    {
      char *ptr;
      for (ptr = ptr0; ptr < ptr0 + size - 1; )
	{
	  int key;
	  key = grub_getkey ();
	  if (key == (GRUB_TERM_CTRL | 'd') || key == (GRUB_TERM_CTRL | 'D'))
	    break;
	  *ptr = key;
	  ptr++;
	  if (key == '\n')
	    break;
	}
      *ptr = 0;
      return ptr0;
    }
  else
    {
      grub_ssize_t st;
      grub_off_t off = grub_file_tell (stream->file);
      char *ptr;
      st = grub_file_read (stream->file, ptr0, size - 1);
      if (st < 0)
	{
	  stream->was_error = 1;
	  grub_posix_errno = grub_errno;
	  grub_errno = 0;
	  return 0;
	}
      ptr = grub_strchr (ptr0, '\n');
      if (ptr)
	{
	  ptr[1] = 0;
	  grub_file_seek (stream->file, off + ptr - ptr0 + 1);
	  return ptr0;
	}
      ptr0[size - 1] = 0;
      return ptr0;
    }
}

grub_ssize_t
grub_posix_write_console (const void *buf, grub_size_t count)
{
  char *tmp;
  tmp = grub_malloc (count + 1);
  if (!tmp)
    {
      grub_posix_errno = grub_errno;
      grub_errno = 0;
      return -1;
    }
  grub_memcpy (tmp, buf, count);
  tmp[count] = 0;
  grub_xputs (tmp);
  grub_free (tmp);
  return count;
}

grub_off_t
grub_posix_seek (int fd, grub_off_t offset, int whence)
{
  struct grub_posix_file *file;
  grub_off_t ret, newpos;
  if (fd == grub_posix_stdin_fileno || fd == grub_posix_stdout_fileno
      || fd == grub_posix_stderr_fileno)
    return -1;
  file = get_file (fd);
  if (file == NULL)
    return -1;
  switch (whence)
    {
    case GRUB_POSIX_SEEK_SET:
      newpos = offset;
      break;
    case GRUB_POSIX_SEEK_CUR:
      newpos = file->file->offset + offset;
      break;
    case GRUB_POSIX_SEEK_END:
      newpos = grub_file_size (file->file) - offset;
      break;
    default:
      return -1;
    }
  ret = grub_file_seek (file->file, newpos);
  grub_posix_errno = grub_errno;
  grub_errno = 0;
  return ret;
}

int 
grub_posix_close (int fd)
{
  struct grub_posix_file *file;
  file = get_file (fd);
  if (file == NULL)
    return -1;
  return grub_posix_fclose (file);
}

grub_off_t
grub_posix_get_file_size (int fd)
{
  struct grub_posix_file *file;
  file = get_file (fd);
  if (file == NULL)
    return 0;
  return file->file->size;
}
