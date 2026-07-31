/**
 * @file memory_map.h
 * 
 * Maps regions of memory for MinTI
 * 
 * The TI-84 Plus CE is physically addressed.
 * 
 * The C/C++ CE Toolchain repurposes unused OS workspaces as follows:
 *   Stack: 0xD1987F to 0xD1A87E (~4 KiB)
 *   .code + .data + .rodata: 0xD1A87F to 0xD2A87E (~64 KiB)
 *   .bss + heap: 0xD052C6 to 0xD13FD7 (~60 KiB)
 * 
 * However, MinTI uses graphx to enter 8-bpp mode, which exposes 2 frame 
 * buffers.  By only ever using one frame buffer, MinTI can use half of the 
 * VRAM however it wants (such as for transposition tables).  On the 
 * TI-84 Plus CE, VRAM behaves just like ordinary RAM, including having the 
 * same access timing.
 * Thus, MinTI also uses VRAM addresses 0xD52C00 to 0xD657FF (76800 bytes).
 */

#ifndef MINTI_CE_MEMORY_MAP_H
#define MINTI_CE_MEMORY_MAP_H

#include <stdint.h>

/*
 * It's desirable for commonly used base addresses like `CE_ADDR_BOARD` to be 
 * 256-byte aligned, since it allows for loading offset addresses by setting 
 * the lower 8 bits instead of doing 24-bit addition.  
 * 
 * For example, consider loading a byte from a aligned struct with its base 
 * address in 24-bit register HL.
 * 
 * 256-byte alignment allows for:
 *  LD L, <offset>;
 *  LD a, (HL)
 * since L addresses the lower 8-bits of HL.
 * 
 * Alignment is the primary reason for placing these addresses in VRAM.  
 * Placing them in .bss might result in the base addresses moving when 
 * more globals are declared.
 */
#define CE_ADDR_BOARD            0xD53000u
#define CE_ADDR_PIECE_LIST       0xD53100u
#define CE_ADDR_PIECE_COUNT      0xD53120u
#define CE_ADDR_KING_SQUARE      0xD53122u
#define CE_ADDR_SIDE             0xD53124u
#define CE_ADDR_CASTLING         0xD53125u
#define CE_ADDR_EP_SQUARE        0xD53126u
#define CE_ADDR_HALFMOVE         0xD53127u
#define CE_ADDR_PIECE_INDEX      0xD53180u
#define CE_ADDR_DELTA_ATTACKERS  0xD53200u
#define CE_ADDR_DELTA_STEP       0xD53300u

#define BOARD \
  ((uint8_t *)CE_ADDR_BOARD)

#define PIECE_LIST \
  ((uint8_t (*)[16])CE_ADDR_PIECE_LIST)

#define PIECE_COUNT \
  ((uint8_t *)CE_ADDR_PIECE_COUNT)

#define KING_SQUARE \
  ((uint8_t *)CE_ADDR_KING_SQUARE)

#define POSITION_SIDE \
  (*(uint8_t *)CE_ADDR_SIDE)

#define POSITION_CASTLING \
  (*(uint8_t *)CE_ADDR_CASTLING)

#define POSITION_EP_SQUARE \
  (*(uint8_t *)CE_ADDR_EP_SQUARE)

#define POSITION_HALFMOVE \
  (*(uint8_t *)CE_ADDR_HALFMOVE)

#define PIECE_INDEX \
   ((uint8_t *)CE_ADDR_PIECE_INDEX)

#define DELTA_ATTACKERS \
  ((uint8_t *)CE_ADDR_DELTA_ATTACKERS)

#define DELTA_STEP \
  ((int8_t *)CE_ADDR_DELTA_STEP)

#endif
