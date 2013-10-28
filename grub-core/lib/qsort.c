#include <grub/sort.h>

static void *
get_el (void *base, grub_size_t size, grub_size_t n)
{
  return (char *) base + size * n;
}

static void
swap (void *base, grub_size_t size, grub_size_t a, grub_size_t b)
{
  grub_size_t i;
  grub_uint8_t t;
  grub_uint8_t *aptr = get_el (base, size, a);
  grub_uint8_t *bptr = get_el (base, size, b);

  for (i = 0; i < size; i++)
    {
      t = *aptr;
      *aptr = *bptr;
      *bptr = t;
      aptr++;
      bptr++;
    }
}

void
grub_hsort (void *base, grub_size_t nmemb, grub_size_t size,
	    int (*compar) (const void *, const void *))
{
  grub_priority_queue_t pq;
  grub_size_t i;
  pq = grub_priority_queue_new (size, compar);
  for (i = 0; i < nmemb; i++)
    grub_priority_queue_push (pq, get_el (base, size, i));
  for (i = 0; i < nmemb; i++)
    {
      grub_memcpy (get_el (base, size, nmemb - i - 1),
		   grub_priority_queue_top (pq), size);
      grub_priority_queue_pop (pq);
    }
}

static void
grub_qsort_real (void *base, grub_size_t nmemb, grub_size_t size,
		 int (*compar) (const void *, const void *), int max_depth)
{
  grub_size_t pre, post, pivot;
  pivot = nmemb / 2;
  pre = 0;
  post = 0;

  if (nmemb <= 1)
    return;
  if (max_depth == 0)
    {
      grub_hsort (base, nmemb, size, compar);
      return;
    }

  while (pre + post < nmemb)
    {
      if (compar (get_el (base, size, pre + 1), get_el (base, size, pivot)) <= 0)
	pre++;
      else
	{
	  swap (base, size, pre + 1, nmemb - post - 1);
	  if (pivot == pre + 1)
	    pivot = nmemb - post - 1;
	  post++;
	}
    }
  grub_qsort_real (base, pre, size, compar, max_depth - 1);
  grub_qsort_real (get_el (base, size, pre), pre, size, compar, max_depth - 1);
}

void
grub_qsort (void *base, grub_size_t nmemb, grub_size_t size,
	    int (*compar) (const void *, const void *))
{
  int i;
  for (i = 0; nmemb >> i; i++);
  i *= 3;
  grub_qsort_real (base, nmemb, size, compar, i);
}
