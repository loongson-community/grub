# Dependencies for test.$O:
test.$O: $(SRC_DIR)/test.c
test.$O: $(SRC_DIR)/webrloem.h

# Dependencies for webrloem.$O:
webrloem.$O: $(SRC_DIR)/webrloem.c
webrloem.$O: $(BLD_TOP)Programs/brlapi.h
webrloem.$O: $(BLD_TOP)Programs/brlapi_constants.h
webrloem.$O: $(SRC_TOP)Programs/brlapi_keycodes.h
webrloem.$O: $(SRC_DIR)/webrloem.h

