# Dependencies for speech.$O:
speech.$O: $(SRC_DIR)/speech.c
speech.$O: $(BLD_TOP)config.h
speech.$O: $(SRC_TOP)prologue.h
speech.$O: $(SRC_TOP)Programs/log.h
speech.$O: $(SRC_TOP)Programs/timing.h
speech.$O: $(SRC_TOP)Programs/driver.h
speech.$O: $(SRC_TOP)Programs/spk.h
speech.$O: $(SRC_TOP)Programs/spk_driver.h
speech.$O: $(SRC_DIR)/speech.h
speech.$O: $(SRC_TOP)Drivers/Braille/CombiBraille/braille.h
speech.$O: $(SRC_TOP)Programs/io_defs.h
speech.$O: $(SRC_TOP)Programs/io_serial.h

