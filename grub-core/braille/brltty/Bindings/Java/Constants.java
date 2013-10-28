package org.a11y.BrlAPI;

public interface Constants {
  int TTY_DEFAULT = -1;
  /**  */
  int DISPLAY_DEFAULT = -1;
  /**  */
  int CURSOR_LEAVE = -1;
  /**  */
  int CURSOR_OFF = 0;
  int rangeType_all = 0;
  int rangeType_type = 1;
  int rangeType_command = 2;
  int rangeType_key = 3;
  int rangeType_code = 4;
  /**  */
  int ERROR_SUCCESS = 0;
  /**  */
  int ERROR_NOMEM = 1;
  /**  */
  int ERROR_TTYBUSY = 2;
  /**  */
  int ERROR_DEVICEBUSY = 3;
  /**  */
  int ERROR_UNKNOWN_INSTRUCTION = 4;
  /**  */
  int ERROR_ILLEGAL_INSTRUCTION = 5;
  /**  */
  int ERROR_INVALID_PARAMETER = 6;
  /**  */
  int ERROR_INVALID_PACKET = 7;
  /**  */
  int ERROR_CONNREFUSED = 8;
  /**  */
  int ERROR_OPNOTSUPP = 9;
  /**  */
  int ERROR_GAIERR = 10;
  /**  */
  int ERROR_LIBCERR = 11;
  /**  */
  int ERROR_UNKNOWNTTY = 12;
  /**  */
  int ERROR_PROTOCOL_VERSION = 13;
  /**  */
  int ERROR_EOF = 14;
  /**  */
  int ERROR_EMPTYKEY = 15;
  /**  */
  int ERROR_DRIVERERROR = 16;
  /**  */
  int ERROR_AUTHENTICATION = 17;
  /**  */
  long KEY_MAX = 0xffffffffffffffffL;
  /**  */
  long KEY_FLAGS_MASK = 0xffffffff00000000L;
  /**  */
  int KEY_FLAGS_SHIFT = 32;
  /**  */
  long KEY_TYPE_MASK = 0xe0000000L;
  /**  */
  int KEY_TYPE_SHIFT = 29;
  /**  */
  int KEY_TYPE_CMD = 0x20000000;
  /**  */
  int KEY_TYPE_SYM = 0x0;
  /**  */
  long KEY_CODE_MASK = 0x1fffffffL;
  /**  */
  int KEY_CODE_SHIFT = 0;
  /**  */
  long KEY_CMD_BLK_MASK = 0x1fff0000L;
  /**  */
  int KEY_CMD_BLK_SHIFT = 16;
  /**  */
  long KEY_CMD_ARG_MASK = 0xffffL;
  /**  */
  int KEY_CMD_ARG_SHIFT = 0;
  /**  */
  int KEY_SYM_BACKSPACE = 0xff08;
  /**  */
  int KEY_SYM_TAB = 0xff09;
  /**  */
  int KEY_SYM_LINEFEED = 0xff0d;
  /**  */
  int KEY_SYM_ESCAPE = 0xff1b;
  /**  */
  int KEY_SYM_HOME = 0xff50;
  /**  */
  int KEY_SYM_LEFT = 0xff51;
  /**  */
  int KEY_SYM_UP = 0xff52;
  /**  */
  int KEY_SYM_RIGHT = 0xff53;
  /**  */
  int KEY_SYM_DOWN = 0xff54;
  /**  */
  int KEY_SYM_PAGE_UP = 0xff55;
  /**  */
  int KEY_SYM_PAGE_DOWN = 0xff56;
  /**  */
  int KEY_SYM_END = 0xff57;
  /**  */
  int KEY_SYM_INSERT = 0xff63;
  /**  */
  int KEY_SYM_F1 = (0xffbe + 0);
  /**  */
  int KEY_SYM_F2 = (0xffbe + 1);
  /**  */
  int KEY_SYM_F3 = (0xffbe + 2);
  /**  */
  int KEY_SYM_F4 = (0xffbe + 3);
  /**  */
  int KEY_SYM_F5 = (0xffbe + 4);
  /**  */
  int KEY_SYM_F6 = (0xffbe + 5);
  /**  */
  int KEY_SYM_F7 = (0xffbe + 6);
  /**  */
  int KEY_SYM_F8 = (0xffbe + 7);
  /**  */
  int KEY_SYM_F9 = (0xffbe + 8);
  /**  */
  int KEY_SYM_F10 = (0xffbe + 9);
  /**  */
  int KEY_SYM_F11 = (0xffbe + 10);
  /**  */
  int KEY_SYM_F12 = (0xffbe + 11);
  /**  */
  int KEY_SYM_F13 = (0xffbe + 12);
  /**  */
  int KEY_SYM_F14 = (0xffbe + 13);
  /**  */
  int KEY_SYM_F15 = (0xffbe + 14);
  /**  */
  int KEY_SYM_F16 = (0xffbe + 15);
  /**  */
  int KEY_SYM_F17 = (0xffbe + 16);
  /**  */
  int KEY_SYM_F18 = (0xffbe + 17);
  /**  */
  int KEY_SYM_F19 = (0xffbe + 18);
  /**  */
  int KEY_SYM_F20 = (0xffbe + 19);
  /**  */
  int KEY_SYM_F21 = (0xffbe + 20);
  /**  */
  int KEY_SYM_F22 = (0xffbe + 21);
  /**  */
  int KEY_SYM_F23 = (0xffbe + 22);
  /**  */
  int KEY_SYM_F24 = (0xffbe + 23);
  /**  */
  int KEY_SYM_F25 = (0xffbe + 24);
  /**  */
  int KEY_SYM_F26 = (0xffbe + 25);
  /**  */
  int KEY_SYM_F27 = (0xffbe + 26);
  /**  */
  int KEY_SYM_F28 = (0xffbe + 27);
  /**  */
  int KEY_SYM_F29 = (0xffbe + 28);
  /**  */
  int KEY_SYM_F30 = (0xffbe + 29);
  /**  */
  int KEY_SYM_F31 = (0xffbe + 30);
  /**  */
  int KEY_SYM_F32 = (0xffbe + 31);
  /**  */
  int KEY_SYM_F33 = (0xffbe + 32);
  /**  */
  int KEY_SYM_F34 = (0xffbe + 33);
  /**  */
  int KEY_SYM_F35 = (0xffbe + 34);
  /**  */
  int KEY_SYM_DELETE = 0xffff;
  /**  */
  int KEY_SYM_UNICODE = 0x1000000;
  /** do nothing */
  int KEY_CMD_NOOP = 0;
  /** go up one line */
  int KEY_CMD_LNUP = 1;
  /** go down one line */
  int KEY_CMD_LNDN = 2;
  /** go up several lines */
  int KEY_CMD_WINUP = 3;
  /** go down several lines */
  int KEY_CMD_WINDN = 4;
  /** go up to nearest line with different content */
  int KEY_CMD_PRDIFLN = 5;
  /** go down to nearest line with different content */
  int KEY_CMD_NXDIFLN = 6;
  /** go up to nearest line with different highlighting */
  int KEY_CMD_ATTRUP = 7;
  /** go down to nearest line with different highlighting */
  int KEY_CMD_ATTRDN = 8;
  /** go to top line */
  int KEY_CMD_TOP = 9;
  /** go to bottom line */
  int KEY_CMD_BOT = 10;
  /** go to beginning of top line */
  int KEY_CMD_TOP_LEFT = 11;
  /** go to beginning of bottom line */
  int KEY_CMD_BOT_LEFT = 12;
  /** go up to last line of previous paragraph */
  int KEY_CMD_PRPGRPH = 13;
  /** go down to first line of next paragraph */
  int KEY_CMD_NXPGRPH = 14;
  /** go up to previous command prompt */
  int KEY_CMD_PRPROMPT = 15;
  /** go down to next command prompt */
  int KEY_CMD_NXPROMPT = 16;
  /** search backward for cut text */
  int KEY_CMD_PRSEARCH = 17;
  /** search forward for cut text */
  int KEY_CMD_NXSEARCH = 18;
  /** go left one character */
  int KEY_CMD_CHRLT = 19;
  /** go right one character */
  int KEY_CMD_CHRRT = 20;
  /** go left half a window */
  int KEY_CMD_HWINLT = 21;
  /** go right half a window */
  int KEY_CMD_HWINRT = 22;
  /** go left one window */
  int KEY_CMD_FWINLT = 23;
  /** go right one window */
  int KEY_CMD_FWINRT = 24;
  /** go left to nearest non-blank window */
  int KEY_CMD_FWINLTSKIP = 25;
  /** go right to nearest non-blank window */
  int KEY_CMD_FWINRTSKIP = 26;
  /** go to beginning of line */
  int KEY_CMD_LNBEG = 27;
  /** go to end of line */
  int KEY_CMD_LNEND = 28;
  /** go to cursor */
  int KEY_CMD_HOME = 29;
  /** go back after cursor tracking */
  int KEY_CMD_BACK = 30;
  /** go to cursor or go back after cursor tracking */
  int KEY_CMD_RETURN = 31;
  /** freeze/unfreeze screen image */
  int KEY_CMD_FREEZE = 32;
  /** toggle display mode attributes/text */
  int KEY_CMD_DISPMD = 33;
  /** toggle text style 6-dot/8-dot */
  int KEY_CMD_SIXDOTS = 34;
  /** toggle sliding window on/off */
  int KEY_CMD_SLIDEWIN = 35;
  /** toggle skipping of lines with identical content on/off */
  int KEY_CMD_SKPIDLNS = 36;
  /** toggle skipping of blank windows on/off */
  int KEY_CMD_SKPBLNKWINS = 37;
  /** toggle cursor visibility on/off */
  int KEY_CMD_CSRVIS = 38;
  /** toggle hidden cursor on/off */
  int KEY_CMD_CSRHIDE = 39;
  /** toggle cursor tracking on/off */
  int KEY_CMD_CSRTRK = 40;
  /** toggle cursor style block/underline */
  int KEY_CMD_CSRSIZE = 41;
  /** toggle cursor blinking on/off */
  int KEY_CMD_CSRBLINK = 42;
  /** toggle attribute underlining on/off */
  int KEY_CMD_ATTRVIS = 43;
  /** toggle attribute blinking on/off */
  int KEY_CMD_ATTRBLINK = 44;
  /** toggle capital letter blinking on/off */
  int KEY_CMD_CAPBLINK = 45;
  /** toggle alert tunes on/off */
  int KEY_CMD_TUNES = 46;
  /** toggle autorepeat on/off */
  int KEY_CMD_AUTOREPEAT = 47;
  /** toggle autospeak on/off */
  int KEY_CMD_AUTOSPEAK = 48;
  /** enter/leave help display */
  int KEY_CMD_HELP = 49;
  /** enter/leave status display */
  int KEY_CMD_INFO = 50;
  /** enter/leave command learn mode */
  int KEY_CMD_LEARN = 51;
  /** enter/leave preferences menu */
  int KEY_CMD_PREFMENU = 52;
  /** save preferences to disk */
  int KEY_CMD_PREFSAVE = 53;
  /** restore preferences from disk */
  int KEY_CMD_PREFLOAD = 54;
  /** go to first item */
  int KEY_CMD_MENU_FIRST_ITEM = 55;
  /** go to last item */
  int KEY_CMD_MENU_LAST_ITEM = 56;
  /** go to previous item */
  int KEY_CMD_MENU_PREV_ITEM = 57;
  /** go to next item */
  int KEY_CMD_MENU_NEXT_ITEM = 58;
  /** select previous choice */
  int KEY_CMD_MENU_PREV_SETTING = 59;
  /** select next choice */
  int KEY_CMD_MENU_NEXT_SETTING = 60;
  /** stop speaking */
  int KEY_CMD_MUTE = 61;
  /** go to current speech position */
  int KEY_CMD_SPKHOME = 62;
  /** speak current line */
  int KEY_CMD_SAY_LINE = 63;
  /** speak from top of screen through current line */
  int KEY_CMD_SAY_ABOVE = 64;
  /** speak from current line through bottom of screen */
  int KEY_CMD_SAY_BELOW = 65;
  /** decrease speech rate */
  int KEY_CMD_SAY_SLOWER = 66;
  /** increase speech rate */
  int KEY_CMD_SAY_FASTER = 67;
  /** decrease speech volume */
  int KEY_CMD_SAY_SOFTER = 68;
  /** increase speech volume */
  int KEY_CMD_SAY_LOUDER = 69;
  /** switch to previous virtual terminal */
  int KEY_CMD_SWITCHVT_PREV = 70;
  /** switch to next virtual terminal */
  int KEY_CMD_SWITCHVT_NEXT = 71;
  /** bring cursor to line */
  int KEY_CMD_CSRJMP_VERT = 72;
  /** insert cut text at cursor */
  int KEY_CMD_PASTE = 73;
  /** restart braille driver */
  int KEY_CMD_RESTARTBRL = 74;
  /** restart speech driver */
  int KEY_CMD_RESTARTSPEECH = 75;
  /** braille display temporarily unavailable */
  int KEY_CMD_OFFLINE = 76;
  /** enable feature */
  int KEY_FLG_TOGGLE_ON = 0x100;
  /** disable feature */
  int KEY_FLG_TOGGLE_OFF = 0x200;
  /** mask for all toggle flags */
  int KEY_FLG_TOGGLE_MASK = (KEY_FLG_TOGGLE_ON | KEY_FLG_TOGGLE_OFF);
  /** bring cursor into window after function */
  int KEY_FLG_MOTION_ROUTE = 0x400;
  /** execute command on key press */
  int KEY_FLG_REPEAT_INITIAL = 0x8000;
  /** wait before repeating */
  int KEY_FLG_REPEAT_DELAY = 0x4000;
  /** mask for all repeat flags */
  int KEY_FLG_REPEAT_MASK = (KEY_FLG_REPEAT_INITIAL | KEY_FLG_REPEAT_DELAY);
  /** bring cursor to character */
  int KEY_CMD_ROUTE = 0x10000;
  /** start new cut buffer at character */
  int KEY_CMD_CUTBEGIN = 0x20000;
  /** append to existing cut buffer from character */
  int KEY_CMD_CUTAPPEND = 0x30000;
  /** rectangular cut to character */
  int KEY_CMD_CUTRECT = 0x40000;
  /** linear cut to character */
  int KEY_CMD_CUTLINE = 0x50000;
  /** switch to virtual terminal */
  int KEY_CMD_SWITCHVT = 0x60000;
  /** go up to nearest line with less indent than character */
  int KEY_CMD_PRINDENT = 0x70000;
  /** go down to nearest line with less indent than character */
  int KEY_CMD_NXINDENT = 0x80000;
  /** describe character */
  int KEY_CMD_DESCCHAR = 0x90000;
  /** place left end of window at character */
  int KEY_CMD_SETLEFT = 0xa0000;
  /** remember current window position */
  int KEY_CMD_SETMARK = 0xb0000;
  /** go to remembered window position */
  int KEY_CMD_GOTOMARK = 0xc0000;
  /** go to selected line */
  int KEY_CMD_GOTOLINE = 0xd0000;
  /** scale arg=0X00-0XFF to screen height */
  int KEY_FLG_LINE_SCALED = 0x100;
  /** go to beginning of line */
  int KEY_FLG_LINE_TOLEFT = 0x200;
  /** go up to nearest line with different character */
  int KEY_CMD_PRDIFCHAR = 0xe0000;
  /** go down to nearest line with different character */
  int KEY_CMD_NXDIFCHAR = 0xf0000;
  /** copy characters to cut buffer */
  int KEY_CMD_COPYCHARS = 0x100000;
  /** append characters to cut buffer */
  int KEY_CMD_APNDCHARS = 0x110000;
  /** input braille character */
  int KEY_CMD_PASSDOTS = 0x220000;
  /** shift key pressed */
  int KEY_FLG_SHIFT = 0x1;
  /** convert to uppercase */
  int KEY_FLG_UPPER = 0x2;
  /** control key pressed */
  int KEY_FLG_CONTROL = 0x4;
  /** meta key pressed */
  int KEY_FLG_META = 0x8;
  /** upper-left dot of standard braille cell */
  byte DOT1 = (byte) (0001);
  /** middle-left dot of standard braille cell */
  byte DOT2 = (byte) (0002);
  /** lower-left dot of standard braille cell */
  byte DOT3 = (byte) (0004);
  /** upper-right dot of standard braille cell */
  byte DOT4 = (byte) (0010);
  /** middle-right dot of standard braille cell */
  byte DOT5 = (byte) (0020);
  /** lower-right dot of standard braille cell */
  byte DOT6 = (byte) (0040);
  /** lower-left dot of computer braille cell */
  byte DOT7 = (byte) (0100);
  /** lower-right dot of computer braille cell */
  byte DOT8 = (byte) (0200);
  /** space key pressed */
  byte DOTC = (byte) (0400);
  /** input AT (set 2) keyboard scan code */
  int KEY_CMD_PASSAT = 0x230000;
  /** input XT (set 1) keyboard scan code */
  int KEY_CMD_PASSXT = 0x240000;
  /** input PS/2 (set 3) keyboard scan code */
  int KEY_CMD_PASSPS2 = 0x250000;
  /** it is a release scan code */
  int KEY_FLG_KBD_RELEASE = 0x100;
  /** it is an emulation 0 scan code */
  int KEY_FLG_KBD_EMUL0 = 0x200;
  /** it is an emulation 1 scan code */
  int KEY_FLG_KBD_EMUL1 = 0x400;
  /** switch to command context */
  int KEY_CMD_CONTEXT = 0x260000;
}
