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

#include <grub/dl.h>
#include <grub/elf.h>
#include <grub/misc.h>
#include <grub/err.h>
#include <grub/cpu/types.h>
#include <grub/mm.h>

void
grub_arch_dl_get_tramp_got_size (const void *ehdr, grub_size_t *tramp,
				 grub_size_t *got)
{
  const Elf64_Ehdr *e = ehdr;
  grub_size_t cntt = 0, cntg = 0;;
  const Elf64_Shdr *s;
  Elf64_Word entsize;
  unsigned i;

  /* Find a symbol table.  */
  for (i = 0, s = (Elf64_Shdr *) ((char *) e + grub_le_to_cpu32 (e->e_shoff));
       i < grub_le_to_cpu16 (e->e_shnum);
       i++, s = (Elf64_Shdr *) ((char *) s + grub_le_to_cpu16 (e->e_shentsize)))
    if (grub_le_to_cpu32 (s->sh_type) == SHT_SYMTAB)
      break;

  if (i == grub_le_to_cpu16 (e->e_shnum))
    return;

  entsize = s->sh_entsize;

  for (i = 0, s = (Elf64_Shdr *) ((char *) e + grub_le_to_cpu32 (e->e_shoff));
       i < grub_le_to_cpu16 (e->e_shnum);
       i++, s = (Elf64_Shdr *) ((char *) s + grub_le_to_cpu16 (e->e_shentsize)))
    if (grub_le_to_cpu32 (s->sh_type) == SHT_RELA)
      {
	Elf64_Rela *rel, *max;

	for (rel = (Elf64_Rela *) ((char *) e + grub_le_to_cpu32 (s->sh_offset)),
	       max = rel + grub_le_to_cpu32 (s->sh_size) / grub_le_to_cpu16 (s->sh_entsize);
	     rel < max; rel++)
	  switch (ELF64_R_TYPE (grub_le_to_cpu32 (rel->r_info)))
	    {
	    case R_ALPHA_LITERAL:
	      cntg++;
	      break;
	    default:;
	    }
      }
  *tramp = cntt;
  *got = cntg;
}


/* Check if EHDR is a valid ELF header.  */
grub_err_t
grub_arch_dl_check_header (void *ehdr)
{
  Elf_Ehdr *e = ehdr;

  /* Check the magic numbers.  */
  if (e->e_ident[EI_CLASS] != ELFCLASS64
      || e->e_ident[EI_DATA] != ELFDATA2LSB
      || e->e_machine != EM_ALPHA)
    return grub_error (GRUB_ERR_BAD_OS, "invalid arch specific ELF magic");

  return GRUB_ERR_NONE;
}

/* Relocate symbols.  */
grub_err_t
grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr)
{
  Elf_Ehdr *e = ehdr;
  Elf_Shdr *s;
  Elf_Word entsize;
  unsigned i;
  grub_uint8_t *gp;
  grub_uint64_t *gpptr;

  gp = (grub_uint8_t *) mod->got;
  gpptr = (grub_uint64_t *) mod->got;

  /* Find a symbol table.  */
  for (i = 0, s = (Elf_Shdr *) ((char *) e + e->e_shoff);
       i < e->e_shnum;
       i++, s = (Elf_Shdr *) ((char *) s + e->e_shentsize))
    if (s->sh_type == SHT_SYMTAB)
      break;

  if (i == e->e_shnum)
    return grub_error (GRUB_ERR_BAD_MODULE, "no symtab found");

  entsize = s->sh_entsize;

  for (i = 0, s = (Elf_Shdr *) ((char *) e + e->e_shoff);
       i < e->e_shnum;
       i++, s = (Elf_Shdr *) ((char *) s + e->e_shentsize))
    if (s->sh_type == SHT_RELA)
      {
	grub_dl_segment_t seg;

	/* Find the target segment.  */
	for (seg = mod->segment; seg; seg = seg->next)
	  if (seg->section == s->sh_info)
	    break;

	if (seg)
	  {
	    Elf_Rela *rel, *max;

	    for (rel = (Elf_Rela *) ((char *) e + s->sh_offset),
		   max = (Elf_Rela *) ((char *) rel + s->sh_size);
		 rel < max;
		 rel++)
	      {
		grub_uint8_t *addr;
		Elf_Sym *sym;
		grub_uint64_t value;

		if (seg->size < rel->r_offset)
		  return grub_error (GRUB_ERR_BAD_MODULE,
				     "reloc offset is out of the segment");

		addr = (grub_uint8_t *) seg->addr + rel->r_offset;
		sym = (Elf_Sym *) ((char *) mod->symtab
				     + entsize * ELF_R_SYM (rel->r_info));

		value = sym->st_value + rel->r_addend;
		switch (ELF_R_TYPE (rel->r_info))
		  {
		  case R_ALPHA_REFQUAD:
		    *(grub_uint64_t *) addr += value;
		    break;
		  case R_ALPHA_REFLONG:
		    *(grub_uint32_t *) addr += value;
		    break;

		  case R_ALPHA_GPREL32:
		    *(grub_uint32_t *) addr += value - (grub_addr_t) gp;
		    break;

		  case R_ALPHA_GPDISP:
		    {
		      grub_int64_t off = gp - addr;

		      if (off < (-2147483647L - 1)
			  || off > 2147483647L)
			return grub_error (GRUB_ERR_BAD_MODULE,
					   "gpdisp offset too large");
		      /* Lower part is
			 treated as signed. Hence add 0x8000 to compensate. 
		       */
		      *(grub_uint16_t *) addr = (off + 0x8000) >> 16;
		      *(grub_uint16_t *) (addr + rel->r_addend) = off;
		      break;
		    }

		  case R_ALPHA_GPRELHIGH:
		    {
		      Elf_Rela *rel2;

		      /* Handle partner lo16 relocation. Lower part is
			 treated as signed. Hence add 0x8000 to compensate. 
		       */
		      value += (*(grub_uint16_t *) addr << 16);
		      value -= (grub_addr_t) gp;
		      for (rel2 = rel + 1; rel2 < max; rel2++)
			if (ELF_R_SYM (rel2->r_info)
			    == ELF_R_SYM (rel->r_info)
			    && ELF_R_TYPE (rel2->r_info) == R_ALPHA_GPRELLOW)
			  {
			    value += *(grub_int16_t *)
			      ((char *) seg->addr + rel2->r_offset);
			    break;
			  }
		      /* Handle partner lo16 relocation. Lower part is
			 treated as signed. Hence add 0x8000 to compensate. 
		      */
		      if ((grub_int64_t) value < (-2147483647L - 1)
			  || (grub_int64_t) value > 2147483647L)
			return grub_error (GRUB_ERR_BAD_MODULE,
					   "gpdisp offset too large");
		      value += 0x8000;
		      *(grub_uint16_t *) addr = (value >> 16) & 0xffff;
		      break;
		    }
		  case R_ALPHA_GPRELLOW:
		    value -= (grub_addr_t) gp;
		    *(grub_uint16_t *) addr += value & 0xffff;
		    break;
		  case R_ALPHA_LITERAL:
		    *gpptr = value + *(grub_uint16_t *) addr;
		    *(grub_uint16_t *) addr = ((grub_uint8_t *) gpptr - gp);
		    gpptr++;
		    break;
		  case R_ALPHA_SREL32:
		    *(grub_uint32_t *) addr += value - (grub_addr_t) seg->addr;
		    break;
		  case R_ALPHA_BRSGP:
		    value += (((*(grub_uint32_t *) addr)
			       & ((1 << 21) - 1)) << 2);
		    value -= (grub_addr_t) addr;
		    if (sym->st_other == STO_ALPHA_STD_GPLOAD)
		      value += 4;
		    else
		      value -= 4;
		    if (value & 3)
		      return grub_error (GRUB_ERR_BAD_MODULE,
					 "unaligned branch");

		    if ((value & ~((1UL << 22) - 1)) != 0
			&& (value & ~((1UL << 22) - 1)) != ~((1UL << 22) - 1))
		      return grub_error (GRUB_ERR_BAD_MODULE,
					 "brs offset too large (%lx)",
					 value);

		    *(grub_uint32_t *) addr
		      = ((*(grub_uint32_t *) addr & ~((1 << 21) - 1))
			 | ((value >> 2) & ((1 << 21) - 1)));
		    break;

		  case R_ALPHA_LITUSE:
		  case R_ALPHA_HINT:
		    break;

		  default:
		    {
		      return grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET,
					 "Unknown relocation type %d\n",
					 ELF_R_TYPE (rel->r_info));
		    }
		    break;
		  }
	      }
	  }
      }

  return GRUB_ERR_NONE;
}

