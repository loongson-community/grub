###############################################################################
# BRLTTY - A background process providing access to the console screen (when in
#          text mode) for a blind person using a refreshable braille display.
#
# Copyright (C) 1995-2012 by The BRLTTY Developers.
#
# BRLTTY comes with ABSOLUTELY NO WARRANTY.
#
# This is free software, placed under the terms of the
# GNU General Public License, as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any
# later version. Please see the file LICENSE-GPL for details.
#
# Web Page: http://mielke.cc/brltty/
#
# This software is maintained by Dave Mielke <dave@mielke.cc>.
###############################################################################

BUILD = x86_64-unknown-linux-gnu
BUILD_CPU = x86_64
BUILD_OS = linux-gnu
BUILD_VENDOR = unknown

HOST = x86_64-unknown-linux-gnu
HOST_CPU = x86_64
HOST_OS = linux-gnu
HOST_VENDOR = unknown

TARGET = x86_64-unknown-linux-gnu
TARGET_CPU = x86_64
TARGET_OS = linux-gnu
TARGET_VENDOR = unknown

PACKAGE_NAME = brltty
PACKAGE_VERSION = 4.3dev

PGM_DIR = Programs
DOC_DIR = Documents
MSG_DIR = Messages
TBL_DIR = Tables
BRL_DIR = Drivers/Braille
SPK_DIR = Drivers/Speech
SCR_DIR = Drivers/Screen
DRV_DIR = lib
DAT_DIR = data
BND_DIR = Bindings
API_LIBS = -L$(BLD_TOP)$(PGM_DIR) -lbrlapi

CROSSCOMP = 
INSTALL_ROOT = 
EXECUTE_ROOT = 

HOSTCC = gcc -Wall
CC = $(CROSSCOMP)$(HOSTCC)
EXTRACFLAGS = -I$(BLD_DIR) -I$(SRC_DIR) -I$(BLD_TOP:/=)/$(PGM_DIR) -I$(SRC_TOP:/=)/$(PGM_DIR) -I$(BLD_TOP:/=) -I$(SRC_TOP:/=)  -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H
COMMONCFLAGS = -g -O2 $(EXTRACFLAGS)
HOSTCFLAGS = $(COMMONCFLAGS)
CFLAGS = $(COMMONCFLAGS)
LIBCFLAGS = $(CFLAGS) -fPIC

HOSTCXX = gcc -Wall -Wall
CXX = $(CROSSCOMP)$(HOSTCXX)
COMMONCXXFLAGS = -g -O2 $(EXTRACFLAGS)
HOSTCXXFLAGS = $(COMMONCXXFLAGS)
CXXFLAGS = $(COMMONCXXFLAGS)
LIBCXXFLAGS = $(CXXFLAGS) -fPIC

COMMONLDFLAGS =  -Wl,-export-dynamic
HOSTLDFLAGS = $(COMMONLDFLAGS)
LDFLAGS = $(COMMONLDFLAGS)
LDLIBS = -ldl -lpthread -lsupc++ 
CLIBS = -lncurses 

LD = $(CROSSCOMP)ld

HOSTMKOBJ = $(LD) -r -o
MKOBJ = $(CROSSCOMP)$(HOSTMKOBJ)

HOSTMKMOD = $(CC) -shared  -o
MKMOD = $(CROSSCOMP)$(HOSTMKMOD)

HOSTMKLIB = $(CC) -shared -Wl,-soname,<name> -o
MKLIB = $(CROSSCOMP)$(HOSTMKLIB)

HOSTCONFLIBDIR = /sbin/ldconfig -n
CONFLIBDIR = $(CROSSCOMP)$(HOSTCONFLIBDIR)

HOSTRANLIB = ranlib
RANLIB = $(CROSSCOMP)$(HOSTRANLIB)

AWK = gawk

SYMLINK = ln -s

DOXYGEN = /usr/bin/doxygen

X_CFLAGS =  
X_LIBS = -lX11  
XKB_LIBS = -lXext   
XTK_LIBS = -lXt -lX11    

CURSES_LIB = ncurses
GUI_TOOLKIT_LIB = 

INSTALL = /usr/bin/install -c
INSTALL_SCRIPT = $(INSTALL)
INSTALL_PROGRAM = $(INSTALL_SCRIPT) -s
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_DIRECTORY = $(INSTALL) -d

ARC_PFX = lib
ARC_EXT = a
LIB_PFX = lib
LIB_EXT = so
MOD_NAME = libbrltty
MOD_EXT = so
LIB_VAR = LD_LIBRARY_PATH

prefix = 
exec_prefix = ${prefix}
datarootdir = ${prefix}/usr/share
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${datarootdir}
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
includedir = ${prefix}/usr/include
oldincludedir = /usr/include
localedir = ${datarootdir}/locale
infodir = ${datarootdir}/info
mandir = ${datarootdir}/man
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
htmldir = ${docdir}
dvidir = ${docdir}
pdfdir = ${docdir}
psdir = ${docdir}

STATE_DIRECTORY = @STATE_DIRECTORY@
PROGRAM_DIRECTORY = ${exec_prefix}/bin
DRIVERS_DIRECTORY = ${exec_prefix}/lib/brltty
WRITABLE_DIRECTORY = ${exec_prefix}/lib/brltty/rw
TABLES_DIRECTORY = ${prefix}/etc/brltty
MANPAGE_DIRECTORY = ${datarootdir}/man
INCLUDE_DIRECTORY = ${prefix}/usr/include/brltty

MANUAL_DIRECTORIES =  Documents/Manual-BRLTTY/English Documents/Manual-BRLTTY/French Documents/Manual-BrlAPI/English

BRAILLE_DRIVER_CODES = al at ba bc bd bl bm bn cb ec eu fs hm ht il lt mb md mn mt pg pm sk tn ts tt vd vo vr vs
BRAILLE_DRIVER_NAMES = Alva Albatross BrlAPI BrailComm Braudi BrailleLite Baum BrailleNote CombiBraille EcoBraille EuroBraille FreedomScientific HIMS HandyTech IrisLinux LogText MultiBraille MDV MiniBraille Metec Pegasus Papenmeier Seika TechniBraille TSI TTY VideoBraille Voyager Virtual VisioBraille
BRAILLE_INTERNAL_DRIVER_CODES = 
BRAILLE_INTERNAL_DRIVER_NAMES = 
BRAILLE_EXTERNAL_DRIVER_CODES = al at ba bc bd bl bm bn cb ec eu fs hm ht il lt mb md mn mt pg pm sk tn ts tt vd vo vr vs
BRAILLE_EXTERNAL_DRIVER_NAMES = Alva Albatross BrlAPI BrailComm Braudi BrailleLite Baum BrailleNote CombiBraille EcoBraille EuroBraille FreedomScientific HIMS HandyTech IrisLinux LogText MultiBraille MDV MiniBraille Metec Pegasus Papenmeier Seika TechniBraille TSI TTY VideoBraille Voyager Virtual VisioBraille
BRAILLE_DRIVER_OBJECTS = 
BRAILLE_DRIVER_LIBRARIES = 
BRAILLE_DRIVERS = braille-drivers

LIBBRAILLE_ROOT = 

SPEECH_DRIVER_CODES = al bl cb xs fv gs
SPEECH_DRIVER_NAMES = Alva BrailleLite CombiBraille ExternalSpeech Festival GenericSay
SPEECH_INTERNAL_DRIVER_CODES = 
SPEECH_INTERNAL_DRIVER_NAMES = 
SPEECH_EXTERNAL_DRIVER_CODES = al bl cb xs fv gs
SPEECH_EXTERNAL_DRIVER_NAMES = Alva BrailleLite CombiBraille ExternalSpeech Festival GenericSay
SPEECH_DRIVER_OBJECTS = 
SPEECH_DRIVER_LIBRARIES = 
SPEECH_DRIVERS = speech-drivers

SCREEN_DRIVER_CODES = lx sc a2
SCREEN_DRIVER_NAMES = Linux Screen AtSpi2
SCREEN_INTERNAL_DRIVER_CODES = 
SCREEN_INTERNAL_DRIVER_NAMES = 
SCREEN_EXTERNAL_DRIVER_CODES = lx sc a2
SCREEN_EXTERNAL_DRIVER_NAMES = Linux Screen AtSpi2
SCREEN_DRIVER_OBJECTS = 
SCREEN_DRIVER_LIBRARIES = 
SCREEN_DRIVERS = screen-drivers

ESPEAK_ROOT = 
FLITE_ROOT = 
FLITE_LANGUAGE = 
FLITE_LEXICON = 
FLITE_VOICE = 
MIKROPUHE_ROOT = 
SPEECHD_ROOT = 
SWIFT_ROOT = 
THETA_ROOT = 
VIAVOICE_ROOT = 

INSTALL_TEXT_TABLES = install-text-tables
INSTALL_ATTRIBUTES_TABLES = install-attributes-tables
INSTALL_CONTRACTION_TABLES = install-contraction-tables
INSTALL_DRIVERS = install-drivers

CSPI_INCLUDES = 
CSPI_LIBS = 

DBUS_INCLUDES = -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include  
DBUS_LIBS = -ldbus-1 -lpthread -lrt  

ICU_INCLUDES = 
ICU_LIBRARIES = 

TEXT_TABLE = en-nabcc
ATTRIBUTES_TABLE = attributes

SYSTEM_OBJECT = sys_linux.$O
KEYBOARD_OBJECTS = kbd.$O kbd_linux.$O

USB_OBJECTS = usb.$O usb_hid.$O usb_serial.$O usb_linux.$O
USB_CFLAGS = 
USB_LIBS = 

BLUETOOTH_OBJECTS = bluetooth.$O bluetooth_linux.$O
BLUETOOTH_CFLAGS = 
BLUETOOTH_LIBS = 

CTB_OBJECTS = ctb_compile.$O ctb_translate.$O

SPEECH_OBJECT = spk.$O

BEEPER_OBJECTS = beeper.$O
PCM_OBJECTS = pcm.$O
MIDI_OBJECTS = midi.$O
FM_OBJECTS = fm.$O adlib.$O

API_VERSION = 0.5
API_RELEASE = 0.5.5
API_OBJECTS = brlapi_server.$O brlapi_keyranges.$O auth.$O
API_LIBRARIES = -lpthread -lsupc++ 
ALL_API = all-api
BUILD_API = api
INSTALL_API = install-api
API_REF = $(API_LIBS)
API_DYNAMIC_LIBRARY = api-dynamic-library
INSTALL_API_LIBRARIES = install-api-libraries
UNINSTALL_API_LIBRARIES = uninstall-api-libraries
API_AUTHFILE = brlapi.key
API_SOCKET_DIRECTORY = ${prefix}/var/lib/BrlAPI

API_BINDINGS =  Java Lisp
ALL_API_BINDINGS = all-api-bindings
INSTALL_API_BINDINGS = install-api-bindings

ALL_XBRLAPI = all-xbrlapi
INSTALL_XBRLAPI = install-xbrlapi

