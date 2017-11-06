# not following the standard layout of a GNU project (foreign project):
AUTOMAKE_OPTIONS = foreign

# build a program called helloworld
# (bin - file should be installed to the directory defined by the variable bindir;
# PROGRAMS - means that it needs to be build, SCRIPTS/DATA doesn't need to be build)
bin_PROGRAMS = helloworld

helloworld_SOURCES = main.c

helloworld_CPPFLAGS = -I../src/include

AM_CPPFLAGS = $(helloworld_CPPFLAGS)
