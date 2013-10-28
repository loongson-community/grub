#ifndef GRUB_SORT_H
#define GRUB_SORT_H 1

#include <grub/misc.h>
/* For comparator.  */
#include <grub/priority_queue.h>

void
grub_hsort (void *base, grub_size_t nmemb, grub_size_t size,
	    grub_comparator_t compar);
void
grub_qsort (void *base, grub_size_t nmemb, grub_size_t size,
	    grub_comparator_t compar);

#endif
