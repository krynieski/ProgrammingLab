# initizlize autoconf and set up some basic information:
AC_INIT([helloworld], [0.1], [kryyhoo@gmail.com])
# initialize automake:
AM_INIT_AUTOMAKE

# look for dependencies (in this case only C compiler is needed)
AC_PROG_CC

# tell autoconf what configure script should do: find a file called Makefile.in,
# substitute placeholders like @PACKAGE_VERSION@ with values like 0.1, and write
# the results to Makefile
AC_CONFIG_FILES([Makefile])

# call the AC_OUTPUT macro to output the script:
AC_OUTPUT
