AM_CFLAGS = -Wall
AM_LDFLAGS =

lib_LIBRARIES = libfoo.a
libfoo_a_SOURCES = foo.c foo.h

lib_LTLIBRARIES   = libfoo.la
libfoo_la_SOURCES = foo.c foo.h
libfoo_la_CFLAGS  = $(AM_CFLAGS)
libfoo_la_LDFLAGS = -no-undefined -version-info 0:0:0

include_HEADERS = foo.h

bin_PROGRAMS = foo
foo_SOURCES  = main.c foo.h
foo_LDADD    = libfoo.la


