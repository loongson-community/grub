/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2011 Free Software Foundation, Inc.
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

#ifndef GRUB_SRM_HEADER
#define GRUB_SRM_HEADER	1

#include <grub/types.h>

grub_uint64_t grub_alpha_srm_dispatch (int code, ...);

enum
  {
    GRUB_ALPHA_SRM_GETC = 1,
    GRUB_ALPHA_SRM_PUTS = 2,
    GRUB_ALPHA_SRM_OPEN_CONSOLE = 7,
    GRUB_ALPHA_SRM_OPEN = 0x10,
    GRUB_ALPHA_SRM_CLOSE = 0x11,
    GRUB_ALPHA_SRM_READ = 0x13,
    GRUB_ALPHA_GET_ENV = 0x22
  };

typedef grub_uint64_t grub_srm_fileno_t;

enum
  {
    GRUB_ALPHA_SRM_ENV_TTY = 0x0f
  };

enum grub_alpha_srm_memdesc_entry_type
  {
    GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_AVAILABLE = 0,
    GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_NONVOLATILE = 1,
    GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_RESERVED1 = 2,
    GRUB_ALPHA_SRM_MEMDESC_ENTRY_TYPE_RESERVED2 = 3,
  };

struct grub_alpha_srm_memdesc_entry
{
  grub_uint64_t start_page;
  grub_uint64_t num_pages;
  grub_uint64_t unused[4];
  grub_uint64_t type;
};

struct grub_alpha_srm_memdesc
{
  grub_uint64_t checksum;
  grub_uint64_t unused;
  grub_uint64_t num_entries;
  struct grub_alpha_srm_memdesc_entry entries[0];
};

struct grub_alpha_srm_hwrpb
{
  grub_uint64_t paddr;
  char magic[8];
  grub_uint64_t hwrpb_version;
  grub_uint64_t hwrpb_size;
  grub_uint64_t primary_cpu_id;
  grub_uint64_t page_size;
  grub_uint64_t unused1[14 - 6];
  grub_uint64_t pcc_freq;
  grub_uint64_t unused2[4];
  grub_uint64_t cpu_slot_size;
  grub_uint64_t cpu_slots_offset;
  grub_uint64_t unused3[4];
  grub_uint64_t memory_descriptor_table;
  grub_uint64_t unused4[30-26];
  grub_uint64_t vptb;
  grub_uint64_t unused5[72 - 31];
  grub_uint64_t checksum;
};

struct grub_alpha_srm_hwpcb
{
  grub_uint64_t ksp;
  grub_uint64_t esp;
  grub_uint64_t ssp;
  grub_uint64_t usp;
  grub_uint64_t ptbr;
};

#define GRUB_ALPHA_SRM_HWRPB_ADDR 0x10000000
#define GRUB_ALPHA_SRM_HWRPB (*(struct grub_alpha_srm_hwrpb *) GRUB_ALPHA_SRM_HWRPB_ADDR)

void grub_srmdisk_init (void);
void grub_srmdisk_fini (void);

#endif
