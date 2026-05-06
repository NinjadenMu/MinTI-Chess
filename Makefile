# ----------------------------
# Makefile Options
# ----------------------------

NAME = MINTI
# ICON = icon.png
DESCRIPTION = "MinTI-Chess is a strong chess engine written for the TI-84 Plus CE"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -Os -save-temps
CXXFLAGS = -Wall -Wextra -Os -save-temps

LTO = NO

# ----------------------------

include $(shell cedev-config --makefile)
