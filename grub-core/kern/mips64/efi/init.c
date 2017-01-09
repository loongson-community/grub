/* init.c - initialize an arm-based EFI system */
/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2013 Free Software Foundation, Inc.
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

#include <grub/env.h>
#include <grub/kernel.h>
#include <grub/misc.h>
#include <grub/mm.h>
#include <grub/cpu/time.h>
#include <grub/efi/efi.h>
#include <grub/loader.h>

void
grub_machine_init (void)
{
  grub_efi_init ();

  /* FIXME: Get cpuclock from EFI. */
  grub_timer_init (1000000000U);
}

void
grub_machine_fini (int flags)
{
  if (!(flags & GRUB_LOADER_FLAG_NORETURN))
    return;

  grub_efi_fini ();
}
