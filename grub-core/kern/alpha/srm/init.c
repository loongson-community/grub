/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2011  Free Software Foundation, Inc.
 *
 *  GRUB is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  GRUB is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <grub/types.h>
#include <grub/misc.h>
#include <grub/mm.h>
#include <grub/time.h>
#include <grub/err.h>
#include <grub/dl.h>
#include <grub/cache.h>
#include <grub/kernel.h>
#include <grub/memory.h>
#include <grub/env.h>
#include <grub/machine/srm.h>
#include <grub/machine/console.h>

/* FIXME: determine va_size.  */
static void *kseg_addr = (void *) 0xfffffc0000000000;
static grub_uint64_t log_page_size;

extern char _start[];
extern char _end[];

grub_uint32_t grub_arch_pccclock;

/* FIXME: use interrupt to count high.  */
grub_uint64_t
grub_get_rtc (void)
{
  static grub_uint32_t high = 0;
  static grub_uint32_t last = 0;
  grub_uint32_t low;

  asm volatile ("rpcc %0" : "=r" (low));
  if (low < last)
    high++;
  last = low;

  return (((grub_uint64_t) high) << 32) | low;
}

static grub_addr_t
get_pfn (grub_addr_t va, grub_uint64_t ptbr)
{
  grub_uint64_t *l1;
  grub_uint64_t l1n;
  grub_uint64_t *l2;
  grub_uint64_t l2n;
  grub_uint64_t *l3;
  grub_uint64_t l3n;

  l3n = va >> log_page_size;
  l2n = l3n >> (log_page_size - 3);
  l1n = l2n >> (log_page_size - 3);
  l3n &= ((1 << (log_page_size - 3)) - 1);
  l2n &= ((1 << (log_page_size - 3)) - 1);
  l1n &= ((1 << (log_page_size - 3)) - 1);

  l1 = ((grub_uint64_t *) kseg_addr + (ptbr << (log_page_size - 3))
	+ l1n);
  l2 = ((grub_uint64_t *) kseg_addr + ((*l1 >> 32) << (log_page_size - 3))
	+ l2n);
  l3 = ((grub_uint64_t *) kseg_addr + ((*l2 >> 32) << (log_page_size - 3))
	+ l3n);
  return (*l3 >> 32);
}

void pal_init(void);

grub_addr_t grub_modbase;

void
grub_machine_get_bootlocation (char **device __attribute__ ((unused)),
			       char **path __attribute__ ((unused)))
{
}

void
grub_machine_init (void)
{
  unsigned i;
  struct grub_alpha_srm_memdesc *memdesc;
  struct grub_alpha_srm_hwpcb *pcb;
  grub_addr_t a;
  grub_addr_t start, end;
  grub_uint64_t low_pfn = ~0ULL, high_pfn = 0;

  grub_arch_pccclock = GRUB_ALPHA_SRM_HWRPB.pcc_freq;
  grub_modbase = (grub_addr_t) _end;

  grub_console_init_early ();

  pal_init ();

  grub_install_get_time_ms (grub_rtc_get_time_ms);

  for (log_page_size = 0;
       !((1 << log_page_size) & GRUB_ALPHA_SRM_HWRPB.page_size);
       log_page_size++);

  memdesc = (struct grub_alpha_srm_memdesc *)
    (GRUB_ALPHA_SRM_HWRPB_ADDR + GRUB_ALPHA_SRM_HWRPB.memory_descriptor_table);

  pcb = (void *) (GRUB_ALPHA_SRM_HWRPB_ADDR
		  + GRUB_ALPHA_SRM_HWRPB.cpu_slots_offset
		  + (GRUB_ALPHA_SRM_HWRPB.primary_cpu_id
		     * GRUB_ALPHA_SRM_HWRPB.cpu_slot_size));

  start = ALIGN_DOWN ((grub_addr_t) (&_start[0]),
		      GRUB_ALPHA_SRM_HWRPB.page_size);
  end = ALIGN_UP (grub_modules_get_end (), GRUB_ALPHA_SRM_HWRPB.page_size);
  for (a = start; a < end; a += GRUB_ALPHA_SRM_HWRPB.page_size)
    {
      grub_uint64_t curpfn = get_pfn (a, pcb->ptbr);
      if (curpfn > high_pfn)
	high_pfn = curpfn;
      if (curpfn < low_pfn)
	low_pfn = curpfn;
    }
  
  for (i = 0; i < memdesc->num_entries; i++)
    {
      grub_uint64_t from, to;
      if (memdesc->entries[i].type
	  != GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_AVAILABLE)
	continue;
      from = memdesc->entries[i].start_page;
      to = memdesc->entries[i].start_page + memdesc->entries[i].num_pages;
      if ((to > low_pfn) && (from < high_pfn + 1))
	{
	  if (from < low_pfn)
	    /* from .. (lowpfn - 1) */
	    grub_mm_init_region ((char *) kseg_addr + (from << log_page_size),
				 (low_pfn - from) << log_page_size);
	  if (high_pfn + 1 < to)
	    /* (high_pfn + 1) .. (to - 1) */
	    grub_mm_init_region ((char *) kseg_addr
				 + ((high_pfn + 1) << log_page_size),
				 (to - high_pfn - 1) << log_page_size);
	}
      else
	/* from .. (to - 1) */
	grub_mm_init_region ((char *) kseg_addr
			     + (from << log_page_size),
			     (to - from) << log_page_size);
    }

  grub_console_init_lately ();

  grub_srmdisk_init ();

  char buf[512];
  grub_alpha_srm_dispatch (0x22, 2, buf, sizeof (buf));
  grub_printf ("Hello World %s\n", buf);
}

void
grub_machine_fini (void)
{
}

void
grub_exit (void)
{
  while (1);
}

void
grub_reboot (void)
{
  while (1);
}

grub_err_t
grub_machine_mmap_iterate (grub_memory_hook_t hook, void *hook_data)
{
  struct grub_alpha_srm_memdesc *memdesc;
  unsigned i;

  memdesc = (struct grub_alpha_srm_memdesc *)
    (GRUB_ALPHA_SRM_HWRPB_ADDR + GRUB_ALPHA_SRM_HWRPB.memory_descriptor_table);

  for (i = 0; i < memdesc->num_entries; i++)
    switch (memdesc->entries[i].type)
      {
      case GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_AVAILABLE:
	hook (memdesc->entries[i].start_page << log_page_size,
	      memdesc->entries[i].num_pages << log_page_size,
	      GRUB_MEMORY_AVAILABLE, hook_data);
	break;
      case GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_NONVOLATILE:
	hook (memdesc->entries[i].start_page << log_page_size,
	      memdesc->entries[i].num_pages << log_page_size,
	      GRUB_MEMORY_NVRAM, hook_data);
	break;
      case GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_RESERVED1:
      case GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_RESERVED2:
      default:
	hook (memdesc->entries[i].start_page << log_page_size,
	      memdesc->entries[i].num_pages << log_page_size,
	      GRUB_MEMORY_RESERVED, hook_data);
	break;
      }
  return GRUB_ERR_NONE;
}

