HOST_CC ?= clang

HOST_BUILD_DIR := build/host
HOST_PROGRAM := $(HOST_BUILD_DIR)/minti-host

HOST_SYSTEM := $(shell uname -s)

ifeq ($(HOST_SYSTEM),Darwin)
HOST_LIBRARY := $(HOST_BUILD_DIR)/libminti.dylib
HOST_SHARED_LDFLAGS := -dynamiclib
else
HOST_LIBRARY := $(HOST_BUILD_DIR)/libminti.so
HOST_SHARED_LDFLAGS := -shared
endif

ENGINE_SOURCES := $(wildcard src/engine/*.c)

HOST_COMMON_SOURCES := \
	$(ENGINE_SOURCES) \
	src/host/memory_map.c

HOST_PROGRAM_SOURCES := \
	$(HOST_COMMON_SOURCES) \
	src/host/main.c \
	src/host/game.c

HOST_LIBRARY_SOURCES := \
	$(HOST_COMMON_SOURCES) \
	src/host/tuning_api.c

HOST_PROGRAM_OBJECTS := \
	$(patsubst %.c,$(HOST_BUILD_DIR)/%.o,$(HOST_PROGRAM_SOURCES))

HOST_LIBRARY_OBJECTS := \
	$(patsubst %.c,$(HOST_BUILD_DIR)/%.o,$(HOST_LIBRARY_SOURCES))

HOST_DEPENDENCIES := \
	$(HOST_PROGRAM_OBJECTS:.o=.d) \
	$(HOST_LIBRARY_OBJECTS:.o=.d)

HOST_CPPFLAGS := \
	-DMINTI_HOST=1 \
	-Isrc \
	-Isrc/host \
	-include src/host/compat.h

HOST_CFLAGS ?= \
	-std=c17 \
	-O3 \
	-Wall \
	-Wextra \
	-Wpedantic \
	-fno-strict-aliasing \
	-fno-omit-frame-pointer

HOST_CFLAGS += -fPIC
HOST_DEPFLAGS := -MMD -MP

$(HOST_PROGRAM): $(HOST_PROGRAM_OBJECTS)
	@mkdir -p $(dir $@)
	$(HOST_CC) $(HOST_PROGRAM_OBJECTS) -o $@

$(HOST_LIBRARY): $(HOST_LIBRARY_OBJECTS)
	@mkdir -p $(dir $@)
	$(HOST_CC) \
		$(HOST_SHARED_LDFLAGS) \
		$(HOST_LIBRARY_OBJECTS) \
		-o $@

$(HOST_BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(HOST_CC) \
		$(HOST_CPPFLAGS) \
		$(HOST_CFLAGS) \
		$(HOST_DEPFLAGS) \
		-c $< \
		-o $@

.PHONY: all library clean

all: $(HOST_PROGRAM) $(HOST_LIBRARY)

library: $(HOST_LIBRARY)

clean:
	rm -rf $(HOST_BUILD_DIR)

-include $(HOST_DEPENDENCIES)
