#include "prologue.h"

#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include <errno.h>
#include <locale.h>

#include "charset.h"
#include "unicode.h"
#include "ascii.h"

wint_t
convertCharToWchar (char c) {
  if (c & 0x80)
    return -1;
  return c;
}

/* FIXME: Really implement it.  */
wchar_t
getBaseCharacter (wchar_t character)
{
  return character;
}

wchar_t
getTransliteratedCharacter (wchar_t character)
{
  return grub_translit (character);
}

int
handleBestCharacter (wchar_t character, CharacterHandler handleCharacter, void *data) {
  typedef wchar_t CharacterTranslator (wchar_t character);
  static CharacterTranslator *const characterTranslators[] = {
    getBaseCharacter,
    getTransliteratedCharacter,
    NULL
  };
  CharacterTranslator *const *translateCharacter = characterTranslators;

  while (!handleCharacter(character, data)) {
    if (!*translateCharacter) return 0;

    {
      wchar_t alternate = (*translateCharacter++)(character);
      if (alternate) character = alternate;
    }
  }

  return 1;
}
