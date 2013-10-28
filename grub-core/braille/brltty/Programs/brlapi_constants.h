/*
 * libbrlapi - A library providing access to braille terminals for applications.
 *
 * Copyright (C) 2002-2010 by
 *   Samuel Thibault <Samuel.Thibault@ens-lyon.org>
 *   Sébastien Hinderer <Sebastien.Hinderer@ens-lyon.org>
 *
 * libbrlapi comes with ABSOLUTELY NO WARRANTY.
 *
 * This is free software, placed under the terms of the
 * GNU Lesser General Public License, as published by the Free Software
 * Foundation; either version 2.1 of the License, or (at your option) any
 * later version. Please see the file LICENSE-LGPL for details.
 *
 * Web Page: http://mielke.cc/brltty/
 *
 * This software is maintained by Dave Mielke <dave@mielke.cc>.
 */

#ifndef BRLAPI_INCLUDED_CONSTANTS
#define BRLAPI_INCLUDED_CONSTANTS

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/** \file
 */

/** \ingroup brlapi_keycodes
 * @{ */

/** do nothing */
#define BRLAPI_KEY_CMD_NOOP (BRLAPI_KEY_CMD(0) + 0)
/** go up one line */
#define BRLAPI_KEY_CMD_LNUP (BRLAPI_KEY_CMD(0) + 1)
/** go down one line */
#define BRLAPI_KEY_CMD_LNDN (BRLAPI_KEY_CMD(0) + 2)
/** go up several lines */
#define BRLAPI_KEY_CMD_WINUP (BRLAPI_KEY_CMD(0) + 3)
/** go down several lines */
#define BRLAPI_KEY_CMD_WINDN (BRLAPI_KEY_CMD(0) + 4)
/** go up to nearest line with different content */
#define BRLAPI_KEY_CMD_PRDIFLN (BRLAPI_KEY_CMD(0) + 5)
/** go down to nearest line with different content */
#define BRLAPI_KEY_CMD_NXDIFLN (BRLAPI_KEY_CMD(0) + 6)
/** go up to nearest line with different highlighting */
#define BRLAPI_KEY_CMD_ATTRUP (BRLAPI_KEY_CMD(0) + 7)
/** go down to nearest line with different highlighting */
#define BRLAPI_KEY_CMD_ATTRDN (BRLAPI_KEY_CMD(0) + 8)
/** go to top line */
#define BRLAPI_KEY_CMD_TOP (BRLAPI_KEY_CMD(0) + 9)
/** go to bottom line */
#define BRLAPI_KEY_CMD_BOT (BRLAPI_KEY_CMD(0) + 10)
/** go to beginning of top line */
#define BRLAPI_KEY_CMD_TOP_LEFT (BRLAPI_KEY_CMD(0) + 11)
/** go to beginning of bottom line */
#define BRLAPI_KEY_CMD_BOT_LEFT (BRLAPI_KEY_CMD(0) + 12)
/** go up to last line of previous paragraph */
#define BRLAPI_KEY_CMD_PRPGRPH (BRLAPI_KEY_CMD(0) + 13)
/** go down to first line of next paragraph */
#define BRLAPI_KEY_CMD_NXPGRPH (BRLAPI_KEY_CMD(0) + 14)
/** go up to previous command prompt */
#define BRLAPI_KEY_CMD_PRPROMPT (BRLAPI_KEY_CMD(0) + 15)
/** go down to next command prompt */
#define BRLAPI_KEY_CMD_NXPROMPT (BRLAPI_KEY_CMD(0) + 16)
/** search backward for cut text */
#define BRLAPI_KEY_CMD_PRSEARCH (BRLAPI_KEY_CMD(0) + 17)
/** search forward for cut text */
#define BRLAPI_KEY_CMD_NXSEARCH (BRLAPI_KEY_CMD(0) + 18)
/** go left one character */
#define BRLAPI_KEY_CMD_CHRLT (BRLAPI_KEY_CMD(0) + 19)
/** go right one character */
#define BRLAPI_KEY_CMD_CHRRT (BRLAPI_KEY_CMD(0) + 20)
/** go left half a window */
#define BRLAPI_KEY_CMD_HWINLT (BRLAPI_KEY_CMD(0) + 21)
/** go right half a window */
#define BRLAPI_KEY_CMD_HWINRT (BRLAPI_KEY_CMD(0) + 22)
/** go left one window */
#define BRLAPI_KEY_CMD_FWINLT (BRLAPI_KEY_CMD(0) + 23)
/** go right one window */
#define BRLAPI_KEY_CMD_FWINRT (BRLAPI_KEY_CMD(0) + 24)
/** go left to nearest non-blank window */
#define BRLAPI_KEY_CMD_FWINLTSKIP (BRLAPI_KEY_CMD(0) + 25)
/** go right to nearest non-blank window */
#define BRLAPI_KEY_CMD_FWINRTSKIP (BRLAPI_KEY_CMD(0) + 26)
/** go to beginning of line */
#define BRLAPI_KEY_CMD_LNBEG (BRLAPI_KEY_CMD(0) + 27)
/** go to end of line */
#define BRLAPI_KEY_CMD_LNEND (BRLAPI_KEY_CMD(0) + 28)
/** go to cursor */
#define BRLAPI_KEY_CMD_HOME (BRLAPI_KEY_CMD(0) + 29)
/** go back after cursor tracking */
#define BRLAPI_KEY_CMD_BACK (BRLAPI_KEY_CMD(0) + 30)
/** go to cursor or go back after cursor tracking */
#define BRLAPI_KEY_CMD_RETURN (BRLAPI_KEY_CMD(0) + 31)
/** freeze/unfreeze screen image */
#define BRLAPI_KEY_CMD_FREEZE (BRLAPI_KEY_CMD(0) + 32)
/** toggle display mode attributes/text */
#define BRLAPI_KEY_CMD_DISPMD (BRLAPI_KEY_CMD(0) + 33)
/** toggle text style 6-dot/8-dot */
#define BRLAPI_KEY_CMD_SIXDOTS (BRLAPI_KEY_CMD(0) + 34)
/** toggle sliding window on/off */
#define BRLAPI_KEY_CMD_SLIDEWIN (BRLAPI_KEY_CMD(0) + 35)
/** toggle skipping of lines with identical content on/off */
#define BRLAPI_KEY_CMD_SKPIDLNS (BRLAPI_KEY_CMD(0) + 36)
/** toggle skipping of blank windows on/off */
#define BRLAPI_KEY_CMD_SKPBLNKWINS (BRLAPI_KEY_CMD(0) + 37)
/** toggle cursor visibility on/off */
#define BRLAPI_KEY_CMD_CSRVIS (BRLAPI_KEY_CMD(0) + 38)
/** toggle hidden cursor on/off */
#define BRLAPI_KEY_CMD_CSRHIDE (BRLAPI_KEY_CMD(0) + 39)
/** toggle cursor tracking on/off */
#define BRLAPI_KEY_CMD_CSRTRK (BRLAPI_KEY_CMD(0) + 40)
/** toggle cursor style block/underline */
#define BRLAPI_KEY_CMD_CSRSIZE (BRLAPI_KEY_CMD(0) + 41)
/** toggle cursor blinking on/off */
#define BRLAPI_KEY_CMD_CSRBLINK (BRLAPI_KEY_CMD(0) + 42)
/** toggle attribute underlining on/off */
#define BRLAPI_KEY_CMD_ATTRVIS (BRLAPI_KEY_CMD(0) + 43)
/** toggle attribute blinking on/off */
#define BRLAPI_KEY_CMD_ATTRBLINK (BRLAPI_KEY_CMD(0) + 44)
/** toggle capital letter blinking on/off */
#define BRLAPI_KEY_CMD_CAPBLINK (BRLAPI_KEY_CMD(0) + 45)
/** toggle alert tunes on/off */
#define BRLAPI_KEY_CMD_TUNES (BRLAPI_KEY_CMD(0) + 46)
/** toggle autorepeat on/off */
#define BRLAPI_KEY_CMD_AUTOREPEAT (BRLAPI_KEY_CMD(0) + 47)
/** toggle autospeak on/off */
#define BRLAPI_KEY_CMD_AUTOSPEAK (BRLAPI_KEY_CMD(0) + 48)
/** enter/leave help display */
#define BRLAPI_KEY_CMD_HELP (BRLAPI_KEY_CMD(0) + 49)
/** enter/leave status display */
#define BRLAPI_KEY_CMD_INFO (BRLAPI_KEY_CMD(0) + 50)
/** enter/leave command learn mode */
#define BRLAPI_KEY_CMD_LEARN (BRLAPI_KEY_CMD(0) + 51)
/** enter/leave preferences menu */
#define BRLAPI_KEY_CMD_PREFMENU (BRLAPI_KEY_CMD(0) + 52)
/** save preferences to disk */
#define BRLAPI_KEY_CMD_PREFSAVE (BRLAPI_KEY_CMD(0) + 53)
/** restore preferences from disk */
#define BRLAPI_KEY_CMD_PREFLOAD (BRLAPI_KEY_CMD(0) + 54)
/** go to first item */
#define BRLAPI_KEY_CMD_MENU_FIRST_ITEM (BRLAPI_KEY_CMD(0) + 55)
/** go to last item */
#define BRLAPI_KEY_CMD_MENU_LAST_ITEM (BRLAPI_KEY_CMD(0) + 56)
/** go to previous item */
#define BRLAPI_KEY_CMD_MENU_PREV_ITEM (BRLAPI_KEY_CMD(0) + 57)
/** go to next item */
#define BRLAPI_KEY_CMD_MENU_NEXT_ITEM (BRLAPI_KEY_CMD(0) + 58)
/** select previous choice */
#define BRLAPI_KEY_CMD_MENU_PREV_SETTING (BRLAPI_KEY_CMD(0) + 59)
/** select next choice */
#define BRLAPI_KEY_CMD_MENU_NEXT_SETTING (BRLAPI_KEY_CMD(0) + 60)
/** stop speaking */
#define BRLAPI_KEY_CMD_MUTE (BRLAPI_KEY_CMD(0) + 61)
/** go to current speech position */
#define BRLAPI_KEY_CMD_SPKHOME (BRLAPI_KEY_CMD(0) + 62)
/** speak current line */
#define BRLAPI_KEY_CMD_SAY_LINE (BRLAPI_KEY_CMD(0) + 63)
/** speak from top of screen through current line */
#define BRLAPI_KEY_CMD_SAY_ABOVE (BRLAPI_KEY_CMD(0) + 64)
/** speak from current line through bottom of screen */
#define BRLAPI_KEY_CMD_SAY_BELOW (BRLAPI_KEY_CMD(0) + 65)
/** decrease speech rate */
#define BRLAPI_KEY_CMD_SAY_SLOWER (BRLAPI_KEY_CMD(0) + 66)
/** increase speech rate */
#define BRLAPI_KEY_CMD_SAY_FASTER (BRLAPI_KEY_CMD(0) + 67)
/** decrease speech volume */
#define BRLAPI_KEY_CMD_SAY_SOFTER (BRLAPI_KEY_CMD(0) + 68)
/** increase speech volume */
#define BRLAPI_KEY_CMD_SAY_LOUDER (BRLAPI_KEY_CMD(0) + 69)
/** switch to previous virtual terminal */
#define BRLAPI_KEY_CMD_SWITCHVT_PREV (BRLAPI_KEY_CMD(0) + 70)
/** switch to next virtual terminal */
#define BRLAPI_KEY_CMD_SWITCHVT_NEXT (BRLAPI_KEY_CMD(0) + 71)
/** bring cursor to line */
#define BRLAPI_KEY_CMD_CSRJMP_VERT (BRLAPI_KEY_CMD(0) + 72)
/** insert cut text at cursor */
#define BRLAPI_KEY_CMD_PASTE (BRLAPI_KEY_CMD(0) + 73)
/** restart braille driver */
#define BRLAPI_KEY_CMD_RESTARTBRL (BRLAPI_KEY_CMD(0) + 74)
/** restart speech driver */
#define BRLAPI_KEY_CMD_RESTARTSPEECH (BRLAPI_KEY_CMD(0) + 75)
/** braille display temporarily unavailable */
#define BRLAPI_KEY_CMD_OFFLINE (BRLAPI_KEY_CMD(0) + 76)
/** enable feature */
#define BRLAPI_KEY_FLG_TOGGLE_ON BRLAPI_KEY_FLG(0X0100)
/** disable feature */
#define BRLAPI_KEY_FLG_TOGGLE_OFF BRLAPI_KEY_FLG(0X0200)
/** mask for all toggle flags */
#define BRLAPI_KEY_FLG_TOGGLE_MASK (BRLAPI_KEY_FLG_TOGGLE_ON | BRLAPI_KEY_FLG_TOGGLE_OFF)
/** bring cursor into window after function */
#define BRLAPI_KEY_FLG_MOTION_ROUTE BRLAPI_KEY_FLG(0X0400)
/** execute command on key press */
#define BRLAPI_KEY_FLG_REPEAT_INITIAL BRLAPI_KEY_FLG(0X8000)
/** wait before repeating */
#define BRLAPI_KEY_FLG_REPEAT_DELAY BRLAPI_KEY_FLG(0X4000)
/** mask for all repeat flags */
#define BRLAPI_KEY_FLG_REPEAT_MASK (BRLAPI_KEY_FLG_REPEAT_INITIAL | BRLAPI_KEY_FLG_REPEAT_DELAY)
/** bring cursor to character */
#define BRLAPI_KEY_CMD_ROUTE BRLAPI_KEY_CMD(0X01)
/** start new cut buffer at character */
#define BRLAPI_KEY_CMD_CUTBEGIN BRLAPI_KEY_CMD(0X02)
/** append to existing cut buffer from character */
#define BRLAPI_KEY_CMD_CUTAPPEND BRLAPI_KEY_CMD(0X03)
/** rectangular cut to character */
#define BRLAPI_KEY_CMD_CUTRECT BRLAPI_KEY_CMD(0X04)
/** linear cut to character */
#define BRLAPI_KEY_CMD_CUTLINE BRLAPI_KEY_CMD(0X05)
/** switch to virtual terminal */
#define BRLAPI_KEY_CMD_SWITCHVT BRLAPI_KEY_CMD(0X06)
/** go up to nearest line with less indent than character */
#define BRLAPI_KEY_CMD_PRINDENT BRLAPI_KEY_CMD(0X07)
/** go down to nearest line with less indent than character */
#define BRLAPI_KEY_CMD_NXINDENT BRLAPI_KEY_CMD(0X08)
/** describe character */
#define BRLAPI_KEY_CMD_DESCCHAR BRLAPI_KEY_CMD(0X09)
/** place left end of window at character */
#define BRLAPI_KEY_CMD_SETLEFT BRLAPI_KEY_CMD(0X0A)
/** remember current window position */
#define BRLAPI_KEY_CMD_SETMARK BRLAPI_KEY_CMD(0X0B)
/** go to remembered window position */
#define BRLAPI_KEY_CMD_GOTOMARK BRLAPI_KEY_CMD(0X0C)
/** go to selected line */
#define BRLAPI_KEY_CMD_GOTOLINE BRLAPI_KEY_CMD(0X0D)
/** scale arg=0X00-0XFF to screen height */
#define BRLAPI_KEY_FLG_LINE_SCALED BRLAPI_KEY_FLG(0X0100)
/** go to beginning of line */
#define BRLAPI_KEY_FLG_LINE_TOLEFT BRLAPI_KEY_FLG(0X0200)
/** go up to nearest line with different character */
#define BRLAPI_KEY_CMD_PRDIFCHAR BRLAPI_KEY_CMD(0X0E)
/** go down to nearest line with different character */
#define BRLAPI_KEY_CMD_NXDIFCHAR BRLAPI_KEY_CMD(0X0F)
/** copy characters to cut buffer */
#define BRLAPI_KEY_CMD_COPYCHARS BRLAPI_KEY_CMD(0X10)
/** append characters to cut buffer */
#define BRLAPI_KEY_CMD_APNDCHARS BRLAPI_KEY_CMD(0X11)
/** input braille character */
#define BRLAPI_KEY_CMD_PASSDOTS BRLAPI_KEY_CMD(0X22)
/** shift key pressed */
#define BRLAPI_KEY_FLG_SHIFT BRLAPI_KEY_FLG(0X01)
/** convert to uppercase */
#define BRLAPI_KEY_FLG_UPPER BRLAPI_KEY_FLG(0X02)
/** control key pressed */
#define BRLAPI_KEY_FLG_CONTROL BRLAPI_KEY_FLG(0X04)
/** meta key pressed */
#define BRLAPI_KEY_FLG_META BRLAPI_KEY_FLG(0X08)
/** upper-left dot of standard braille cell */
#define BRLAPI_DOT1 0001
/** middle-left dot of standard braille cell */
#define BRLAPI_DOT2 0002
/** lower-left dot of standard braille cell */
#define BRLAPI_DOT3 0004
/** upper-right dot of standard braille cell */
#define BRLAPI_DOT4 0010
/** middle-right dot of standard braille cell */
#define BRLAPI_DOT5 0020
/** lower-right dot of standard braille cell */
#define BRLAPI_DOT6 0040
/** lower-left dot of computer braille cell */
#define BRLAPI_DOT7 0100
/** lower-right dot of computer braille cell */
#define BRLAPI_DOT8 0200
/** space key pressed */
#define BRLAPI_DOTC 0400
/** input AT (set 2) keyboard scan code */
#define BRLAPI_KEY_CMD_PASSAT BRLAPI_KEY_CMD(0X23)
/** input XT (set 1) keyboard scan code */
#define BRLAPI_KEY_CMD_PASSXT BRLAPI_KEY_CMD(0X24)
/** input PS/2 (set 3) keyboard scan code */
#define BRLAPI_KEY_CMD_PASSPS2 BRLAPI_KEY_CMD(0X25)
/** it is a release scan code */
#define BRLAPI_KEY_FLG_KBD_RELEASE BRLAPI_KEY_FLG(0X0100)
/** it is an emulation 0 scan code */
#define BRLAPI_KEY_FLG_KBD_EMUL0 BRLAPI_KEY_FLG(0X0200)
/** it is an emulation 1 scan code */
#define BRLAPI_KEY_FLG_KBD_EMUL1 BRLAPI_KEY_FLG(0X0400)
/** switch to command context */
#define BRLAPI_KEY_CMD_CONTEXT BRLAPI_KEY_CMD(0X26)

/** Helper macro to easily produce braille patterns */
#define BRLAPI_DOTS(dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8) (\
  ((dot1)? BRLAPI_DOT1: 0) | \
  ((dot2)? BRLAPI_DOT2: 0) | \
  ((dot3)? BRLAPI_DOT3: 0) | \
  ((dot4)? BRLAPI_DOT4: 0) | \
  ((dot5)? BRLAPI_DOT5: 0) | \
  ((dot6)? BRLAPI_DOT6: 0) | \
  ((dot7)? BRLAPI_DOT7: 0) | \
  ((dot8)? BRLAPI_DOT8: 0) \
)

/** space key */
#define BRLAPI_DOT_CHORD 256
/** @} */


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* BRLAPI_INCLUDED_CONSTANTS */
