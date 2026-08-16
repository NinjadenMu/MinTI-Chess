# ----------------------------
# Makefile Options
# ----------------------------

NAME = MINTI
#ICON = icon.png
DESCRIPTION = "MinTI Chess - The world's strongest TI-84 Plus CE chess engine"
COMPRESSED = YES

CFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer
CXXFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer

SRCDIR := src/engine
GFXDIR := src/ce/gfx

EXTRA_C_SOURCES := \
	$(wildcard src/ce/*.c) \
	$(wildcard src/ce/gfx/*.c) \
	$(wildcard src/test/*.c)

# ----------------------------

include $(shell cedev-config --makefile)
