# ----------------------------
# Makefile Options
# ----------------------------

NAME = MINTI
#ICON = icon.png
DESCRIPTION = "MinTI Chess - The world's strongest TI-84 Plus CE chess engine"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer
CXXFLAGS = -Wall -Wextra -O3 -fno-omit-frame-pointer

# ----------------------------

include $(shell cedev-config --makefile)
