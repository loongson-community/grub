###############################################################################
# libbrlapi - A library providing access to braille terminals for applications.
#
# Copyright (C) 2005-2012 by
#   Alexis Robert <alexissoft@free.fr>
#   Samuel Thibault <Samuel.Thibault@ens-lyon.org>
#
# libbrlapi comes with ABSOLUTELY NO WARRANTY.
#
# This is free software, placed under the terms of the
# GNU Lesser General Public License, as published by the Free Software
# Foundation; either version 2.1 of the License, or (at your option) any
# later version. Please see the file LICENSE-LGPL for details.
#
# Web Page: http://mielke.cc/brltty/
#
# This software is maintained by Dave Mielke <dave@mielke.cc>.
###############################################################################

from distutils.core import setup, Extension

if __name__ == "__main__":
    brlapi = Extension("brlapi",
        sources = ["brlapi.auto.c","./bindings.c"],
        include_dirs = [".", ".", "./../../Programs", "./../../Programs", "./../../", "./../../"],
        library_dirs = ["./../../Programs"],
        libraries = ["brlapi"],
        language = "c",
        define_macros = [],
        extra_compile_args = "-Wno-parentheses -Wno-unused -fno-strict-aliasing -U_POSIX_C_SOURCE -U_XOPEN_SOURCE".split())
    
    setup(
        name = "Brlapi",
        version = "0.5.5",
        description = "Python BrlAPI",
        author = "Alexis Robert",
        author_email = "alexissoft@free.fr",
        license = "LGPL license",
        url = "http://mielke.cc/brltty/",
        ext_modules = [brlapi],)
