#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT(libfoo, 1.00, plicease@cpan.org)
AM_INIT_AUTOMAKE(libfoo, 1.00)
LT_INIT
AC_CONFIG_SRCDIR([examples/example.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_FILES([pkgconfig/libfoo.pc])

# Checks for programs.
AC_PROG_CC
AC_PROG_CC_STDC
AC_C_CONST
AM_PROG_LIBTOOL
AC_LIBTOOL_WIN32_DLL

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# ----------------------------------------------------------------------
# Win32 objects need to tell the header whether they will be linking
# with a dll or static archive in order that everything is imported
# to the object in the same way that it was exported from the
# archive (extern for static, __declspec(dllimport) for dlls)
# ----------------------------------------------------------------------
LIBFOO_DLL_IMPORT=
case "$host" in
*-*-cygwin* | *-*-mingw* )
  if test X"$enable_shared" = Xyes; then
    AC_TRY_LINK_FUNC([libfoo_is_dll],
                     [LIBFOO_DLL_IMPORT=-DLIBFOO_DLL_IMPORT])
  fi
  ;;
esac
AC_SUBST(LIBFOO_DLL_IMPORT)

AC_OUTPUT(Makefile src/Makefile doc/Makefile examples/Makefile man/Makefile scripts/Makefile)
