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

#include <grub/machine/srm.h>
#include <grub/machine/console.h>
#include <grub/term.h>
#include <grub/terminfo.h>

static int
readkey (struct grub_term_input *term __attribute__ ((unused)))
{
  grub_uint64_t c;
  c = grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_GETC, 0);
  if (c & (1ULL << 63))
    return -1;

  return c & 0xffffffff;
}

#define NEWLINE " \r\n "

static void
put (struct grub_term_output *term __attribute__ ((unused)), const int c)
{
  char chr = c;

  if (c == '\n')
    {
      const char *str = NEWLINE, *ptr;
      for (ptr = str; ptr < str + sizeof (NEWLINE) - 1; )
	ptr += (grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_PUTS, 0, ptr,
					 str + sizeof (NEWLINE) - 1 - ptr) 
		& 0xff);
      return;
    }

  grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_PUTS, 0, &chr, 1);
}

static struct grub_terminfo_output_state grub_console_terminfo_output;

static grub_err_t
grub_console_init_output (struct grub_term_output *term)
{
  /* FIXME: get dimensions. */
  grub_terminfo_output_init (term);

  return 0;
}

static struct grub_terminfo_input_state grub_console_terminfo_input =
  {
    .readkey = readkey
  };

static struct grub_terminfo_output_state grub_console_terminfo_output =
  {
    .put = put,
    .width = 80,
    .height = 25
  };

static struct grub_term_input grub_console_term_input =
  {
    .name = "console",
    .init = grub_terminfo_input_init,
    .getkey = grub_terminfo_getkey,
    .data = &grub_console_terminfo_input
  };

static struct grub_term_output grub_console_term_output =
  {
    .name = "console",
    .init = grub_console_init_output,
    .putchar = grub_terminfo_putchar,
    .getxy = grub_terminfo_getxy,
    .getwh = grub_terminfo_getwh,
    .gotoxy = grub_terminfo_gotoxy,
    .cls = grub_terminfo_cls,
    .setcolorstate = grub_terminfo_setcolorstate,
    .setcursor = grub_terminfo_setcursor,
    .flags = GRUB_TERM_CODE_TYPE_ASCII,
    .data = &grub_console_terminfo_output,
    .normal_color = GRUB_TERM_DEFAULT_NORMAL_COLOR,
    .highlight_color = GRUB_TERM_DEFAULT_HIGHLIGHT_COLOR,
  };

void
grub_console_init_early (void)
{
  grub_alpha_srm_dispatch (GRUB_ALPHA_SRM_OPEN_CONSOLE);

  grub_term_register_input ("console", &grub_console_term_input);
  grub_term_register_output ("console", &grub_console_term_output);
}

void grub_terminfo_init (void);

void
grub_console_init_lately (void)
{
  grub_terminfo_init ();
  /* FIXME */
  grub_terminfo_output_register (&grub_console_term_output, "srm");
}

