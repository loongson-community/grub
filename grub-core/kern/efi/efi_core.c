/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2006,2007,2008,2009,2010,2013  Free Software Foundation, Inc.
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
#include <grub/efi/pe32.h>

static grub_efi_guid_t loaded_image_guid = GRUB_EFI_LOADED_IMAGE_GUID;

void *
grub_efi_open_protocol (grub_efi_handle_t handle,
			grub_efi_guid_t *protocol,
			grub_efi_uint32_t attributes)
{
  grub_efi_boot_services_t *b;
  grub_efi_status_t status;
  void *interface;

  b = grub_efi_system_table->boot_services;
  status = efi_call_6 (b->open_protocol, handle,
		       protocol,
		       &interface,
		       grub_efi_image_handle,
		       0,
		       attributes);
  if (status != GRUB_EFI_SUCCESS)
    return 0;

  return interface;
}

void
grub_exit (void)
{
  grub_efi_fini ();
  efi_call_4 (grub_efi_system_table->boot_services->exit,
              grub_efi_image_handle, GRUB_EFI_SUCCESS, 0, 0);
  for (;;) ;
}

grub_efi_loaded_image_t *
grub_efi_get_loaded_image (grub_efi_handle_t image_handle)
{
  return grub_efi_open_protocol (image_handle,
				 &loaded_image_guid,
				 GRUB_EFI_OPEN_PROTOCOL_GET_PROTOCOL);
}

/* Allocate pages. Return the pointer to the first of allocated pages.  */
void *
grub_efi_allocate_pages (grub_efi_physical_address_t address,
			 grub_efi_uintn_t pages)
{
  grub_efi_allocate_type_t type;
  grub_efi_status_t status;
  grub_efi_boot_services_t *b;

#if 1
  /* Limit the memory access to less than 4GB for 32-bit platforms.  */
  if (address > 0xffffffff)
    return 0;
#endif

#if 1
  if (address == 0)
    {
      type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
      address = 0xffffffff;
    }
  else
    type = GRUB_EFI_ALLOCATE_ADDRESS;
#else
  if (address == 0)
    type = GRUB_EFI_ALLOCATE_ANY_PAGES;
  else
    type = GRUB_EFI_ALLOCATE_ADDRESS;
#endif

  b = grub_efi_system_table->boot_services;
  status = efi_call_4 (b->allocate_pages, type, GRUB_EFI_LOADER_DATA, pages, &address);
  if (status != GRUB_EFI_SUCCESS)
    return 0;

  if (address == 0)
    {
      /* Uggh, the address 0 was allocated... This is too annoying,
	 so reallocate another one.  */
      address = 0xffffffff;
      status = efi_call_4 (b->allocate_pages, type, GRUB_EFI_LOADER_DATA, pages, &address);
      grub_efi_free_pages (0, pages);
      if (status != GRUB_EFI_SUCCESS)
	return 0;
    }

  return (void *) ((grub_addr_t) address);
}

/* Free pages starting from ADDRESS.  */
void
grub_efi_free_pages (grub_efi_physical_address_t address,
		     grub_efi_uintn_t pages)
{
  grub_efi_boot_services_t *b;

  b = grub_efi_system_table->boot_services;
  efi_call_2 (b->free_pages, address, pages);
}


#pragma GCC diagnostic ignored "-Wcast-align"

/* Search the mods section from the PE32/PE32+ image. This code uses
   a PE32 header, but should work with PE32+ as well.  */
int
grub_efi_get_section (const char *name,
		      grub_addr_t *start, grub_size_t *sz)
{
  grub_efi_loaded_image_t *image;
  struct grub_pe32_header *header;
  struct grub_pe32_coff_header *coff_header;
  struct grub_pe32_section_table *sections;
  struct grub_pe32_section_table *section;
  grub_uint16_t i;

  *start = 0;
  if (sz)
    *sz = 0;

  image = grub_efi_get_loaded_image (grub_efi_image_handle);
  if (! image)
    return 0;

  header = image->image_base;
  coff_header = &(header->coff_header);
  sections
    = (struct grub_pe32_section_table *) ((char *) coff_header
					  + sizeof (*coff_header)
					  + coff_header->optional_header_size);

  for (i = 0, section = sections;
       i < coff_header->num_sections;
       i++, section++)
    {
      if (grub_strcmp (section->name, name) == 0)
	break;
    }

  if (i == coff_header->num_sections)
    return 0;

  *start = ((grub_addr_t) image->image_base + section->virtual_address);
  if (sz)
    *sz = section->virtual_size;

  return 1;
}

#pragma GCC diagnostic error "-Wcast-align"
