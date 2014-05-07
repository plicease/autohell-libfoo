#ifndef FOO_H
#define FOO_H

#ifdef _WIN32
# ifdef DLL_EXPORT
#  define FOO_EXPORT __declspec(dllexport)
# else
#  ifdef LIBFOO_DLL_IMPORT
#   define FOO_EXPORT extern __declspec(dllimport)
#  endif
# endif
#else
# define FOO_EXPORT extern
#endif

FOO_EXPORT const char *foo_name();
FOO_EXPORT const char *foo_version_string();
FOO_EXPORT int foo_version_int();

#endif
