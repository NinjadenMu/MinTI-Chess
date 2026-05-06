# ----------------------------
# Makefile Options
# ----------------------------

NAME = MINTI
# ICON = icon.png
DESCRIPTION = "MinTI-Chess is a strong chess engine written for the TI-84 Plus CE"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -Os
CXXFLAGS = -Wall -Wextra -Os

LTO = YES

# ----------------------------

include $(shell cedev-config --makefile)
