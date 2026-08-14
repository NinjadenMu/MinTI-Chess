# ----------------------------
# Makefile Options
# ----------------------------

NAME = MINTI
#ICON = icon.png
DESCRIPTION = "MinTI Chess - The world's strongest TI-84 Plus CE chess engine"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer
CXXFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer

SRCDIR := src/engine

EXTRA_C_SOURCES := \
	src/main.c \
	$(wildcard src/ce/*.c) \
	$(wildcard src/test/*.c)

# ----------------------------

include $(shell cedev-config --makefile)
