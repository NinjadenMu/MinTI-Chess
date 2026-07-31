# ----------------------------
# Makefile Options
# ----------------------------

NAME = DEMO
#ICON = icon.png
DESCRIPTION = "MinTI Chess - The world's strongest TI-84 Plus CE chess engine"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -O3
CXXFLAGS = -Wall -Wextra -O3

# ----------------------------

include $(shell cedev-config --makefile)
