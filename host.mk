HOST_CC ?= clang

HOST_BUILD_DIR := build/host
HOST_PROGRAM := $(HOST_BUILD_DIR)/minti-host

ENGINE_SOURCES := $(wildcard src/engine/*.c)

HOST_SOURCES := \
	$(ENGINE_SOURCES) \
	src/host/memory_map.c \
	src/host/main.c

HOST_OBJECTS := \
	$(patsubst %.c,$(HOST_BUILD_DIR)/%.o,$(HOST_SOURCES))

HOST_DEPENDENCIES := $(HOST_OBJECTS:.o=.d)

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

HOST_DEPFLAGS := -MMD -MP

$(HOST_PROGRAM): $(HOST_OBJECTS)
	@mkdir -p $(dir $@)
	$(HOST_CC) $(HOST_OBJECTS) -o $@

$(HOST_BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(HOST_CC) \
		$(HOST_CPPFLAGS) \
		$(HOST_CFLAGS) \
		$(HOST_DEPFLAGS) \
		-c $< \
		-o $@

.PHONY: all clean

all: $(HOST_PROGRAM)

clean:
	rm -rf $(HOST_BUILD_DIR)
