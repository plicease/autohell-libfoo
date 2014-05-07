#if HAVE_CONFIG_H
# include <config.h>
#endif

#include "foo.h"

FOO_EXPORT const char *
foo_name()
{
  return "libfoo";
}

FOO_EXPORT const char *
foo_version_string()
{
  return "1.00";
}

FOO_EXPORT int
foo_version_int()
{
  return 100;
}

#if defined WIN32 && defined DLL_EXPORT
char
libfoo_is_dll(void)
{
  return 1;
}
#endif
