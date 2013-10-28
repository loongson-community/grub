{
  .name = "NOOP",
  .code = BRL_CMD_NOOP,
  .description = "do nothing"
}
,
{
  .name = "LNUP",
  .code = BRL_CMD_LNUP,
  .isMotion = 1,
  .description = "go up one line"
}
,
{
  .name = "LNDN",
  .code = BRL_CMD_LNDN,
  .isMotion = 1,
  .description = "go down one line"
}
,
{
  .name = "WINUP",
  .code = BRL_CMD_WINUP,
  .isMotion = 1,
  .description = "go up several lines"
}
,
{
  .name = "WINDN",
  .code = BRL_CMD_WINDN,
  .isMotion = 1,
  .description = "go down several lines"
}
,
{
  .name = "PRDIFLN",
  .code = BRL_CMD_PRDIFLN,
  .isMotion = 1,
  .description = "go up to nearest line with different content"
}
,
{
  .name = "NXDIFLN",
  .code = BRL_CMD_NXDIFLN,
  .isMotion = 1,
  .description = "go down to nearest line with different content"
}
,
{
  .name = "ATTRUP",
  .code = BRL_CMD_ATTRUP,
  .isMotion = 1,
  .description = "go up to nearest line with different highlighting"
}
,
{
  .name = "ATTRDN",
  .code = BRL_CMD_ATTRDN,
  .isMotion = 1,
  .description = "go down to nearest line with different highlighting"
}
,
{
  .name = "TOP",
  .code = BRL_CMD_TOP,
  .isMotion = 1,
  .description = "go to top line"
}
,
{
  .name = "BOT",
  .code = BRL_CMD_BOT,
  .isMotion = 1,
  .description = "go to bottom line"
}
,
{
  .name = "TOP_LEFT",
  .code = BRL_CMD_TOP_LEFT,
  .isMotion = 1,
  .description = "go to beginning of top line"
}
,
{
  .name = "BOT_LEFT",
  .code = BRL_CMD_BOT_LEFT,
  .isMotion = 1,
  .description = "go to beginning of bottom line"
}
,
{
  .name = "PRPGRPH",
  .code = BRL_CMD_PRPGRPH,
  .isMotion = 1,
  .description = "go up to last line of previous paragraph"
}
,
{
  .name = "NXPGRPH",
  .code = BRL_CMD_NXPGRPH,
  .isMotion = 1,
  .description = "go down to first line of next paragraph"
}
,
{
  .name = "PRPROMPT",
  .code = BRL_CMD_PRPROMPT,
  .isMotion = 1,
  .description = "go up to previous command prompt"
}
,
{
  .name = "NXPROMPT",
  .code = BRL_CMD_NXPROMPT,
  .isMotion = 1,
  .description = "go down to next command prompt"
}
,
{
  .name = "PRSEARCH",
  .code = BRL_CMD_PRSEARCH,
  .description = "search backward for cut text"
}
,
{
  .name = "NXSEARCH",
  .code = BRL_CMD_NXSEARCH,
  .description = "search forward for cut text"
}
,
{
  .name = "CHRLT",
  .code = BRL_CMD_CHRLT,
  .isMotion = 1,
  .description = "go left one character"
}
,
{
  .name = "CHRRT",
  .code = BRL_CMD_CHRRT,
  .isMotion = 1,
  .description = "go right one character"
}
,
{
  .name = "HWINLT",
  .code = BRL_CMD_HWINLT,
  .isMotion = 1,
  .description = "go left half a window"
}
,
{
  .name = "HWINRT",
  .code = BRL_CMD_HWINRT,
  .isMotion = 1,
  .description = "go right half a window"
}
,
{
  .name = "FWINLT",
  .code = BRL_CMD_FWINLT,
  .isMotion = 1,
  .description = "go left one window"
}
,
{
  .name = "FWINRT",
  .code = BRL_CMD_FWINRT,
  .isMotion = 1,
  .description = "go right one window"
}
,
{
  .name = "FWINLTSKIP",
  .code = BRL_CMD_FWINLTSKIP,
  .isMotion = 1,
  .description = "go left to nearest non-blank window"
}
,
{
  .name = "FWINRTSKIP",
  .code = BRL_CMD_FWINRTSKIP,
  .isMotion = 1,
  .description = "go right to nearest non-blank window"
}
,
{
  .name = "LNBEG",
  .code = BRL_CMD_LNBEG,
  .isMotion = 1,
  .description = "go to beginning of line"
}
,
{
  .name = "LNEND",
  .code = BRL_CMD_LNEND,
  .isMotion = 1,
  .description = "go to end of line"
}
,
{
  .name = "HOME",
  .code = BRL_CMD_HOME,
  .isMotion = 1,
  .description = "go to cursor"
}
,
{
  .name = "BACK",
  .code = BRL_CMD_BACK,
  .isMotion = 1,
  .description = "go back after cursor tracking"
}
,
{
  .name = "RETURN",
  .code = BRL_CMD_RETURN,
  .isMotion = 1,
  .description = "go to cursor or go back after cursor tracking"
}
,
{
  .name = "FREEZE",
  .code = BRL_CMD_FREEZE,
  .description = "freeze/unfreeze screen image"
}
,
{
  .name = "DISPMD",
  .code = BRL_CMD_DISPMD,
  .isToggle = 1,
  .description = "toggle display mode attributes/text"
}
,
{
  .name = "SIXDOTS",
  .code = BRL_CMD_SIXDOTS,
  .isToggle = 1,
  .description = "toggle text style 6-dot/8-dot"
}
,
{
  .name = "SLIDEWIN",
  .code = BRL_CMD_SLIDEWIN,
  .isToggle = 1,
  .description = "toggle sliding window on/off"
}
,
{
  .name = "SKPIDLNS",
  .code = BRL_CMD_SKPIDLNS,
  .isToggle = 1,
  .description = "toggle skipping of lines with identical content on/off"
}
,
{
  .name = "SKPBLNKWINS",
  .code = BRL_CMD_SKPBLNKWINS,
  .isToggle = 1,
  .description = "toggle skipping of blank windows on/off"
}
,
{
  .name = "CSRVIS",
  .code = BRL_CMD_CSRVIS,
  .isToggle = 1,
  .description = "toggle cursor visibility on/off"
}
,
{
  .name = "CSRHIDE",
  .code = BRL_CMD_CSRHIDE,
  .isToggle = 1,
  .description = "toggle hidden cursor on/off"
}
,
{
  .name = "CSRTRK",
  .code = BRL_CMD_CSRTRK,
  .isToggle = 1,
  .description = "toggle cursor tracking on/off"
}
,
{
  .name = "CSRSIZE",
  .code = BRL_CMD_CSRSIZE,
  .isToggle = 1,
  .description = "toggle cursor style block/underline"
}
,
{
  .name = "CSRBLINK",
  .code = BRL_CMD_CSRBLINK,
  .isToggle = 1,
  .description = "toggle cursor blinking on/off"
}
,
{
  .name = "ATTRVIS",
  .code = BRL_CMD_ATTRVIS,
  .isToggle = 1,
  .description = "toggle attribute underlining on/off"
}
,
{
  .name = "ATTRBLINK",
  .code = BRL_CMD_ATTRBLINK,
  .isToggle = 1,
  .description = "toggle attribute blinking on/off"
}
,
{
  .name = "CAPBLINK",
  .code = BRL_CMD_CAPBLINK,
  .isToggle = 1,
  .description = "toggle capital letter blinking on/off"
}
,
{
  .name = "TUNES",
  .code = BRL_CMD_TUNES,
  .isToggle = 1,
  .description = "toggle alert tunes on/off"
}
,
{
  .name = "AUTOREPEAT",
  .code = BRL_CMD_AUTOREPEAT,
  .isToggle = 1,
  .description = "toggle autorepeat on/off"
}
,
{
  .name = "AUTOSPEAK",
  .code = BRL_CMD_AUTOSPEAK,
  .isToggle = 1,
  .description = "toggle autospeak on/off"
}
,
{
  .name = "HELP",
  .code = BRL_CMD_HELP,
  .description = "enter/leave help display"
}
,
{
  .name = "INFO",
  .code = BRL_CMD_INFO,
  .description = "enter/leave status display"
}
,
{
  .name = "LEARN",
  .code = BRL_CMD_LEARN,
  .description = "enter/leave command learn mode"
}
,
{
  .name = "PREFMENU",
  .code = BRL_CMD_PREFMENU,
  .description = "enter/leave preferences menu"
}
,
{
  .name = "PREFSAVE",
  .code = BRL_CMD_PREFSAVE,
  .description = "save preferences to disk"
}
,
{
  .name = "PREFLOAD",
  .code = BRL_CMD_PREFLOAD,
  .description = "restore preferences from disk"
}
,
{
  .name = "MENU_FIRST_ITEM",
  .code = BRL_CMD_MENU_FIRST_ITEM,
  .isMotion = 1,
  .description = "go to first item"
}
,
{
  .name = "MENU_LAST_ITEM",
  .code = BRL_CMD_MENU_LAST_ITEM,
  .isMotion = 1,
  .description = "go to last item"
}
,
{
  .name = "MENU_PREV_ITEM",
  .code = BRL_CMD_MENU_PREV_ITEM,
  .isMotion = 1,
  .description = "go to previous item"
}
,
{
  .name = "MENU_NEXT_ITEM",
  .code = BRL_CMD_MENU_NEXT_ITEM,
  .isMotion = 1,
  .description = "go to next item"
}
,
{
  .name = "MENU_PREV_SETTING",
  .code = BRL_CMD_MENU_PREV_SETTING,
  .description = "select previous choice"
}
,
{
  .name = "MENU_NEXT_SETTING",
  .code = BRL_CMD_MENU_NEXT_SETTING,
  .description = "select next choice"
}
,
{
  .name = "MUTE",
  .code = BRL_CMD_MUTE,
  .description = "stop speaking"
}
,
{
  .name = "SPKHOME",
  .code = BRL_CMD_SPKHOME,
  .isMotion = 1,
  .description = "go to current speech position"
}
,
{
  .name = "SAY_LINE",
  .code = BRL_CMD_SAY_LINE,
  .description = "speak current line"
}
,
{
  .name = "SAY_ABOVE",
  .code = BRL_CMD_SAY_ABOVE,
  .description = "speak from top of screen through current line"
}
,
{
  .name = "SAY_BELOW",
  .code = BRL_CMD_SAY_BELOW,
  .description = "speak from current line through bottom of screen"
}
,
{
  .name = "SAY_SLOWER",
  .code = BRL_CMD_SAY_SLOWER,
  .description = "decrease speech rate"
}
,
{
  .name = "SAY_FASTER",
  .code = BRL_CMD_SAY_FASTER,
  .description = "increase speech rate"
}
,
{
  .name = "SAY_SOFTER",
  .code = BRL_CMD_SAY_SOFTER,
  .description = "decrease speech volume"
}
,
{
  .name = "SAY_LOUDER",
  .code = BRL_CMD_SAY_LOUDER,
  .description = "increase speech volume"
}
,
{
  .name = "SWITCHVT_PREV",
  .code = BRL_CMD_SWITCHVT_PREV,
  .description = "switch to previous virtual terminal"
}
,
{
  .name = "SWITCHVT_NEXT",
  .code = BRL_CMD_SWITCHVT_NEXT,
  .description = "switch to next virtual terminal"
}
,
{
  .name = "CSRJMP_VERT",
  .code = BRL_CMD_CSRJMP_VERT,
  .description = "bring cursor to line"
}
,
{
  .name = "PASTE",
  .code = BRL_CMD_PASTE,
  .description = "insert cut text at cursor"
}
,
{
  .name = "RESTARTBRL",
  .code = BRL_CMD_RESTARTBRL,
  .description = "restart braille driver"
}
,
{
  .name = "RESTARTSPEECH",
  .code = BRL_CMD_RESTARTSPEECH,
  .description = "restart speech driver"
}
,
{
  .name = "OFFLINE",
  .code = BRL_CMD_OFFLINE,
  .description = "braille display temporarily unavailable"
}
,
{
  .name = "ROUTE",
  .code = BRL_BLK_ROUTE,
  .isColumn = 1,
  .description = "bring cursor to character"
}
,
{
  .name = "SWITCHVT",
  .code = BRL_BLK_SWITCHVT,
  .isOffset = 1,
  .description = "switch to virtual terminal"
}
,
{
  .name = "PRINDENT",
  .code = BRL_BLK_PRINDENT,
  .isMotion = 1,
  .isColumn = 1,
  .description = "go up to nearest line with less indent than character"
}
,
{
  .name = "NXINDENT",
  .code = BRL_BLK_NXINDENT,
  .isMotion = 1,
  .isColumn = 1,
  .description = "go down to nearest line with less indent than character"
}
,
{
  .name = "DESCCHAR",
  .code = BRL_BLK_DESCCHAR,
  .isColumn = 1,
  .description = "describe character"
}
,
{
  .name = "SETLEFT",
  .code = BRL_BLK_SETLEFT,
  .isColumn = 1,
  .description = "place left end of window at character"
}
,
{
  .name = "SETMARK",
  .code = BRL_BLK_SETMARK,
  .isOffset = 1,
  .description = "remember current window position"
}
,
{
  .name = "GOTOMARK",
  .code = BRL_BLK_GOTOMARK,
  .isMotion = 1,
  .isOffset = 1,
  .description = "go to remembered window position"
}
,
{
  .name = "GOTOLINE",
  .code = BRL_BLK_GOTOLINE,
  .isMotion = 1,
  .isRow = 1,
  .description = "go to selected line"
}
,
{
  .name = "PRDIFCHAR",
  .code = BRL_BLK_PRDIFCHAR,
  .isMotion = 1,
  .isColumn = 1,
  .description = "go up to nearest line with different character"
}
,
{
  .name = "NXDIFCHAR",
  .code = BRL_BLK_NXDIFCHAR,
  .isMotion = 1,
  .isColumn = 1,
  .description = "go down to nearest line with different character"
}
,
{
  .name = "PASSKEY",
  .code = BRL_BLK_PASSKEY,
  .description = "input keyboard key"
}
,
{
  .name = "KEY_ENTER",
  .code = BRL_BLK_PASSKEY+BRL_KEY_ENTER,
  .description = "enter key"
}
,
{
  .name = "KEY_TAB",
  .code = BRL_BLK_PASSKEY+BRL_KEY_TAB,
  .description = "tab key"
}
,
{
  .name = "KEY_BACKSPACE",
  .code = BRL_BLK_PASSKEY+BRL_KEY_BACKSPACE,
  .description = "backspace key"
}
,
{
  .name = "KEY_ESCAPE",
  .code = BRL_BLK_PASSKEY+BRL_KEY_ESCAPE,
  .description = "escape key"
}
,
{
  .name = "KEY_CURSOR_LEFT",
  .code = BRL_BLK_PASSKEY+BRL_KEY_CURSOR_LEFT,
  .description = "cursor-left key"
}
,
{
  .name = "KEY_CURSOR_RIGHT",
  .code = BRL_BLK_PASSKEY+BRL_KEY_CURSOR_RIGHT,
  .description = "cursor-right key"
}
,
{
  .name = "KEY_CURSOR_UP",
  .code = BRL_BLK_PASSKEY+BRL_KEY_CURSOR_UP,
  .description = "cursor-up key"
}
,
{
  .name = "KEY_CURSOR_DOWN",
  .code = BRL_BLK_PASSKEY+BRL_KEY_CURSOR_DOWN,
  .description = "cursor-down key"
}
,
{
  .name = "KEY_PAGE_UP",
  .code = BRL_BLK_PASSKEY+BRL_KEY_PAGE_UP,
  .description = "page-up key"
}
,
{
  .name = "KEY_PAGE_DOWN",
  .code = BRL_BLK_PASSKEY+BRL_KEY_PAGE_DOWN,
  .description = "page-down key"
}
,
{
  .name = "KEY_HOME",
  .code = BRL_BLK_PASSKEY+BRL_KEY_HOME,
  .description = "home key"
}
,
{
  .name = "KEY_END",
  .code = BRL_BLK_PASSKEY+BRL_KEY_END,
  .description = "end key"
}
,
{
  .name = "KEY_INSERT",
  .code = BRL_BLK_PASSKEY+BRL_KEY_INSERT,
  .description = "insert key"
}
,
{
  .name = "KEY_DELETE",
  .code = BRL_BLK_PASSKEY+BRL_KEY_DELETE,
  .description = "delete key"
}
,
{
  .name = "KEY_FUNCTION",
  .code = BRL_BLK_PASSKEY+BRL_KEY_FUNCTION,
  .isOffset = 1,
  .description = "function key"
}
,
{
  .name = "PASSCHAR",
  .code = BRL_BLK_PASSCHAR,
  .description = "input unicode character"
}
,
{
  .name = "PASSDOTS",
  .code = BRL_BLK_PASSDOTS,
  .description = "input braille character"
}
,
{
  .name = "PASSAT",
  .code = BRL_BLK_PASSAT,
  .description = "input AT (set 2) keyboard scan code"
}
,
{
  .name = "PASSXT",
  .code = BRL_BLK_PASSXT,
  .description = "input XT (set 1) keyboard scan code"
}
,
{
  .name = "PASSPS2",
  .code = BRL_BLK_PASSPS2,
  .description = "input PS/2 (set 3) keyboard scan code"
}
,
{
  .name = "CONTEXT",
  .code = BRL_BLK_CONTEXT,
  .isOffset = 1,
  .description = "switch to command context"
}
,
