/**
 * @file memory_map.h
 * 
 * Maps VRAM addresses to MinTI objects
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
 * For example, consider loading a byte from an aligned struct with its base 
 * address in 24-bit register `hl`.
 * 
 * 256-byte alignment allows for:
 *  LD l, <offset>;
 *  LD a, (hl)
 * since L addresses the lower 8-bits of `hl`.
 * 
 * Alignment is the primary reason for placing these addresses in VRAM.  
 * Placing them in .bss might result in the base addresses moving when 
 * more globals are declared.
 */
#define CE_ADDR_BOARD                    0xD53000u
#define CE_ADDR_PIECE_LIST               0xD53100u
#define CE_ADDR_PIECE_COUNT              0xD53120u
#define CE_ADDR_KING_SQUARE              0xD53122u
#define CE_ADDR_SIDE                     0xD53124u
#define CE_ADDR_CASTLING                 0xD53125u
#define CE_ADDR_EP_SQUARE                0xD53126u
#define CE_ADDR_HALFMOVE                 0xD53127u

#define CE_ADDR_EVAL_SCORE               0xD53128u
#define CE_ADDR_EVAL_PAWN_KING_SCORE     0xD5312Eu
#define CE_ADDR_NONPAWN_MATERIAL         0xD5313Au
#define CE_ADDR_PAWN_FILE_COUNT          0xD53140u
#define CE_ADDR_BISHOP_COUNT             0xD53150u
#define CE_ADDR_ROOK_FILE_COUNT          0xD53152u
#define CE_ADDR_HASH_KEY                 0xD53162u

#define CE_ADDR_PIECE_INDEX              0xD53200u

#define CE_ADDR_DELTA_ATTACKERS          0xD53300u
#define CE_ADDR_DELTA_STEP               0xD53400u

#define CE_ADDR_PST_PAWN_OPENING         0xD53500u
#define CE_ADDR_PST_PAWN_ENDGAME         0xD53600u
#define CE_ADDR_PST_KNIGHT               0xD53700u
#define CE_ADDR_PST_BISHOP               0xD53800u
#define CE_ADDR_PST_ROOK                 0xD53900u
#define CE_ADDR_PST_QUEEN                0xD53A00u
#define CE_ADDR_PST_KING_OPENING         0xD53B00u
#define CE_ADDR_PST_KING_ENDGAME         0xD53C00u

#define CE_ADDR_TRANSPOSITION_TABLE       0xD54000u
#define CE_SIZE_TRANSPOSITION_TABLE       0x010000u

#define CE_ADDR_HISTORY                   0xD64000u
#define CE_SIZE_HISTORY                   0x001000u

#define BOARD \
  ((uint8_t *)CE_ADDR_BOARD)

#define PIECE_LIST \
  ((uint8_t (*)[16])CE_ADDR_PIECE_LIST)

#define PIECE_COUNT \
  ((uint8_t *)CE_ADDR_PIECE_COUNT)

#define POSITION_KING_SQUARE \
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

#define EVAL_SCORE \
  ((uint24_t *)CE_ADDR_EVAL_SCORE)

// index with phase then color
#define EVAL_PAWN_KING_SCORE \
  ((uint24_t (*)[2])CE_ADDR_EVAL_PAWN_KING_SCORE)

#define EVAL_NONPAWN_MATERIAL \
  ((uint24_t *)CE_ADDR_NONPAWN_MATERIAL)

// index by color, then file (0-8 = a-h)
#define EVAL_PAWN_FILE_COUNT \
  ((uint8_t (*)[8])CE_ADDR_PAWN_FILE_COUNT)

#define EVAL_BISHOP_COUNT \
  ((uint8_t *)CE_ADDR_BISHOP_COUNT)

#define EVAL_ROOK_FILE_COUNT \
  ((uint8_t (*)[8])CE_ADDR_ROOK_FILE_COUNT)

#define EVAL_PST_PAWN_OPENING \
  ((uint8_t *)CE_ADDR_PST_PAWN_OPENING)

#define EVAL_PST_PAWN_ENDGAME \
  ((uint8_t *)CE_ADDR_PST_PAWN_ENDGAME)

#define EVAL_PST_KNIGHT \
  ((uint8_t *)CE_ADDR_PST_KNIGHT)

#define EVAL_PST_BISHOP \
  ((uint8_t *)CE_ADDR_PST_BISHOP)

#define EVAL_PST_ROOK \
  ((uint8_t *)CE_ADDR_PST_ROOK)

#define EVAL_PST_QUEEN \
  ((uint8_t *)CE_ADDR_PST_QUEEN)

#define EVAL_PST_KING_OPENING \
  ((uint8_t *)CE_ADDR_PST_KING_OPENING)

#define EVAL_PST_KING_ENDGAME \
  ((uint8_t *)CE_ADDR_PST_KING_ENDGAME)

#define HISTORY \
  ((uint8_t (*)[256])CE_ADDR_HISTORY)

#endif
