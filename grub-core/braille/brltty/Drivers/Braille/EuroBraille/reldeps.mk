# Dependencies for eu_bluetooth.$O:
eu_bluetooth.$O: $(SRC_DIR)/eu_bluetooth.c
eu_bluetooth.$O: $(BLD_TOP)config.h
eu_bluetooth.$O: $(SRC_TOP)prologue.h
eu_bluetooth.$O: $(SRC_TOP)Programs/log.h
eu_bluetooth.$O: $(SRC_TOP)Programs/io_bluetooth.h
eu_bluetooth.$O: $(SRC_DIR)/eu_io.h

# Dependencies for eu_braille.$O:
eu_braille.$O: $(SRC_DIR)/eu_braille.c
eu_braille.$O: $(BLD_TOP)config.h
eu_braille.$O: $(SRC_TOP)prologue.h
eu_braille.$O: $(SRC_TOP)Programs/message.h
eu_braille.$O: $(SRC_TOP)Programs/log.h
eu_braille.$O: $(SRC_TOP)Programs/brl.h
eu_braille.$O: $(SRC_TOP)Programs/brl_driver.h
eu_braille.$O: $(SRC_TOP)Programs/brldefs.h
eu_braille.$O: $(SRC_TOP)Programs/driver.h
eu_braille.$O: $(SRC_TOP)Programs/ktbdefs.h
eu_braille.$O: $(SRC_TOP)Programs/statdefs.h
eu_braille.$O: $(SRC_TOP)Programs/parse.h
eu_braille.$O: $(SRC_TOP)Programs/timing.h
eu_braille.$O: $(SRC_TOP)Programs/io_defs.h
eu_braille.$O: $(SRC_TOP)Programs/io_serial.h
eu_braille.$O: $(SRC_TOP)Programs/io_usb.h
eu_braille.$O: $(SRC_TOP)Programs/io_bluetooth.h

# Dependencies for eu_clio.$O:
eu_clio.$O: $(SRC_DIR)/eu_clio.c
eu_clio.$O: $(BLD_TOP)config.h
eu_clio.$O: $(SRC_TOP)prologue.h
eu_clio.$O: $(SRC_TOP)Programs/log.h
eu_clio.$O: $(SRC_TOP)Programs/timing.h
eu_clio.$O: $(SRC_TOP)Programs/message.h
eu_clio.$O: $(SRC_TOP)Programs/ascii.h
eu_clio.$O: $(SRC_DIR)/eu_protocol.h
eu_clio.$O: $(SRC_DIR)/eu_keys.h

# Dependencies for eu_esysiris.$O:
eu_esysiris.$O: $(SRC_DIR)/eu_esysiris.c
eu_esysiris.$O: $(BLD_TOP)config.h
eu_esysiris.$O: $(SRC_TOP)prologue.h
eu_esysiris.$O: $(SRC_TOP)Programs/log.h
eu_esysiris.$O: $(SRC_TOP)Programs/timing.h
eu_esysiris.$O: $(SRC_TOP)Programs/message.h
eu_esysiris.$O: $(SRC_TOP)Programs/ascii.h
eu_esysiris.$O: $(SRC_DIR)/eu_protocol.h
eu_esysiris.$O: $(SRC_DIR)/eu_keys.h

# Dependencies for eu_io.$O:
eu_io.$O: $(SRC_DIR)/eu_io.c
eu_io.$O: $(BLD_TOP)config.h
eu_io.$O: $(SRC_TOP)prologue.h
eu_io.$O: $(SRC_DIR)/eu_io.h

# Dependencies for eu_net.$O:
eu_net.$O: $(SRC_DIR)/eu_net.c
eu_net.$O: $(BLD_TOP)config.h
eu_net.$O: $(SRC_TOP)prologue.h
eu_net.$O: $(SRC_DIR)/eu_io.h
eu_net.$O: $(SRC_TOP)Programs/sys_windows.h
eu_net.$O: $(SRC_TOP)Programs/log.h
eu_net.$O: $(SRC_TOP)Programs/timing.h
eu_net.$O: $(SRC_TOP)Programs/io_misc.h
eu_net.$O: $(BLD_TOP)Programs/brlapi_constants.h
eu_net.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
eu_net.$O: $(SRC_TOP)Programs/cmd.h
eu_net.$O: $(SRC_DIR)/eu_braille.h
eu_net.$O: $(SRC_TOP)Programs/brl.h
eu_net.$O: $(SRC_TOP)Programs/brldefs.h
eu_net.$O: $(SRC_TOP)Programs/driver.h
eu_net.$O: $(SRC_TOP)Programs/ktbdefs.h

# Dependencies for eu_protocol.$O:
eu_protocol.$O: $(SRC_DIR)/eu_protocol.c
eu_protocol.$O: $(BLD_TOP)config.h
eu_protocol.$O: $(SRC_TOP)prologue.h
eu_protocol.$O: $(SRC_DIR)/eu_protocol.h

# Dependencies for eu_serial.$O:
eu_serial.$O: $(SRC_DIR)/eu_serial.c
eu_serial.$O: $(BLD_TOP)config.h
eu_serial.$O: $(SRC_TOP)prologue.h
eu_serial.$O: $(SRC_DIR)/eu_io.h
eu_serial.$O: $(SRC_DIR)/eu_protocol.h
eu_serial.$O: $(SRC_TOP)Programs/io_defs.h
eu_serial.$O: $(SRC_TOP)Programs/io_serial.h

# Dependencies for eu_usb.$O:
eu_usb.$O: $(SRC_DIR)/eu_usb.c
eu_usb.$O: $(BLD_TOP)config.h
eu_usb.$O: $(SRC_TOP)prologue.h
eu_usb.$O: $(SRC_TOP)Programs/log.h
eu_usb.$O: $(SRC_DIR)/eu_io.h
eu_usb.$O: $(SRC_TOP)Programs/io_defs.h
eu_usb.$O: $(SRC_TOP)Programs/io_usb.h

