/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2010  Free Software Foundation, Inc.
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

#ifndef GRUB_MENU_TEXT_HEADER
#define GRUB_MENU_TEXT_HEADER	1

#define GRUB_

/* The number of columns/lines between messages/borders/etc.  */
static inline int
grub_term_margin (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return 0;
  return 1;
}

/* The number of lines of "GRUB version..." at the top.  */
static inline int
grub_term_info_height (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return 0;
  return 1;
}

static inline int
grub_term_left_border_x (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return 0;
  return 1;
}

/* margin + info_height + margin.  */
static inline int
grub_term_top_border_y (struct grub_term_output *term)
{
 if (grub_term_is_tiny (term))
    return 0;
  return 3;
}

/* margin + info_height + margin + margin.  */
static inline int
grub_term_first_entry_y  (struct grub_term_output *term)
{
 if (grub_term_is_tiny (term))
    return 0;
  return 4;
}

/* The width of the border.  */
static inline unsigned
grub_term_border_width (struct grub_term_output *term)
{
  if (grub_term_height (term) == 1)
    return grub_term_width (term) - 2;
  if (grub_term_is_tiny (term))
    return grub_term_width (term) - 1;
  
  /* - 3 * margin - scroll. */
  return grub_term_width (term) - 3;
}

/* The height of the border.  */
static inline unsigned
grub_term_border_height (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return grub_term_height (term);
  return grub_term_height (term) - 3 - 8;
}

/* The number of entries shown at a time.  */
static inline int
grub_term_num_entries (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return grub_term_height (term);

  return grub_term_border_height (term) - 2;
}

/* The max column number of an entry. The last "-1" is for a
   continuation marker.  */
static inline int
grub_term_entry_width (struct grub_term_output *term)
{
  if (grub_term_height (term) == 1)
    return grub_term_width (term) - 2;

  if (grub_term_is_tiny (term))
    return grub_term_width (term) - 1;

  return grub_term_border_width (term) - 2 - 2 - 1;
}

static inline int
grub_term_cursor_x (struct grub_term_output *term)
{
  if (grub_term_is_tiny (term))
    return grub_term_border_width (term);
  return (1 + grub_term_border_width (term) - 1 - 1);
}

#endif
