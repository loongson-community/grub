# Dependencies for bindings.$O:
bindings.$O: $(SRC_DIR)/bindings.c
bindings.$O: $(SRC_TOP)Programs/brldots.h
bindings.$O: $(BLD_TOP)Programs/brlapi.h
bindings.$O: $(BLD_TOP)Programs/brlapi_constants.h
bindings.$O: $(SRC_TOP)Programs/brlapi_keycodes.h

