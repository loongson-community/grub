#ifndef GRUB_POSIX_LIBINTL_H
#define GRUB_POSIX_LIBINTL_H	1

#include <grub/i18n.h>

/* FIXME: sloppy.  */
#define setlocale(x,y) 0
#define bindtextdomain(x,y)
#define textdomain(x)

#ifdef GRUB_POSIX_GETTEXT_DOMAIN
static inline const char *
gettext (const char *str)
{
  return grub_dgettext (GRUB_POSIX_GETTEXT_DOMAIN, str);
}
#endif

static inline const char *
dgettext (const char *dom, const char *str)
{
  return grub_dgettext (dom, str);
}

/* Not really implemented, just declarations.  */
char * dcgettext (const char * domainname, const char * msgid,
		  int category);
char * dcngettext (const char * domainname,
		   const char * msgid, const char * msgid_plural,
		   unsigned long int n, int category);

#endif
