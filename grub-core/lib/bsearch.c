#include <grub/bsearch.h>
#include <grub/dl.h>
#include <grub/mm.h>
#include <grub/misc.h>

GRUB_MOD_LICENSE ("GPLv3+");

void *
grub_bsearch (const void *key, const void *base, grub_size_t nmemb,
	      grub_size_t size, int (*compar)(const void *, const void *))
{
  grub_size_t cur = 0;
  int i;
  const void *el;
  int cmp;
  for (i = 0; (1U << i) < nmemb; i++);
  for (i--; i; i--)
    {
      if ((cur | (1U << i)) >= nmemb)
	continue;
      el = (const char *) base + size * (cur | (1 << i));
      cmp = compar (el, key);
      if (cmp < 0)
	cur |= (1 << i);
      if (cmp == 0)
	return (void *) el;
    }
  el = (const char *) base + size * (cur | (1 << i));
  cmp = compar (el, key);
  if (cmp == 0)
    return (void *) el;
  return NULL;
}
