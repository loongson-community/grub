/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2013  Free Software Foundation, Inc.
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

#include <grub/kernel.h>
#include <grub/efi/efi.h>
#include <grub/decompressor.h>

/* The handle of GRUB itself. Filled in by the startup code.  */
grub_efi_handle_t grub_efi_image_handle;

/* The pointer to a system table. Filled in by the startup code.  */
grub_efi_system_table_t *grub_efi_system_table;

int
grub_strcmp (const char *s1, const char *s2)
{
  while (*s1 && *s2)
    {
      if (*s1 != *s2)
	break;

      s1++;
      s2++;
    }

  return (int) (grub_uint8_t) *s1 - (int) (grub_uint8_t) *s2;
}

static grub_size_t unc_pages, scratch_pages;
static void *unc;

void
grub_efi_fini (void)
{
  if (unc)
    grub_efi_free_pages ((grub_addr_t) unc, unc_pages);
  if (grub_decompressor_scratch)
    grub_efi_free_pages ((grub_addr_t) grub_decompressor_scratch,
			 scratch_pages);
}

void
find_scratch (void *src __attribute__ ((unused)),
	      void *dst __attribute__ ((unused)),
	      unsigned long srcsize __attribute__ ((unused)),
	      unsigned long dstsize __attribute__ ((unused)))
{
}

void __attribute__ ((noreturn))
grub_main (void)
{
  grub_addr_t start;
  grub_size_t sz;
  grub_addr_t unc_size;
  grub_efi_boot_services_t *b;
  grub_efi_status_t status;
  grub_efi_uintn_t exit_data_size;
  grub_efi_char16_t *exit_data = 0;
  grub_efi_handle_t image_handle;
  grub_efi_loaded_image_t *image;

  b = grub_efi_system_table->boot_services;

  if (!grub_efi_get_section ("payload", &start, &sz)
      || sz < 12)
    grub_exit ();
  if (grub_memcmp ((void *) start, "COMPRESS", 8) != 0)
    grub_exit ();
  unc_size = grub_get_unaligned32 ((char *) start + 8);

  unc_pages = (unc_size + 0xfff) >> 12;

  unc = grub_efi_allocate_pages (0, unc_pages);
  if (!unc)
    grub_exit ();

  scratch_pages = 0x200000 >> 12;
  grub_decompressor_scratch = grub_efi_allocate_pages (0, scratch_pages);
  if (!grub_decompressor_scratch)
    grub_exit ();

  grub_decompress_core ((char *) start + 12, unc, sz - 12,
			unc_size);

  image = grub_efi_get_loaded_image (grub_efi_image_handle);

  status = efi_call_6 (b->load_image, 0, grub_efi_image_handle,
		       image->file_path, unc, unc_size, &image_handle);
  if (status != GRUB_EFI_SUCCESS)
    efi_call_4 (grub_efi_system_table->boot_services->exit,
		grub_efi_image_handle, status, 0, 0);

  status = efi_call_3 (b->start_image, image_handle, &exit_data_size, &exit_data);

  efi_call_4 (grub_efi_system_table->boot_services->exit,
              grub_efi_image_handle, status, exit_data_size, exit_data);

  grub_exit ();
}

