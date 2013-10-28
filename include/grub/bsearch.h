#ifndef GRUB_BSEARCH_H
#define GRUB_BSEARCH_H 1

#include <grub/misc.h>
/* For comparator.  */
#include <grub/priority_queue.h>

void *
grub_bsearch (const void *key, const void *base, grub_size_t nmemb,
	      grub_size_t size, grub_comparator_t compar);

#endif
