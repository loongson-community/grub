#include <locale.h>
#include <wchar.h>

const char *
getLocaleCharset (void)
{
  return nl_langinfo (CODESET);
}

int
registerCharacterSet (const char *charset)
{
  return grub_strcasecmp (charset, "UTF-8") == 0;
}

wint_t
convertCharToWchar (char c)
{
  return (unsigned char) c;
}

int
convertWcharToChar (wchar_t wc)
{
  return wc & 0xff;
}

