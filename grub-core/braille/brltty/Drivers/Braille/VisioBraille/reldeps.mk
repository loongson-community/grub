# Dependencies for braille.$O:
braille.$O: $(SRC_DIR)/braille.c
braille.$O: $(BLD_TOP)config.h
braille.$O: $(SRC_TOP)prologue.h
braille.$O: $(SRC_TOP)Programs/log.h
braille.$O: $(SRC_TOP)Programs/parse.h
braille.$O: $(SRC_TOP)Programs/driver.h
braille.$O: $(SRC_TOP)Programs/scr.h
braille.$O: $(SRC_TOP)Programs/message.h
braille.$O: $(SRC_TOP)Programs/brl.h
braille.$O: $(SRC_TOP)Programs/brl_driver.h
braille.$O: $(SRC_TOP)Programs/brldefs.h
braille.$O: $(SRC_TOP)Programs/ktbdefs.h
braille.$O: $(SRC_TOP)Programs/statdefs.h
braille.$O: $(SRC_DIR)/braille.h
braille.$O: $(SRC_DIR)/brldefs-vs.h
braille.$O: $(SRC_TOP)Programs/io_defs.h
braille.$O: $(SRC_TOP)Programs/io_serial.h
braille.$O: $(SRC_DIR)/brl-out.h

# Dependencies for vstp_main.$O:
vstp_main.$O: $(SRC_DIR)/vstp_main.c
vstp_main.$O: $(BLD_TOP)Programs/brlapi.h
vstp_main.$O: $(BLD_TOP)Programs/brlapi_constants.h
vstp_main.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
vstp_main.$O: $(SRC_DIR)/vstp.h

# Dependencies for vstp_transfer.$O:
vstp_transfer.$O: $(SRC_DIR)/vstp_transfer.c
vstp_transfer.$O: $(BLD_TOP)Programs/brlapi.h
vstp_transfer.$O: $(BLD_TOP)Programs/brlapi_constants.h
vstp_transfer.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
vstp_transfer.$O: $(SRC_TOP)Programs/brlapi_protocol.h
vstp_transfer.$O: $(SRC_DIR)/vstp.h

