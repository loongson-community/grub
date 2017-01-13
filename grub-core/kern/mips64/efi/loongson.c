/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2017 Free Software Foundation, Inc.
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

#include <grub/efi/efi.h>
#include <grub/cpu/time.h>
#include <grub/loader.h>
#include <grub/machine/loongson.h>

void
grub_efi_loongson_init (void)
{
  grub_efi_loongson_smbios_table *smbios_table;
  grub_efi_loongson_cpu_info *cpu_info;

  smbios_table = grub_efi_loongson_get_smbios_table ();
  if (!smbios_table)
    grub_fatal ("cannot found Loongson SMBIOS!");

  cpu_info = (grub_efi_loongson_cpu_info *) smbios_table->lp.cpu_offset;
  grub_dprintf ("loongson", "cpu clock %u\n", cpu_info->cpu_clock_freq);

  grub_timer_init (cpu_info->cpu_clock_freq);

  grub_efi_loongson_alloc_boot_params ();
}

void
grub_efi_loongson_fini (int flags)
{
  if (!(flags & GRUB_LOADER_FLAG_LOONGSON_BOOT_PARAMS_NOFREE))
    grub_efi_loongson_free_boot_params ();
}
