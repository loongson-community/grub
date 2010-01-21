#!/bin/sh
set -ex

aclocal
autoconf
autoheader
automake -a -c -f

exit 0
