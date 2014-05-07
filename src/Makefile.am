AM_CFLAGS = -Wall
AM_LDFLAGS =

bin_PROGRAMS = foo
foo_SOURCES = foo.c main.c foo.h

lib_LIBRARIES = libfoo.a
libfoo_a_SOURCES = foo.c foo.h

lib_LTLIBRARIES = libfoo.la
libfoo_la_SOURCES = foo.c foo.h
libfoo_la_CFLAGS = $(AM_CFLAGS)

include_HEADERS = foo.h
