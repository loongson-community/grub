#include <grub/err.h>
#include <grub/misc.h>
#include <grub/posix.h>

grub_err_t grub_posix_errno;

static const char *posix_errmsg[] =
  {
    [GRUB_ERR_NONE] = "success",
    [GRUB_ERR_BAD_NUMBER] = N_("unrecognized number"),
    [GRUB_ERR_OUT_OF_MEMORY] = N_("out of memory"),
    [GRUB_ERR_AGAIN] = "waiting",
    /* FIXME: Disambiguate this.  */
    [GRUB_ERR_IO] = "I/O error",
    [GRUB_ERR_POSIX_EROFS] = "no FS writing support",
    [GRUB_ERR_ACCESS_DENIED] = N_("access denied"),
    [GRUB_ERR_BAD_ARGUMENT] = "invalid argument"
  };

const char *
grub_posix_strerror (grub_err_t err)
{
  if (err < ARRAY_SIZE (posix_errmsg) && posix_errmsg[err])
    return _(posix_errmsg[err]);
  return grub_errmsg;
}
