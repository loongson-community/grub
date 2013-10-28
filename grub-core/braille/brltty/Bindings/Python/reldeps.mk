# Dependencies for bindings.$O:
bindings.$O: $(SRC_DIR)/bindings.c
bindings.$O: $(BLD_TOP)Programs/brlapi.h
bindings.$O: $(BLD_TOP)Programs/brlapi_constants.h
bindings.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
bindings.$O: $(SRC_TOP)Programs/timing.h
bindings.$O: $(SRC_TOP)Programs/win_pthread.h
bindings.$O: $(BLD_TOP)config.h
bindings.$O: $(SRC_TOP)prologue.h
bindings.$O: $(SRC_TOP)Programs/win_errno.h
bindings.$O: $(SRC_DIR)/bindings.h

