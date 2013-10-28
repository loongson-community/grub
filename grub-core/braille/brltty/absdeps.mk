# Dependencies for Bindings/Caml/brlapi_stubs.$O:
$(BLD_TOP)Bindings/Caml/brlapi_stubs.$O: $(SRC_TOP)Bindings/Caml/brlapi_stubs.c
$(BLD_TOP)Bindings/Caml/brlapi_stubs.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Bindings/Caml/brlapi_stubs.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Bindings/Caml/brlapi_stubs.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Bindings/Caml/brlapi_stubs.$O: $(SRC_TOP)Programs/brlapi_protocol.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Bindings/Java/bindings.$O:
$(BLD_TOP)Bindings/Java/bindings.$O: $(SRC_TOP)Bindings/Java/bindings.c
$(BLD_TOP)Bindings/Java/bindings.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Bindings/Java/bindings.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Bindings/Java/bindings.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Bindings/Python/bindings.$O:
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Bindings/Python/bindings.c
$(BLD_TOP)Bindings/Python/bindings.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(BLD_TOP)config.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Programs/win_errno.h
$(BLD_TOP)Bindings/Python/bindings.$O: $(SRC_TOP)Bindings/Python/bindings.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Bindings/Tcl/bindings.$O:
$(BLD_TOP)Bindings/Tcl/bindings.$O: $(SRC_TOP)Bindings/Tcl/bindings.c
$(BLD_TOP)Bindings/Tcl/bindings.$O: $(SRC_TOP)Programs/brldots.h
$(BLD_TOP)Bindings/Tcl/bindings.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Bindings/Tcl/bindings.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Bindings/Tcl/bindings.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Albatross/braille.$O:
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Drivers/Braille/Albatross/braille.c
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Drivers/Braille/Albatross/brldefs-at.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Albatross/braille.$O: $(SRC_TOP)Programs/io_usb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Alva/braille.$O:
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Drivers/Braille/Alva/braille.c
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Drivers/Braille/Alva/brldefs-al.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Drivers/Braille/Alva/braille.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/Alva/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Baum/braille.$O:
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Drivers/Braille/Baum/braille.c
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Drivers/Braille/Baum/brldefs-bm.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/Baum/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/BrailComm/braille.$O:
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Drivers/Braille/BrailComm/braille.c
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/BrailComm/braille.$O: $(SRC_TOP)Drivers/Braille/BrailComm/brl-out.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/BrailleLite/braille.$O:
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Drivers/Braille/BrailleLite/braille.c
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Drivers/Braille/BrailleLite/braille.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/BrailleLite/braille.$O: $(SRC_TOP)Drivers/Braille/BrailleLite/bindings.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/BrailleNote/braille.$O:
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Drivers/Braille/BrailleNote/braille.c
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Drivers/Braille/BrailleNote/braille.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/BrailleNote/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Braudi/braille.$O:
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Drivers/Braille/Braudi/braille.c
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Braudi/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/BrlAPI/braille.$O:
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Drivers/Braille/BrlAPI/braille.c
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/BrlAPI/braille.$O: $(SRC_TOP)Programs/statdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/CombiBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/CombiBraille/braille.c
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/CombiBraille/brldefs-cb.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/CombiBraille/braille.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/CombiBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EcoBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Drivers/Braille/EcoBraille/braille.c
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Drivers/Braille/EcoBraille/braille.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/EcoBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_bluetooth.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_bluetooth.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_braille.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_braille.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_clio.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_clio.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_protocol.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_clio.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_keys.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_esysiris.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_esysiris.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_protocol.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_esysiris.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_keys.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_io.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_io.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_io.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_io.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_io.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_net.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_net.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_braille.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_net.$O: $(SRC_TOP)Programs/ktbdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_protocol.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_protocol.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_protocol.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_protocol.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_protocol.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_protocol.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_protocol.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_serial.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_serial.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_protocol.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_serial.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/EuroBraille/eu_usb.$O:
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_usb.c
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)Drivers/Braille/EuroBraille/eu_io.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/EuroBraille/eu_usb.$O: $(SRC_TOP)Programs/io_usb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/FreedomScientific/braille.$O:
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Drivers/Braille/FreedomScientific/braille.c
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Drivers/Braille/FreedomScientific/brldefs-fs.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/FreedomScientific/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/HIMS/braille.$O:
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Drivers/Braille/HIMS/braille.c
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Drivers/Braille/HIMS/brldefs-hm.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/HIMS/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/HandyTech/braille.$O:
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Drivers/Braille/HandyTech/braille.c
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/touch.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Drivers/Braille/HandyTech/brldefs-ht.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/HandyTech/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/IrisLinux/braille.$O:
$(BLD_TOP)Drivers/Braille/IrisLinux/braille.$O: $(SRC_TOP)Drivers/Braille/IrisLinux/braille.c
$(BLD_TOP)Drivers/Braille/IrisLinux/braille.$O: $(BLD_TOP)config.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Libbraille/braille.$O:
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Drivers/Braille/Libbraille/braille.c
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Libbraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/LogText/braille.$O:
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Drivers/Braille/LogText/braille.c
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Drivers/Braille/LogText/braille.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/LogText/braille.$O: $(SRC_TOP)Drivers/Braille/LogText/brl-out.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/MDV/braille.$O:
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Drivers/Braille/MDV/braille.c
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Drivers/Braille/MDV/braille.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/MDV/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Metec/braille.$O:
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Drivers/Braille/Metec/braille.c
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Drivers/Braille/Metec/brldefs-mt.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Metec/braille.$O: $(SRC_TOP)Programs/io_usb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/MiniBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Drivers/Braille/MiniBraille/braille.c
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/MiniBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/MultiBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/MultiBraille/braille.c
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/MultiBraille/braille.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/MultiBraille/braille.$O: $(SRC_TOP)Drivers/Braille/MultiBraille/tables.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Papenmeier/braille.$O:
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Drivers/Braille/Papenmeier/braille.c
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Drivers/Braille/Papenmeier/brldefs-pm.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Drivers/Braille/Papenmeier/models.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Drivers/Braille/Papenmeier/braille.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/Papenmeier/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Pegasus/braille.$O:
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Drivers/Braille/Pegasus/braille.c
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Drivers/Braille/Pegasus/brldefs-pg.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Pegasus/braille.$O: $(SRC_TOP)Programs/io_usb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Seika/braille.$O:
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Drivers/Braille/Seika/braille.c
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Drivers/Braille/Seika/brldefs-sk.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Drivers/Braille/Seika/braille.$O: $(SRC_TOP)Programs/io_bluetooth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Skeleton/braille.$O:
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Drivers/Braille/Skeleton/braille.c
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Skeleton/braille.$O: $(SRC_TOP)Programs/statdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/TSI/braille.$O:
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Drivers/Braille/TSI/braille.c
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Drivers/Braille/TSI/braille.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/TSI/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/TTY/braille.$O:
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Drivers/Braille/TTY/braille.c
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Drivers/Braille/TTY/braille.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/TTY/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/TechniBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Drivers/Braille/TechniBraille/braille.c
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/TechniBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/VideoBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VideoBraille/braille.c
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/VideoBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VideoBraille/braille.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Virtual/braille.$O:
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Drivers/Braille/Virtual/braille.c
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Virtual/braille.$O: $(SRC_TOP)Drivers/Braille/Virtual/braille.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/VisioBraille/braille.$O:
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/braille.c
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/braille.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/brldefs-vs.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/VisioBraille/braille.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/brl-out.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/VisioBraille/vstp_main.$O:
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_main.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/vstp_main.c
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_main.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_main.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_main.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_main.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/vstp.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/VisioBraille/vstp_transfer.$O:
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/vstp_transfer.c
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(SRC_TOP)Programs/brlapi_protocol.h
$(BLD_TOP)Drivers/Braille/VisioBraille/vstp_transfer.$O: $(SRC_TOP)Drivers/Braille/VisioBraille/vstp.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/Voyager/braille.$O:
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Drivers/Braille/Voyager/braille.c
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Drivers/Braille/Voyager/brldefs-vo.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Drivers/Braille/Voyager/braille.$O: $(SRC_TOP)Programs/io_usb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Braille/XWindow/braille.$O:
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Drivers/Braille/XWindow/braille.c
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Drivers/Braille/XWindow/braille.$O: $(SRC_TOP)Drivers/Braille/XWindow/braille.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/BrlAPI/WindowEyes/test.$O:
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/test.$O: $(SRC_TOP)Drivers/BrlAPI/WindowEyes/test.c
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/test.$O: $(SRC_TOP)Drivers/BrlAPI/WindowEyes/webrloem.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/BrlAPI/WindowEyes/webrloem.$O:
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/webrloem.$O: $(SRC_TOP)Drivers/BrlAPI/WindowEyes/webrloem.c
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/webrloem.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/webrloem.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/webrloem.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/BrlAPI/WindowEyes/webrloem.$O: $(SRC_TOP)Drivers/BrlAPI/WindowEyes/webrloem.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/AtSpi/screen.$O:
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Drivers/Screen/AtSpi/screen.c
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/AtSpi/screen.$O: $(SRC_TOP)Programs/scr_real.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/AtSpi2/screen.$O:
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Drivers/Screen/AtSpi2/screen.c
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/AtSpi2/screen.$O: $(SRC_TOP)Programs/scr_real.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/Hurd/screen.$O:
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Drivers/Screen/Hurd/screen.c
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Programs/scr_real.h
$(BLD_TOP)Drivers/Screen/Hurd/screen.$O: $(SRC_TOP)Drivers/Screen/Hurd/screen.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/Linux/screen.$O:
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Drivers/Screen/Linux/screen.c
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/sys_linux.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Programs/scr_real.h
$(BLD_TOP)Drivers/Screen/Linux/screen.$O: $(SRC_TOP)Drivers/Screen/Linux/screen.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/PcBios/screen.$O:
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Drivers/Screen/PcBios/screen.c
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scancodes.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/PcBios/screen.$O: $(SRC_TOP)Programs/scr_real.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/Screen/screen.$O:
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Drivers/Screen/Screen/screen.c
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Programs/scr_real.h
$(BLD_TOP)Drivers/Screen/Screen/screen.$O: $(SRC_TOP)Drivers/Screen/Screen/screen.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/Skeleton/screen.$O:
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Drivers/Screen/Skeleton/screen.c
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/Skeleton/screen.$O: $(SRC_TOP)Programs/scr_real.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Screen/Windows/screen.$O:
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Drivers/Screen/Windows/screen.c
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scancodes.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scr_driver.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Drivers/Screen/Windows/screen.$O: $(SRC_TOP)Programs/scr_real.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Alva/speech.$O:
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Drivers/Speech/Alva/speech.c
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Drivers/Speech/Alva/speech.h
$(BLD_TOP)Drivers/Speech/Alva/speech.$O: $(SRC_TOP)Drivers/Braille/Alva/braille.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/BrailleLite/speech.$O:
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Drivers/Speech/BrailleLite/speech.c
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Drivers/Speech/BrailleLite/speech.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Drivers/Braille/BrailleLite/braille.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Speech/BrailleLite/speech.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/CombiBraille/speech.$O:
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Drivers/Speech/CombiBraille/speech.c
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Drivers/Speech/CombiBraille/speech.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Drivers/Braille/CombiBraille/braille.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Speech/CombiBraille/speech.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/ExternalSpeech/speech.$O:
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Drivers/Speech/ExternalSpeech/speech.c
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/ExternalSpeech/speech.$O: $(SRC_TOP)Drivers/Speech/ExternalSpeech/speech.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Festival/speech.$O:
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Drivers/Speech/Festival/speech.c
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/Festival/speech.$O: $(SRC_TOP)Drivers/Speech/Festival/speech.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/FestivalLite/speech.$O:
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Drivers/Speech/FestivalLite/speech.c
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/FestivalLite/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/GenericSay/speech.$O:
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Drivers/Speech/GenericSay/speech.c
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/GenericSay/speech.$O: $(SRC_TOP)Drivers/Speech/GenericSay/speech.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Mikropuhe/speech.$O:
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Drivers/Speech/Mikropuhe/speech.c
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Mikropuhe/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/MultiBraille/speech.$O:
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Drivers/Speech/MultiBraille/speech.c
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Drivers/Speech/MultiBraille/speech.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Drivers/Braille/MultiBraille/braille.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Drivers/Speech/MultiBraille/speech.$O: $(SRC_TOP)Programs/io_serial.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Skeleton/speech.$O:
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(SRC_TOP)Drivers/Speech/Skeleton/speech.c
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Skeleton/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/SpeechDispatcher/speech.$O:
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Drivers/Speech/SpeechDispatcher/speech.c
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/SpeechDispatcher/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Swift/speech.$O:
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)Drivers/Speech/Swift/speech.c
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Swift/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/Theta/speech.$O:
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Drivers/Speech/Theta/speech.c
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/Theta/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/ViaVoice/speech.$O:
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Drivers/Speech/ViaVoice/speech.c
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Programs/spk_driver.h
$(BLD_TOP)Drivers/Speech/ViaVoice/speech.$O: $(SRC_TOP)Drivers/Speech/ViaVoice/speech.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Drivers/Speech/eSpeak/speech.$O:
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Drivers/Speech/eSpeak/speech.c
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(BLD_TOP)config.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Drivers/Speech/eSpeak/speech.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/adlib.$O:
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)Programs/adlib.c
$(BLD_TOP)Programs/adlib.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/adlib.$O: $(SRC_TOP)Programs/adlib.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/apitest.$O:
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)Programs/apitest.c
$(BLD_TOP)Programs/apitest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/apitest.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/apitest.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/apitest.$O: $(BLD_TOP)Programs/brlapi.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/async.$O:
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/async.c
$(BLD_TOP)Programs/async.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/sys_msdos.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/async.$O: $(SRC_TOP)Programs/async.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/atb_compile.$O:
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/atb_compile.c
$(BLD_TOP)Programs/atb_compile.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/dataarea.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/atb.h
$(BLD_TOP)Programs/atb_compile.$O: $(SRC_TOP)Programs/atb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/atb_translate.$O:
$(BLD_TOP)Programs/atb_translate.$O: $(SRC_TOP)Programs/atb_translate.c
$(BLD_TOP)Programs/atb_translate.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/atb_translate.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/atb_translate.$O: $(SRC_TOP)Programs/atb.h
$(BLD_TOP)Programs/atb_translate.$O: $(SRC_TOP)Programs/atb_internal.h
$(BLD_TOP)Programs/atb_translate.$O: $(BLD_TOP)Programs/attr.auto.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/auth.$O:
$(BLD_TOP)Programs/auth.$O: $(SRC_TOP)Programs/auth.c
$(BLD_TOP)Programs/auth.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/auth.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/auth.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/auth.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/auth.$O: $(SRC_TOP)Programs/auth.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/beeper.$O:
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)Programs/beeper.c
$(BLD_TOP)Programs/beeper.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/beeper.$O: $(SRC_TOP)Programs/notes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/bluetooth.$O:
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/bluetooth.c
$(BLD_TOP)Programs/bluetooth.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Programs/bluetooth.$O: $(SRC_TOP)Programs/bluetooth_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/bluetooth_linux.$O:
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)Programs/bluetooth_linux.c
$(BLD_TOP)Programs/bluetooth_linux.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)Programs/bluetooth_internal.h
$(BLD_TOP)Programs/bluetooth_linux.$O: $(SRC_TOP)Programs/io_misc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/bluetooth_none.$O:
$(BLD_TOP)Programs/bluetooth_none.$O: $(SRC_TOP)Programs/bluetooth_none.c
$(BLD_TOP)Programs/bluetooth_none.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/bluetooth_none.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/bluetooth_none.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Programs/bluetooth_none.$O: $(SRC_TOP)Programs/bluetooth_internal.h
$(BLD_TOP)Programs/bluetooth_none.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/bluetooth_windows.$O:
$(BLD_TOP)Programs/bluetooth_windows.$O: $(SRC_TOP)Programs/bluetooth_windows.c
$(BLD_TOP)Programs/bluetooth_windows.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/bluetooth_windows.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/bluetooth_windows.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Programs/bluetooth_windows.$O: $(SRC_TOP)Programs/bluetooth_internal.h
$(BLD_TOP)Programs/bluetooth_windows.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brl.$O:
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brl.c
$(BLD_TOP)Programs/brl.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/async.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/drivers.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/brl.$O: $(BLD_TOP)Programs/brl.auto.h
$(BLD_TOP)Programs/brl.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/brl_driver.h
$(BLD_TOP)Programs/brl.$O: $(SRC_TOP)Programs/statdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brlapi_client.$O:
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/brlapi_client.c
$(BLD_TOP)Programs/brlapi_client.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/win_errno.h
$(BLD_TOP)Programs/brlapi_client.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Programs/brlapi_client.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/brlapi_protocol.h
$(BLD_TOP)Programs/brlapi_client.$O: $(SRC_TOP)Programs/brlapi_common.h
$(BLD_TOP)Programs/brlapi_client.$O: $(BLD_TOP)Programs/brlapi_keytab.auto.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brlapi_keyranges.$O:
$(BLD_TOP)Programs/brlapi_keyranges.$O: $(SRC_TOP)Programs/brlapi_keyranges.c
$(BLD_TOP)Programs/brlapi_keyranges.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brlapi_keyranges.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brlapi_keyranges.$O: $(SRC_TOP)Programs/brlapi_keyranges.h
$(BLD_TOP)Programs/brlapi_keyranges.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brlapi_server.$O:
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brlapi_server.c
$(BLD_TOP)Programs/brlapi_server.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Programs/brlapi_server.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Programs/brlapi_server.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brlapi_protocol.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brlapi_keyranges.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/auth.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/brlapi_server.$O: $(SRC_TOP)Programs/brlapi_common.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brltest.$O:
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/brltest.c
$(BLD_TOP)Programs/brltest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Programs/brltest.$O: $(SRC_TOP)Programs/defaults.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/brltty.$O:
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/brltty.c
$(BLD_TOP)Programs/brltty.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/embed.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/atb.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/routing.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/cut.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/touch.h
$(BLD_TOP)Programs/brltty.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/scancodes.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/status.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/brltty.$O: $(SRC_TOP)Programs/defaults.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/charset.$O:
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/charset.c
$(BLD_TOP)Programs/charset.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/sys_msdos.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/charset.$O: $(SRC_TOP)Programs/unicode.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/cmd.$O:
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/cmd.c
$(BLD_TOP)Programs/cmd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/cmd.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/cmd.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/cmd.$O: $(BLD_TOP)Programs/cmds.auto.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/config.$O:
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/config.c
$(BLD_TOP)Programs/config.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/config.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/status.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/atb.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ktb_keyboard.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/kbd.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/async.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/defaults.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/io_bluetooth.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Programs/config.$O: $(SRC_TOP)Programs/sys_msdos.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ctb_compile.$O:
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/ctb_compile.c
$(BLD_TOP)Programs/ctb_compile.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/ctb_internal.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/dataarea.h
$(BLD_TOP)Programs/ctb_compile.$O: $(SRC_TOP)Programs/brldots.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ctb_translate.$O:
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/ctb_translate.c
$(BLD_TOP)Programs/ctb_translate.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/ctb_internal.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/ascii.h
$(BLD_TOP)Programs/ctb_translate.$O: $(SRC_TOP)Programs/brldots.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ctbtest.$O:
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/ctbtest.c
$(BLD_TOP)Programs/ctbtest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ctbtest.$O: $(SRC_TOP)Programs/ctb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/cut.$O:
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)Programs/cut.c
$(BLD_TOP)Programs/cut.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/cut.$O: $(SRC_TOP)Programs/cut.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/dataarea.$O:
$(BLD_TOP)Programs/dataarea.$O: $(SRC_TOP)Programs/dataarea.c
$(BLD_TOP)Programs/dataarea.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/dataarea.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/dataarea.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/dataarea.$O: $(SRC_TOP)Programs/dataarea.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/datafile.$O:
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/datafile.c
$(BLD_TOP)Programs/datafile.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/datafile.$O: $(SRC_TOP)Programs/brldots.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/device.$O:
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)Programs/device.c
$(BLD_TOP)Programs/device.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/device.$O: $(SRC_TOP)Programs/misc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/driver.$O:
$(BLD_TOP)Programs/driver.$O: $(SRC_TOP)Programs/driver.c
$(BLD_TOP)Programs/driver.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/driver.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/driver.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/driver.$O: $(SRC_TOP)Programs/driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/drivers.$O:
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/drivers.c
$(BLD_TOP)Programs/drivers.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/drivers.$O: $(SRC_TOP)Programs/drivers.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/file.$O:
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/file.c
$(BLD_TOP)Programs/file.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/file.$O: $(SRC_TOP)Programs/misc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/fm.$O:
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/fm.c
$(BLD_TOP)Programs/fm.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/fm.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/notes.h
$(BLD_TOP)Programs/fm.$O: $(SRC_TOP)Programs/adlib.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/io_misc.$O:
$(BLD_TOP)Programs/io_misc.$O: $(SRC_TOP)Programs/io_misc.c
$(BLD_TOP)Programs/io_misc.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/io_misc.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/io_misc.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/io_misc.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/io_misc.$O: $(SRC_TOP)Programs/sys_msdos.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/kbd.$O:
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)Programs/kbd.c
$(BLD_TOP)Programs/kbd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)Programs/kbd.h
$(BLD_TOP)Programs/kbd.$O: $(SRC_TOP)Programs/ktbdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/kbd_linux.$O:
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/kbd_linux.c
$(BLD_TOP)Programs/kbd_linux.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/kbd.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/ktb_keyboard.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/sys_linux.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/kbd_linux.$O: $(SRC_TOP)Programs/async.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/kbd_none.$O:
$(BLD_TOP)Programs/kbd_none.$O: $(SRC_TOP)Programs/kbd_none.c
$(BLD_TOP)Programs/kbd_none.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/kbd_none.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/kbd_none.$O: $(SRC_TOP)Programs/kbd.h
$(BLD_TOP)Programs/kbd_none.$O: $(SRC_TOP)Programs/ktbdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ktb_compile.$O:
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/ktb_compile.c
$(BLD_TOP)Programs/ktb_compile.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ktb_compile.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/ktb_compile.$O: $(SRC_TOP)Programs/ktb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ktb_keyboard.$O:
$(BLD_TOP)Programs/ktb_keyboard.$O: $(SRC_TOP)Programs/ktb_keyboard.c
$(BLD_TOP)Programs/ktb_keyboard.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ktb_keyboard.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ktb_keyboard.$O: $(SRC_TOP)Programs/ktb_keyboard.h
$(BLD_TOP)Programs/ktb_keyboard.$O: $(SRC_TOP)Programs/ktbdefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ktb_list.$O:
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/ktb_list.c
$(BLD_TOP)Programs/ktb_list.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/ktb_list.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/ktb_internal.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/ktb_list.$O: $(SRC_TOP)Programs/ktb_inspect.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ktb_translate.$O:
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/ktb_translate.c
$(BLD_TOP)Programs/ktb_translate.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/ktb_internal.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/ktb_inspect.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/ktb_translate.$O: $(SRC_TOP)Programs/driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ktbtest.$O:
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ktbtest.c
$(BLD_TOP)Programs/ktbtest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ktb_keyboard.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/ktbtest.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/ktbtest.$O: $(SRC_TOP)Programs/message.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/lock.$O:
$(BLD_TOP)Programs/lock.$O: $(SRC_TOP)Programs/lock.c
$(BLD_TOP)Programs/lock.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/lock.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/lock.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/lock.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Programs/lock.$O: $(SRC_TOP)Programs/lock.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/log.$O:
$(BLD_TOP)Programs/log.$O: $(SRC_TOP)Programs/log.c
$(BLD_TOP)Programs/log.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/log.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/log.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/main.$O:
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/main.c
$(BLD_TOP)Programs/main.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/embed.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/main.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/main.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/midi.$O:
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/midi.c
$(BLD_TOP)Programs/midi.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/midi.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/midi.$O: $(SRC_TOP)Programs/notes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/misc.$O:
$(BLD_TOP)Programs/misc.$O: $(SRC_TOP)Programs/misc.c
$(BLD_TOP)Programs/misc.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/misc.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/misc.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/misc.$O: $(SRC_TOP)Programs/log.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/mount.$O:
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/mount.c
$(BLD_TOP)Programs/mount.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/async.h
$(BLD_TOP)Programs/mount.$O: $(SRC_TOP)Programs/mount.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/options.$O:
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/options.c
$(BLD_TOP)Programs/options.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/options.$O: $(SRC_TOP)Programs/system.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/parse.$O:
$(BLD_TOP)Programs/parse.$O: $(SRC_TOP)Programs/parse.c
$(BLD_TOP)Programs/parse.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/parse.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/parse.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/parse.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/parse.$O: $(SRC_TOP)Programs/misc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/pcm.$O:
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/pcm.c
$(BLD_TOP)Programs/pcm.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/pcm.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/pcm.$O: $(SRC_TOP)Programs/notes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/pid.$O:
$(BLD_TOP)Programs/pid.$O: $(SRC_TOP)Programs/pid.c
$(BLD_TOP)Programs/pid.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/pid.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/pid.$O: $(SRC_TOP)Programs/pid.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/program.$O:
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/program.c
$(BLD_TOP)Programs/program.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/program.$O: $(SRC_TOP)Programs/sys_windows.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/queue.$O:
$(BLD_TOP)Programs/queue.$O: $(SRC_TOP)Programs/queue.c
$(BLD_TOP)Programs/queue.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/queue.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/queue.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/queue.$O: $(SRC_TOP)Programs/queue.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/routing.$O:
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/routing.c
$(BLD_TOP)Programs/routing.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/routing.$O: $(SRC_TOP)Programs/routing.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scancodes.$O:
$(BLD_TOP)Programs/scancodes.$O: $(SRC_TOP)Programs/scancodes.c
$(BLD_TOP)Programs/scancodes.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scancodes.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scancodes.$O: $(SRC_TOP)Programs/scancodes.h
$(BLD_TOP)Programs/scancodes.$O: $(SRC_TOP)Programs/brldefs.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr.$O:
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr.c
$(BLD_TOP)Programs/scr.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/drivers.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_frozen.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_help.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_real.h
$(BLD_TOP)Programs/scr.$O: $(BLD_TOP)Programs/scr.auto.h
$(BLD_TOP)Programs/scr.$O: $(SRC_TOP)Programs/scr_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr_base.$O:
$(BLD_TOP)Programs/scr_base.$O: $(SRC_TOP)Programs/scr_base.c
$(BLD_TOP)Programs/scr_base.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr_base.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr_base.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr_base.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr_base.$O: $(SRC_TOP)Programs/scr_base.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr_frozen.$O:
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/scr_frozen.c
$(BLD_TOP)Programs/scr_frozen.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Programs/scr_frozen.$O: $(SRC_TOP)Programs/scr_frozen.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr_help.$O:
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/scr_help.c
$(BLD_TOP)Programs/scr_help.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Programs/scr_help.$O: $(SRC_TOP)Programs/scr_help.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr_main.$O:
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)Programs/scr_main.c
$(BLD_TOP)Programs/scr_main.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Programs/scr_main.$O: $(SRC_TOP)Programs/scr_main.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scr_real.$O:
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/scr_real.c
$(BLD_TOP)Programs/scr_real.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/async.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/scr_base.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/scr_main.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/scr_real.h
$(BLD_TOP)Programs/scr_real.$O: $(SRC_TOP)Programs/routing.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/scrtest.$O:
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/scrtest.c
$(BLD_TOP)Programs/scrtest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/scrtest.$O: $(SRC_TOP)Programs/scr.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/serial.$O:
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/serial.c
$(BLD_TOP)Programs/serial.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/win_pthread.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/io_serial.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/serial.$O: $(SRC_TOP)Programs/parse.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ses.$O:
$(BLD_TOP)Programs/ses.$O: $(SRC_TOP)Programs/ses.c
$(BLD_TOP)Programs/ses.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ses.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ses.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/ses.$O: $(SRC_TOP)Programs/defaults.h
$(BLD_TOP)Programs/ses.$O: $(SRC_TOP)Programs/misc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/spk.$O:
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/spk.c
$(BLD_TOP)Programs/spk.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/drivers.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/spk.$O: $(BLD_TOP)Programs/spk.auto.h
$(BLD_TOP)Programs/spk.$O: $(SRC_TOP)Programs/spk_driver.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/spktest.$O:
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/spktest.c
$(BLD_TOP)Programs/spktest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/spktest.$O: $(SRC_TOP)Programs/parse.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/status.$O:
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/status.c
$(BLD_TOP)Programs/status.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/statdefs.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/status.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/status.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/status.$O: $(SRC_TOP)Programs/ttb.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_darwin.$O:
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_darwin.c
$(BLD_TOP)Programs/sys_darwin.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_shlib_dyld.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_midi_darwin.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/sys_darwin.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_freebsd.$O:
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_freebsd.c
$(BLD_TOP)Programs/sys_freebsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_beep_spkr.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_pcm_oss.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_freebsd.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_hpux.$O:
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_hpux.c
$(BLD_TOP)Programs/sys_hpux.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_hpux.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_hurd.$O:
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_hurd.c
$(BLD_TOP)Programs/sys_hurd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_hurd.$O: $(SRC_TOP)Programs/sys_ports_glibc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_kfreebsd.$O:
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_kfreebsd.c
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_beep_spkr.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_pcm_oss.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_kfreebsd.$O: $(SRC_TOP)Programs/sys_ports_kfreebsd.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_linux.$O:
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_linux.c
$(BLD_TOP)Programs/sys_linux.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_linux.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_mount_linux.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_beep_linux.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_pcm_alsa.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_pcm_oss.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_midi_oss.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_midi_alsa.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_linux.$O: $(SRC_TOP)Programs/sys_ports_glibc.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_msdos.$O:
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_msdos.c
$(BLD_TOP)Programs/sys_msdos.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_exec_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_shlib_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_beep_msdos.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_ports_always.h
$(BLD_TOP)Programs/sys_msdos.$O: $(SRC_TOP)Programs/sys_ports_x86.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_netbsd.$O:
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_netbsd.c
$(BLD_TOP)Programs/sys_netbsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_beep_wskbd.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_pcm_audio.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_netbsd.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_openbsd.$O:
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_openbsd.c
$(BLD_TOP)Programs/sys_openbsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_beep_wskbd.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_pcm_audio.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_openbsd.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_osf.$O:
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_osf.c
$(BLD_TOP)Programs/sys_osf.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_osf.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_qnx.$O:
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_qnx.c
$(BLD_TOP)Programs/sys_qnx.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_pcm_qsa.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_qnx.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_skeleton.$O:
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_skeleton.c
$(BLD_TOP)Programs/sys_skeleton.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_prog_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_exec_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_shlib_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_pcm_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_skeleton.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_solaris.$O:
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_solaris.c
$(BLD_TOP)Programs/sys_solaris.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_pcm_audio.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_midi_none.h
$(BLD_TOP)Programs/sys_solaris.$O: $(SRC_TOP)Programs/sys_ports_none.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/sys_windows.$O:
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_windows.c
$(BLD_TOP)Programs/sys_windows.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_prog_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_boot_none.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_mount_none.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_beep_none.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_beep_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_ports_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_ports_x86.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_exec_unix.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_shlib_dlfcn.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/io_misc.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_pcm_oss.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_midi_oss.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_exec_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_shlib_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_pcm_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/sys_midi_windows.h
$(BLD_TOP)Programs/sys_windows.$O: $(SRC_TOP)Programs/win_errno.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/tbl2hex.$O:
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/tbl2hex.c
$(BLD_TOP)Programs/tbl2hex.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/atb.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/atb_internal.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/tbl2hex.$O: $(SRC_TOP)Programs/ctb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/timing.$O:
$(BLD_TOP)Programs/timing.$O: $(SRC_TOP)Programs/timing.c
$(BLD_TOP)Programs/timing.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/timing.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/timing.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/timing.$O: $(SRC_TOP)Programs/sys_msdos.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/touch.$O:
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/touch.c
$(BLD_TOP)Programs/touch.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/touch.h
$(BLD_TOP)Programs/touch.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/touch.$O: $(SRC_TOP)Programs/spk.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttb_compile.$O:
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/ttb_compile.c
$(BLD_TOP)Programs/ttb_compile.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/dataarea.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttb_compile.$O: $(SRC_TOP)Programs/ttb_compile.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttb_gnome.$O:
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/ttb_gnome.c
$(BLD_TOP)Programs/ttb_gnome.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ttb_gnome.$O: $(SRC_TOP)Programs/ttb_compile.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttb_louis.$O:
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/ttb_louis.c
$(BLD_TOP)Programs/ttb_louis.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ttb_louis.$O: $(SRC_TOP)Programs/ttb_compile.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttb_native.$O:
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/ttb_native.c
$(BLD_TOP)Programs/ttb_native.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ttb_native.$O: $(SRC_TOP)Programs/ttb_compile.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttb_translate.$O:
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/ttb_translate.c
$(BLD_TOP)Programs/ttb_translate.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttb_translate.$O: $(SRC_TOP)Programs/brldots.h
$(BLD_TOP)Programs/ttb_translate.$O: $(BLD_TOP)Programs/text.auto.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/ttbtest.$O:
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/ttbtest.c
$(BLD_TOP)Programs/ttbtest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/pid.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/program.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/brldots.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/charset.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/lock.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/ttb.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/bitmask.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/ttb_internal.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/datafile.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/ttb_compile.h
$(BLD_TOP)Programs/ttbtest.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Programs/ttbtest.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/ttbtest.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/tunes.$O:
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/tunes.c
$(BLD_TOP)Programs/tunes.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/system.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/message.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/tunes.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/tunes.$O: $(SRC_TOP)Programs/notes.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/tunetest.$O:
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/tunetest.c
$(BLD_TOP)Programs/tunetest.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/options.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/tunes.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/defaults.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/brl.h
$(BLD_TOP)Programs/tunetest.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/brldefs.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/brltty.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/cmd.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/ctb.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/driver.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/ktb.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/ktbdefs.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/scr.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/ses.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/spk.h
$(BLD_TOP)Programs/tunetest.$O: $(SRC_TOP)Programs/message.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/unicode.$O:
$(BLD_TOP)Programs/unicode.$O: $(SRC_TOP)Programs/unicode.c
$(BLD_TOP)Programs/unicode.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/unicode.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/unicode.$O: $(SRC_TOP)Programs/unicode.h
$(BLD_TOP)Programs/unicode.$O: $(SRC_TOP)Programs/ascii.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb.$O:
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/usb.c
$(BLD_TOP)Programs/usb.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/device.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_darwin.$O:
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/usb_darwin.c
$(BLD_TOP)Programs/usb_darwin.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_darwin.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_freebsd.$O:
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/usb_freebsd.c
$(BLD_TOP)Programs/usb_freebsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/usb_internal.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_freebsd.$O: $(SRC_TOP)Programs/usb_bsd.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_kfreebsd.$O:
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/usb_kfreebsd.c
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/usb_internal.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_kfreebsd.$O: $(SRC_TOP)Programs/usb_bsd.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_libusb-1.0.$O:
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/usb_libusb-1.0.c
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_libusb-1.0.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_libusb.$O:
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/usb_libusb.c
$(BLD_TOP)Programs/usb_libusb.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_libusb.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_linux.$O:
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/usb_linux.c
$(BLD_TOP)Programs/usb_linux.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/file.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/parse.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/timing.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/misc.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/mount.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_linux.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_netbsd.$O:
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/usb_netbsd.c
$(BLD_TOP)Programs/usb_netbsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/usb_internal.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_netbsd.$O: $(SRC_TOP)Programs/usb_bsd.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_none.$O:
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/usb_none.c
$(BLD_TOP)Programs/usb_none.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_none.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_openbsd.$O:
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/usb_openbsd.c
$(BLD_TOP)Programs/usb_openbsd.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/usb_internal.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_openbsd.$O: $(SRC_TOP)Programs/usb_bsd.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/usb_solaris.$O:
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/usb_solaris.c
$(BLD_TOP)Programs/usb_solaris.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/log.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/io_defs.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/io_usb.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/bitfield.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/queue.h
$(BLD_TOP)Programs/usb_solaris.$O: $(SRC_TOP)Programs/usb_internal.h
	cd $(@D) && $(MAKE) $(@F)

# Dependencies for Programs/xbrlapi.$O:
$(BLD_TOP)Programs/xbrlapi.$O: $(SRC_TOP)Programs/xbrlapi.c
$(BLD_TOP)Programs/xbrlapi.$O: $(BLD_TOP)config.h
$(BLD_TOP)Programs/xbrlapi.$O: $(SRC_TOP)prologue.h
$(BLD_TOP)Programs/xbrlapi.$O: $(BLD_TOP)Programs/brlapi.h
$(BLD_TOP)Programs/xbrlapi.$O: $(BLD_TOP)Programs/brlapi_constants.h
$(BLD_TOP)Programs/xbrlapi.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
$(BLD_TOP)Programs/xbrlapi.$O: $(SRC_TOP)Programs/options.h
	cd $(@D) && $(MAKE) $(@F)

# Generated dependencies:
$(BLD_TOP)Programs/attr.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/brl.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/brlapi_constants.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/brlapi_keytab.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/cmds.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/scr.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/spk.auto.h:
	cd $(@D) && $(MAKE) $(@F)
$(BLD_TOP)Programs/text.auto.h:
	cd $(@D) && $(MAKE) $(@F)

