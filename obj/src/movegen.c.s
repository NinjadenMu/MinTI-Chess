	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"movegen.c"
	.file	0 "/Users/jaden/dev/calculator/MinTI-Chess" "src/movegen.c" md5 0xde721be43b78836da72bd0dc15afa572
	.file	1 "/Users/jaden" "CEdev/include/stdint.h" md5 0x514a81b7075971c9534583a6bab7ed1e
	.file	2 "src" "types.h" md5 0x86011f1c28fd60f480912c46c6880d62
	.file	3 "src" "movegen.h" md5 0x772cd4cc402443888be5ea1b2853422a
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
	.local	.Lfunc_begin0
.Lfunc_begin0:
	.loc	0 138 0                         ; src/movegen.c:138:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -952
	add	hl, sp
	ld	sp, hl
	or	a, a
	sbc	hl, hl
	ld	bc, -178
	lea	iy, ix + 0
	add	iy, bc
	lea	de, iy + 0
	ld	bc, -949
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 50
	lea	bc, iy + 0
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 56
	ld	(iy + 0), bc
	ld	(ix - 9), hl
	.local	.Ltmp0
.Ltmp0:
	.loc	0 142 3 prologue_end            ; src/movegen.c:142:3
	push	bc
	or	a, a
	sbc	hl, hl
	push	hl
	push	de
	call	_generate_pawn_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 143 3                         ; src/movegen.c:143:3
	ld	de, -952
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -949
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_generate_knight_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 144 3                         ; src/movegen.c:144:3
	ld	de, -952
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -949
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_generate_bishop_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 145 3                         ; src/movegen.c:145:3
	ld	de, -952
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -949
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_generate_rook_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 146 3                         ; src/movegen.c:146:3
	ld	de, -952
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -949
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_generate_queen_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 147 3                         ; src/movegen.c:147:3
	ld	de, -952
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -949
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_generate_king_captures
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	0 149 3                         ; src/movegen.c:149:3
	or	a, a
	sbc	hl, hl
	.loc	0 149 3 epilogue_begin is_stmt 0 ; src/movegen.c:149:3
	ld	iy, 952
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp1
.Ltmp1:
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_main, .Lfunc_end0-_main
                                        ; -- End function
	.section	.text._generate_pawn_captures,"ax",@progbits
	.type	_generate_pawn_captures,@function ; -- Begin function generate_pawn_captures
_generate_pawn_captures:                ; @generate_pawn_captures
	.local	.Lfunc_begin1
.Lfunc_begin1:
	.loc	0 55 0 is_stmt 1                ; src/movegen.c:55:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -45
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	bc, (ix + 12)
	ld	de, 0
	ld	iy, _b_pawn_capture_offsets
	ld	(ix - 33), hl
	ld	(ix - 34), a
	ld	(ix - 37), bc
	.local	.Ltmp2
.Ltmp2:
	.loc	0 56 20 prologue_end            ; src/movegen.c:56:20
	ld	hl, (ix - 33)
	ld	bc, 160
	.loc	0 56 27 is_stmt 0               ; src/movegen.c:56:27
	add	hl, bc
	ld	hl, (hl)
	.loc	0 56 9                          ; src/movegen.c:56:9
	ld	(ix - 40), hl
	.local	.Ltmp3
.Ltmp3:
	.loc	0 58 12 is_stmt 1               ; src/movegen.c:58:12
	ld	(ix - 44), de
	.loc	0 58 8 is_stmt 0                ; src/movegen.c:58:8
	jr	.LBB1_1
	.local	.LBB1_1
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp4
.Ltmp4:
	.loc	0 58 19                         ; src/movegen.c:58:19
	ld	hl, (ix - 44)
	.local	.Ltmp5
.Ltmp5:
	.loc	0 58 3                          ; src/movegen.c:58:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388606
	or	a, a
	sbc	hl, de
	jp	nc, .LBB1_23
	jr	.LBB1_2
	.local	.LBB1_2
.LBB1_2:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp6
.Ltmp6:
	.loc	0 59 9 is_stmt 1                ; src/movegen.c:59:9
	ld	hl, (ix - 40)
	.local	.Ltmp7
.Ltmp7:
	.loc	0 59 9 is_stmt 0                ; src/movegen.c:59:9
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB1_4
	jr	.LBB1_3
	.local	.LBB1_3
.LBB1_3:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp8
.Ltmp8:
	.loc	0 59 37                         ; src/movegen.c:59:37
	ld	a, (ix - 34)
	.loc	0 59 69                         ; src/movegen.c:59:69
	ld	de, (ix - 44)
	.loc	0 59 46                         ; src/movegen.c:59:46
	ld	hl, _w_pawn_capture_offsets
	add	hl, de
	ld	l, (hl)
	.loc	0 59 44                         ; src/movegen.c:59:44
	add	a, l
	ld	l, a
	.loc	0 59 35                         ; src/movegen.c:59:35
	ld	(ix - 41), l
	.loc	0 59 28                         ; src/movegen.c:59:28
	jr	.LBB1_5
	.local	.LBB1_4
.LBB1_4:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 60 19 is_stmt 1               ; src/movegen.c:60:19
	ld	a, (ix - 34)
	.loc	0 60 51 is_stmt 0               ; src/movegen.c:60:51
	ld	de, (ix - 44)
	.loc	0 60 28                         ; src/movegen.c:60:28
	lea	hl, iy + 0
	add	hl, de
	ld	l, (hl)
	.loc	0 60 26                         ; src/movegen.c:60:26
	add	a, l
	ld	l, a
	.loc	0 60 17                         ; src/movegen.c:60:17
	ld	(ix - 41), l
	jr	.LBB1_5
	.local	.Ltmp9
.Ltmp9:
	.local	.LBB1_5
.LBB1_5:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 62 10 is_stmt 1               ; src/movegen.c:62:10
	ld	a, (ix - 41)
	ld	l, -120
	and	a, l
	ld	l, a
	.local	.Ltmp10
.Ltmp10:
	.loc	0 62 9 is_stmt 0                ; src/movegen.c:62:9
	ld	a, l
	or	a, a
	jp	nz, .LBB1_21
	jr	.LBB1_6
	.local	.LBB1_6
.LBB1_6:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp11
.Ltmp11:
	.loc	0 63 11 is_stmt 1               ; src/movegen.c:63:11
	ld	a, (ix - 41)
	.loc	0 63 21 is_stmt 0               ; src/movegen.c:63:21
	ld	hl, (ix - 33)
	ld	de, 163
	.loc	0 63 28                         ; src/movegen.c:63:28
	add	hl, de
	ld	l, (hl)
	.loc	0 63 46                         ; src/movegen.c:63:46
	cp	a, l
	jr	nz, .LBB1_9
	jr	.LBB1_7
	.local	.LBB1_7
.LBB1_7:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 63 49                         ; src/movegen.c:63:49
	ld	hl, (ix - 33)
	ld	de, 164
	.loc	0 63 56                         ; src/movegen.c:63:56
	add	hl, de
	ld	a, (hl)
	.local	.Ltmp12
.Ltmp12:
	.loc	0 63 11                         ; src/movegen.c:63:11
	bit	0, a
	jr	z, .LBB1_9
	jr	.LBB1_8
	.local	.LBB1_8
.LBB1_8:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp13
.Ltmp13:
	.loc	0 64 36 is_stmt 1               ; src/movegen.c:64:36
	ld	a, (ix - 34)
	.loc	0 64 44 is_stmt 0               ; src/movegen.c:64:44
	ld	l, (ix - 41)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 3), 8
	.local	.Ltmp14
.Ltmp14:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 1)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 2)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 3)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp15
.Ltmp15:
	.loc	0 64 19 is_stmt 1               ; src/movegen.c:64:19
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 64 22 is_stmt 0               ; src/movegen.c:64:22
	ld	(iy), hl
	ld	iy, _b_pawn_capture_offsets
	.loc	0 65 7 is_stmt 1                ; src/movegen.c:65:7
	jp	.LBB1_20
	.local	.Ltmp16
.Ltmp16:
	.local	.LBB1_9
.LBB1_9:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 68 30                         ; src/movegen.c:68:30
	ld	hl, (ix - 33)
	.loc	0 68 43 is_stmt 0               ; src/movegen.c:68:43
	ld	a, (ix - 41)
	.loc	0 68 30                         ; src/movegen.c:68:30
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 68 15                         ; src/movegen.c:68:15
	ld	(ix - 45), a
	.local	.Ltmp17
.Ltmp17:
	.loc	0 69 13 is_stmt 1               ; src/movegen.c:69:13
	ld	a, (ix - 45)
	.local	.Ltmp18
.Ltmp18:
	.loc	0 69 13 is_stmt 0               ; src/movegen.c:69:13
	or	a, a
	jp	z, .LBB1_19
	jr	.LBB1_10
	.local	.LBB1_10
.LBB1_10:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp19
.Ltmp19:
	.loc	0 70 15 is_stmt 1               ; src/movegen.c:70:15
	ld	a, (ix - 45)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 70 42 is_stmt 0               ; src/movegen.c:70:42
	ld	iy, (ix - 33)
	ld	de, 160
	.loc	0 70 49                         ; src/movegen.c:70:49
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp20
.Ltmp20:
	.loc	0 70 15                         ; src/movegen.c:70:15
	or	a, a
	sbc	hl, de
	jp	z, .LBB1_18
	jr	.LBB1_11
	.local	.LBB1_11
.LBB1_11:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp21
.Ltmp21:
	.loc	0 71 17 is_stmt 1               ; src/movegen.c:71:17
	ld	a, (ix - 41)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp22
.Ltmp22:
	.loc	0 71 17 is_stmt 0               ; src/movegen.c:71:17
	ld	de, -8388608
	add	hl, de
	ld	de, -8388592
	or	a, a
	sbc	hl, de
	jp	nc, .LBB1_13
	jr	.LBB1_12
	.local	.LBB1_12
.LBB1_12:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp23
.Ltmp23:
	.loc	0 72 42 is_stmt 1               ; src/movegen.c:72:42
	ld	a, (ix - 34)
	.loc	0 72 50 is_stmt 0               ; src/movegen.c:72:50
	ld	l, (ix - 41)
	ld	(ix - 4), a
	ld	(ix - 5), l
	ld	(ix - 6), -112
	.local	.Ltmp24
.Ltmp24:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 4)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	a, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	e, (ix - 5)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	e, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 6)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp25
.Ltmp25:
	.loc	0 72 25 is_stmt 1               ; src/movegen.c:72:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 72 28 is_stmt 0               ; src/movegen.c:72:28
	ld	(iy), hl
	.loc	0 73 42 is_stmt 1               ; src/movegen.c:73:42
	ld	l, (ix - 34)
	.loc	0 73 50 is_stmt 0               ; src/movegen.c:73:50
	ld	c, (ix - 41)
	ld	(ix - 7), l
	ld	(ix - 8), c
	ld	(ix - 9), 112
	.local	.Ltmp26
.Ltmp26:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 7)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	c, (ix - 8)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 9)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp27
.Ltmp27:
	.loc	0 73 25 is_stmt 1               ; src/movegen.c:73:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 73 28 is_stmt 0               ; src/movegen.c:73:28
	ld	(iy), hl
	.loc	0 74 42 is_stmt 1               ; src/movegen.c:74:42
	ld	l, (ix - 34)
	.loc	0 74 50 is_stmt 0               ; src/movegen.c:74:50
	ld	c, (ix - 41)
	ld	(ix - 10), l
	ld	(ix - 11), c
	ld	(ix - 12), 80
	.local	.Ltmp28
.Ltmp28:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 10)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	c, (ix - 11)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 12)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp29
.Ltmp29:
	.loc	0 74 25 is_stmt 1               ; src/movegen.c:74:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 74 28 is_stmt 0               ; src/movegen.c:74:28
	ld	(iy), hl
	.loc	0 75 42 is_stmt 1               ; src/movegen.c:75:42
	ld	l, (ix - 34)
	.loc	0 75 50 is_stmt 0               ; src/movegen.c:75:50
	ld	c, (ix - 41)
	ld	(ix - 13), l
	ld	(ix - 14), c
	ld	(ix - 15), 48
	.local	.Ltmp30
.Ltmp30:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 13)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 14)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 15)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp31
.Ltmp31:
	.loc	0 75 25 is_stmt 1               ; src/movegen.c:75:25
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 75 28 is_stmt 0               ; src/movegen.c:75:28
	ld	(iy), hl
	.loc	0 76 13 is_stmt 1               ; src/movegen.c:76:13
	jp	.LBB1_17
	.local	.Ltmp32
.Ltmp32:
	.local	.LBB1_13
.LBB1_13:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 78 22                         ; src/movegen.c:78:22
	ld	a, (ix - 41)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp33
.Ltmp33:
	.loc	0 78 22 is_stmt 0               ; src/movegen.c:78:22
	ld	de, -8388608
	add	hl, de
	ld	de, -8388496
	or	a, a
	sbc	hl, de
	jp	c, .LBB1_15
	jr	.LBB1_14
	.local	.LBB1_14
.LBB1_14:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp34
.Ltmp34:
	.loc	0 79 42 is_stmt 1               ; src/movegen.c:79:42
	ld	a, (ix - 34)
	.loc	0 79 50 is_stmt 0               ; src/movegen.c:79:50
	ld	l, (ix - 41)
	ld	(ix - 16), a
	ld	(ix - 17), l
	ld	(ix - 18), -96
	.local	.Ltmp35
.Ltmp35:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 16)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	a, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	e, (ix - 17)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	e, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 18)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp36
.Ltmp36:
	.loc	0 79 25 is_stmt 1               ; src/movegen.c:79:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 79 28 is_stmt 0               ; src/movegen.c:79:28
	ld	(iy), hl
	.loc	0 80 42 is_stmt 1               ; src/movegen.c:80:42
	ld	l, (ix - 34)
	.loc	0 80 50 is_stmt 0               ; src/movegen.c:80:50
	ld	c, (ix - 41)
	ld	(ix - 19), l
	ld	(ix - 20), c
	ld	(ix - 21), -128
	.local	.Ltmp37
.Ltmp37:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 19)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	c, (ix - 20)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 21)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp38
.Ltmp38:
	.loc	0 80 25 is_stmt 1               ; src/movegen.c:80:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 80 28 is_stmt 0               ; src/movegen.c:80:28
	ld	(iy), hl
	.loc	0 81 42 is_stmt 1               ; src/movegen.c:81:42
	ld	l, (ix - 34)
	.loc	0 81 50 is_stmt 0               ; src/movegen.c:81:50
	ld	c, (ix - 41)
	ld	(ix - 22), l
	ld	(ix - 23), c
	ld	(ix - 24), 96
	.local	.Ltmp39
.Ltmp39:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 22)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	c, (ix - 23)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	bc
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, bc
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	l, (ix - 24)
	ld	bc, 0
	ld	c, l
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp40
.Ltmp40:
	.loc	0 81 25 is_stmt 1               ; src/movegen.c:81:25
	ld	iy, (ix - 37)
	lea	bc, iy + 3
	ld	(ix - 37), bc
	.loc	0 81 28 is_stmt 0               ; src/movegen.c:81:28
	ld	(iy), hl
	.loc	0 82 42 is_stmt 1               ; src/movegen.c:82:42
	ld	l, (ix - 34)
	.loc	0 82 50 is_stmt 0               ; src/movegen.c:82:50
	ld	c, (ix - 41)
	ld	(ix - 25), l
	ld	(ix - 26), c
	ld	(ix - 27), 64
	.local	.Ltmp41
.Ltmp41:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	c, (ix - 25)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, c
	.loc	0 17 29                         ; src/movegen.c:17:29
	ld	c, a
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 26)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	0 17 55                         ; src/movegen.c:17:55
	ld	c, e
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 27)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp42
.Ltmp42:
	.loc	0 82 25 is_stmt 1               ; src/movegen.c:82:25
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 82 28 is_stmt 0               ; src/movegen.c:82:28
	ld	(iy), hl
	.loc	0 83 13 is_stmt 1               ; src/movegen.c:83:13
	jr	.LBB1_16
	.local	.Ltmp43
.Ltmp43:
	.local	.LBB1_15
.LBB1_15:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 86 42                         ; src/movegen.c:86:42
	ld	a, (ix - 34)
	.loc	0 86 50 is_stmt 0               ; src/movegen.c:86:50
	ld	l, (ix - 41)
	ld	(ix - 28), a
	ld	(ix - 29), l
	ld	(ix - 30), 0
	.local	.Ltmp44
.Ltmp44:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 28)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 29)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 30)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp45
.Ltmp45:
	.loc	0 86 25 is_stmt 1               ; src/movegen.c:86:25
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 86 28 is_stmt 0               ; src/movegen.c:86:28
	ld	(iy), hl
	jr	.LBB1_16
	.local	.Ltmp46
.Ltmp46:
	.local	.LBB1_16
.LBB1_16:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 0 28                          ; src/movegen.c:0:28
	jr	.LBB1_17
	.local	.LBB1_17
.LBB1_17:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 88 11 is_stmt 1               ; src/movegen.c:88:11
	jr	.LBB1_18
	.local	.Ltmp47
.Ltmp47:
	.local	.LBB1_18
.LBB1_18:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 0 11 is_stmt 0                ; src/movegen.c:0:11
	ld	iy, _b_pawn_capture_offsets
	.loc	0 89 9 is_stmt 1                ; src/movegen.c:89:9
	jr	.LBB1_19
	.local	.Ltmp48
.Ltmp48:
	.local	.LBB1_19
.LBB1_19:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 0 9 is_stmt 0                 ; src/movegen.c:0:9
	jr	.LBB1_20
	.local	.LBB1_20
.LBB1_20:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 91 5 is_stmt 1                ; src/movegen.c:91:5
	jr	.LBB1_21
	.local	.Ltmp49
.Ltmp49:
	.local	.LBB1_21
.LBB1_21:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 92 3                          ; src/movegen.c:92:3
	jr	.LBB1_22
	.local	.Ltmp50
.Ltmp50:
	.local	.LBB1_22
.LBB1_22:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	0 58 27                         ; src/movegen.c:58:27
	ld	hl, (ix - 44)
	inc	hl
	ld	(ix - 44), hl
	.loc	0 58 3 is_stmt 0                ; src/movegen.c:58:3
	jp	.LBB1_1
	.local	.Ltmp51
.Ltmp51:
	.local	.LBB1_23
.LBB1_23:
	.loc	0 94 10 is_stmt 1               ; src/movegen.c:94:10
	ld	hl, (ix - 37)
	.loc	0 94 3 epilogue_begin is_stmt 0 ; src/movegen.c:94:3
	ld	iy, 45
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp52
.Ltmp52:
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_generate_pawn_captures, .Lfunc_end1-_generate_pawn_captures
                                        ; -- End function
	.section	.text._generate_knight_captures,"ax",@progbits
	.type	_generate_knight_captures,@function ; -- Begin function generate_knight_captures
_generate_knight_captures:              ; @generate_knight_captures
	.local	.Lfunc_begin2
.Lfunc_begin2:
	.loc	0 97 0 is_stmt 1                ; src/movegen.c:97:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -21
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	de, (ix + 12)
	ld	iy, _knight_offsets
	ld	(ix - 16), hl
	ld	(ix - 17), a
	ld	(ix - 20), de
	.local	.Ltmp53
.Ltmp53:
	.loc	0 98 16 prologue_end            ; src/movegen.c:98:16
	ld	(ix - 21), 0
	.loc	0 98 8 is_stmt 0                ; src/movegen.c:98:8
	jr	.LBB2_1
	.local	.LBB2_1
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp54
.Ltmp54:
	.loc	0 98 23                         ; src/movegen.c:98:23
	ld	a, (ix - 21)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp55
.Ltmp55:
	.loc	0 98 3                          ; src/movegen.c:98:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB2_10
	jr	.LBB2_2
	.local	.LBB2_2
.LBB2_2:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp56
.Ltmp56:
	.loc	0 99 44 is_stmt 1               ; src/movegen.c:99:44
	ld	de, (ix - 16)
	.loc	0 99 51 is_stmt 0               ; src/movegen.c:99:51
	ld	a, (ix - 17)
	.loc	0 99 74                         ; src/movegen.c:99:74
	ld	l, (ix - 21)
	.loc	0 99 59                         ; src/movegen.c:99:59
	ld	bc, 0
	ld	c, l
	lea	hl, iy + 0
	add	hl, bc
	ld	l, (hl)
	.loc	0 99 78                         ; src/movegen.c:99:78
	ld	bc, (ix - 20)
	ld	(ix - 6), de
	ld	(ix - 7), a
	ld	(ix - 8), l
	ld	(ix - 11), bc
	.local	.Ltmp57
.Ltmp57:
	.loc	0 21 19 is_stmt 1               ; src/movegen.c:21:19
	ld	a, (ix - 7)
	.loc	0 21 28 is_stmt 0               ; src/movegen.c:21:28
	ld	l, (ix - 8)
	.loc	0 21 26                         ; src/movegen.c:21:26
	add	a, l
	ld	l, a
	.loc	0 21 10                         ; src/movegen.c:21:10
	ld	(ix - 12), l
	.local	.Ltmp58
.Ltmp58:
	.loc	0 22 8 is_stmt 1                ; src/movegen.c:22:8
	ld	a, (ix - 12)
	ld	l, -120
	and	a, l
	ld	l, a
	.local	.Ltmp59
.Ltmp59:
	.loc	0 22 7 is_stmt 0                ; src/movegen.c:22:7
	ld	a, l
	or	a, a
	jp	nz, .LBB2_8
	jr	.LBB2_3
	.local	.LBB2_3
.LBB2_3:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp60
.Ltmp60:
	.loc	0 23 26 is_stmt 1               ; src/movegen.c:23:26
	ld	hl, (ix - 6)
	.loc	0 23 39 is_stmt 0               ; src/movegen.c:23:39
	ld	a, (ix - 12)
	.loc	0 23 26                         ; src/movegen.c:23:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 23 11                         ; src/movegen.c:23:11
	ld	(ix - 13), a
	.local	.Ltmp61
.Ltmp61:
	.loc	0 24 9 is_stmt 1                ; src/movegen.c:24:9
	ld	a, (ix - 13)
	.local	.Ltmp62
.Ltmp62:
	.loc	0 24 9 is_stmt 0                ; src/movegen.c:24:9
	or	a, a
	jr	z, .LBB2_7
	jr	.LBB2_4
	.local	.LBB2_4
.LBB2_4:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp63
.Ltmp63:
	.loc	0 25 11 is_stmt 1               ; src/movegen.c:25:11
	ld	a, (ix - 13)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 25 38 is_stmt 0               ; src/movegen.c:25:38
	ld	iy, (ix - 6)
	ld	de, 160
	.loc	0 25 45                         ; src/movegen.c:25:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp64
.Ltmp64:
	.loc	0 25 11                         ; src/movegen.c:25:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB2_6
	jr	.LBB2_5
	.local	.LBB2_5
.LBB2_5:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp65
.Ltmp65:
	.loc	0 26 36 is_stmt 1               ; src/movegen.c:26:36
	ld	a, (ix - 7)
	.loc	0 26 44 is_stmt 0               ; src/movegen.c:26:44
	ld	l, (ix - 12)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 3), 0
	.local	.Ltmp66
.Ltmp66:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 1)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 2)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 3)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp67
.Ltmp67:
	.loc	0 26 19 is_stmt 1               ; src/movegen.c:26:19
	ld	iy, (ix - 11)
	lea	de, iy + 3
	ld	(ix - 11), de
	.loc	0 26 22 is_stmt 0               ; src/movegen.c:26:22
	ld	(iy), hl
	.loc	0 27 7 is_stmt 1                ; src/movegen.c:27:7
	jr	.LBB2_6
	.local	.Ltmp68
.Ltmp68:
	.local	.LBB2_6
.LBB2_6:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	0 0 7 is_stmt 0                 ; src/movegen.c:0:7
	ld	iy, _knight_offsets
	.loc	0 28 5 is_stmt 1                ; src/movegen.c:28:5
	jr	.LBB2_7
	.local	.Ltmp69
.Ltmp69:
	.local	.LBB2_7
.LBB2_7:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	0 29 3                          ; src/movegen.c:29:3
	jr	.LBB2_8
	.local	.Ltmp70
.Ltmp70:
	.local	.LBB2_8
.LBB2_8:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	0 31 10                         ; src/movegen.c:31:10
	ld	hl, (ix - 11)
	.local	.Ltmp71
.Ltmp71:
	.loc	0 99 15                         ; src/movegen.c:99:15
	ld	(ix - 20), hl
	.loc	0 100 3                         ; src/movegen.c:100:3
	jr	.LBB2_9
	.local	.Ltmp72
.Ltmp72:
	.local	.LBB2_9
.LBB2_9:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	0 98 31                         ; src/movegen.c:98:31
	inc	(ix - 21)
	.loc	0 98 3 is_stmt 0                ; src/movegen.c:98:3
	jp	.LBB2_1
	.local	.Ltmp73
.Ltmp73:
	.local	.LBB2_10
.LBB2_10:
	.loc	0 102 10 is_stmt 1              ; src/movegen.c:102:10
	ld	hl, (ix - 20)
	.loc	0 102 3 epilogue_begin is_stmt 0 ; src/movegen.c:102:3
	ld	iy, 21
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp74
.Ltmp74:
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_generate_knight_captures, .Lfunc_end2-_generate_knight_captures
                                        ; -- End function
	.section	.text._generate_bishop_captures,"ax",@progbits
	.type	_generate_bishop_captures,@function ; -- Begin function generate_bishop_captures
_generate_bishop_captures:              ; @generate_bishop_captures
	.local	.Lfunc_begin3
.Lfunc_begin3:
	.loc	0 105 0 is_stmt 1               ; src/movegen.c:105:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -59
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	de, (ix + 12)
	ld	(ix - 55), hl
	ld	(ix - 56), a
	ld	(ix - 59), de
	.local	.Ltmp75
.Ltmp75:
	.loc	0 106 41 prologue_end           ; src/movegen.c:106:41
	ld	hl, (ix - 55)
	.loc	0 106 48 is_stmt 0              ; src/movegen.c:106:48
	ld	a, (ix - 56)
	.loc	0 106 67                        ; src/movegen.c:106:67
	ld	de, (ix - 59)
	ld	(ix - 6), hl
	ld	(ix - 7), a
	ld	(ix - 8), -15
	ld	(ix - 11), de
	.local	.Ltmp76
.Ltmp76:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 7)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 8)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 12), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB3_1
	.local	.LBB3_1
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 12)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_7
	jr	.LBB3_2
	.local	.LBB3_2
.LBB3_2:                                ;   in Loop: Header=BB3_1 Depth=1
	.local	.Ltmp77
.Ltmp77:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 6)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 12)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 13), a
	.local	.Ltmp78
.Ltmp78:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 13)
	.local	.Ltmp79
.Ltmp79:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB3_4
	jr	.LBB3_3
	.local	.LBB3_3
.LBB3_3:                                ;   in Loop: Header=BB3_1 Depth=1
	.local	.Ltmp80
.Ltmp80:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 8)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 12)
	add	a, l
	ld	l, a
	ld	(ix - 12), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB3_1
	.local	.Ltmp81
.Ltmp81:
	.local	.LBB3_4
.LBB3_4:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 13)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 6)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp82
.Ltmp82:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB3_6
	jr	.LBB3_5
	.local	.LBB3_5
.LBB3_5:
	.local	.Ltmp83
.Ltmp83:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 7)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 12)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 3), 0
	.local	.Ltmp84
.Ltmp84:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 1)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 2)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 3)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp85
.Ltmp85:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 11)
	lea	de, iy + 3
	ld	(ix - 11), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB3_6
	.local	.Ltmp86
.Ltmp86:
	.local	.LBB3_6
.LBB3_6:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB3_7
	.local	.Ltmp87
.Ltmp87:
	.local	.LBB3_7
.LBB3_7:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 11)
	.local	.Ltmp88
.Ltmp88:
	.loc	0 106 13                        ; src/movegen.c:106:13
	ld	(ix - 59), hl
	.loc	0 107 41                        ; src/movegen.c:107:41
	ld	hl, (ix - 55)
	.loc	0 107 48 is_stmt 0              ; src/movegen.c:107:48
	ld	a, (ix - 56)
	.loc	0 107 67                        ; src/movegen.c:107:67
	ld	de, (ix - 59)
	ld	(ix - 19), hl
	ld	(ix - 20), a
	ld	(ix - 21), 17
	ld	(ix - 24), de
	.local	.Ltmp89
.Ltmp89:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 20)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 21)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 25), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB3_8
	.local	.LBB3_8
.LBB3_8:                                ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 25)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_14
	jr	.LBB3_9
	.local	.LBB3_9
.LBB3_9:                                ;   in Loop: Header=BB3_8 Depth=1
	.local	.Ltmp90
.Ltmp90:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 19)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 25)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 26), a
	.local	.Ltmp91
.Ltmp91:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 26)
	.local	.Ltmp92
.Ltmp92:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB3_11
	jr	.LBB3_10
	.local	.LBB3_10
.LBB3_10:                               ;   in Loop: Header=BB3_8 Depth=1
	.local	.Ltmp93
.Ltmp93:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 21)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 25)
	add	a, l
	ld	l, a
	ld	(ix - 25), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB3_8
	.local	.Ltmp94
.Ltmp94:
	.local	.LBB3_11
.LBB3_11:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 26)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 19)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp95
.Ltmp95:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB3_13
	jr	.LBB3_12
	.local	.LBB3_12
.LBB3_12:
	.local	.Ltmp96
.Ltmp96:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 20)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 25)
	ld	(ix - 14), a
	ld	(ix - 15), l
	ld	(ix - 16), 0
	.local	.Ltmp97
.Ltmp97:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 14)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 15)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 16)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp98
.Ltmp98:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 24)
	lea	de, iy + 3
	ld	(ix - 24), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB3_13
	.local	.Ltmp99
.Ltmp99:
	.local	.LBB3_13
.LBB3_13:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB3_14
	.local	.Ltmp100
.Ltmp100:
	.local	.LBB3_14
.LBB3_14:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 24)
	.local	.Ltmp101
.Ltmp101:
	.loc	0 107 13                        ; src/movegen.c:107:13
	ld	(ix - 59), hl
	.loc	0 108 41                        ; src/movegen.c:108:41
	ld	hl, (ix - 55)
	.loc	0 108 48 is_stmt 0              ; src/movegen.c:108:48
	ld	a, (ix - 56)
	.loc	0 108 67                        ; src/movegen.c:108:67
	ld	de, (ix - 59)
	ld	(ix - 32), hl
	ld	(ix - 33), a
	ld	(ix - 34), 15
	ld	(ix - 37), de
	.local	.Ltmp102
.Ltmp102:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 33)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 34)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 38), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB3_15
	.local	.LBB3_15
.LBB3_15:                               ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 38)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_21
	jr	.LBB3_16
	.local	.LBB3_16
.LBB3_16:                               ;   in Loop: Header=BB3_15 Depth=1
	.local	.Ltmp103
.Ltmp103:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 32)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 38)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 39), a
	.local	.Ltmp104
.Ltmp104:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 39)
	.local	.Ltmp105
.Ltmp105:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB3_18
	jr	.LBB3_17
	.local	.LBB3_17
.LBB3_17:                               ;   in Loop: Header=BB3_15 Depth=1
	.local	.Ltmp106
.Ltmp106:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 34)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 38)
	add	a, l
	ld	l, a
	ld	(ix - 38), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB3_15
	.local	.Ltmp107
.Ltmp107:
	.local	.LBB3_18
.LBB3_18:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 39)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 32)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp108
.Ltmp108:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB3_20
	jr	.LBB3_19
	.local	.LBB3_19
.LBB3_19:
	.local	.Ltmp109
.Ltmp109:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 33)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 38)
	ld	(ix - 27), a
	ld	(ix - 28), l
	ld	(ix - 29), 0
	.local	.Ltmp110
.Ltmp110:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 27)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 28)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 29)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp111
.Ltmp111:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB3_20
	.local	.Ltmp112
.Ltmp112:
	.local	.LBB3_20
.LBB3_20:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB3_21
	.local	.Ltmp113
.Ltmp113:
	.local	.LBB3_21
.LBB3_21:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 37)
	.local	.Ltmp114
.Ltmp114:
	.loc	0 108 13                        ; src/movegen.c:108:13
	ld	(ix - 59), hl
	.loc	0 109 41                        ; src/movegen.c:109:41
	ld	hl, (ix - 55)
	.loc	0 109 48 is_stmt 0              ; src/movegen.c:109:48
	ld	a, (ix - 56)
	.loc	0 109 67                        ; src/movegen.c:109:67
	ld	de, (ix - 59)
	ld	(ix - 45), hl
	ld	(ix - 46), a
	ld	(ix - 47), -17
	ld	(ix - 50), de
	.local	.Ltmp115
.Ltmp115:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 46)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 47)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 51), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB3_22
	.local	.LBB3_22
.LBB3_22:                               ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 51)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_28
	jr	.LBB3_23
	.local	.LBB3_23
.LBB3_23:                               ;   in Loop: Header=BB3_22 Depth=1
	.local	.Ltmp116
.Ltmp116:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 45)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 51)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 52), a
	.local	.Ltmp117
.Ltmp117:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 52)
	.local	.Ltmp118
.Ltmp118:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB3_25
	jr	.LBB3_24
	.local	.LBB3_24
.LBB3_24:                               ;   in Loop: Header=BB3_22 Depth=1
	.local	.Ltmp119
.Ltmp119:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 47)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 51)
	add	a, l
	ld	l, a
	ld	(ix - 51), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB3_22
	.local	.Ltmp120
.Ltmp120:
	.local	.LBB3_25
.LBB3_25:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 52)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 45)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp121
.Ltmp121:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB3_27
	jr	.LBB3_26
	.local	.LBB3_26
.LBB3_26:
	.local	.Ltmp122
.Ltmp122:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 46)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 51)
	ld	(ix - 40), a
	ld	(ix - 41), l
	ld	(ix - 42), 0
	.local	.Ltmp123
.Ltmp123:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 40)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 41)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 42)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp124
.Ltmp124:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 50)
	lea	de, iy + 3
	ld	(ix - 50), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB3_27
	.local	.Ltmp125
.Ltmp125:
	.local	.LBB3_27
.LBB3_27:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB3_28
	.local	.Ltmp126
.Ltmp126:
	.local	.LBB3_28
.LBB3_28:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 50)
	.local	.Ltmp127
.Ltmp127:
	.loc	0 109 13                        ; src/movegen.c:109:13
	ld	(ix - 59), hl
	.loc	0 111 10                        ; src/movegen.c:111:10
	ld	hl, (ix - 59)
	.loc	0 111 3 epilogue_begin is_stmt 0 ; src/movegen.c:111:3
	ld	iy, 59
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp128
.Ltmp128:
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_generate_bishop_captures, .Lfunc_end3-_generate_bishop_captures
                                        ; -- End function
	.section	.text._generate_rook_captures,"ax",@progbits
	.type	_generate_rook_captures,@function ; -- Begin function generate_rook_captures
_generate_rook_captures:                ; @generate_rook_captures
	.local	.Lfunc_begin4
.Lfunc_begin4:
	.loc	0 114 0 is_stmt 1               ; src/movegen.c:114:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -59
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	de, (ix + 12)
	ld	(ix - 55), hl
	ld	(ix - 56), a
	ld	(ix - 59), de
	.local	.Ltmp129
.Ltmp129:
	.loc	0 115 41 prologue_end           ; src/movegen.c:115:41
	ld	hl, (ix - 55)
	.loc	0 115 48 is_stmt 0              ; src/movegen.c:115:48
	ld	a, (ix - 56)
	.loc	0 115 66                        ; src/movegen.c:115:66
	ld	de, (ix - 59)
	ld	(ix - 6), hl
	ld	(ix - 7), a
	ld	(ix - 8), -16
	ld	(ix - 11), de
	.local	.Ltmp130
.Ltmp130:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 7)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 8)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 12), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB4_1
	.local	.LBB4_1
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 12)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_7
	jr	.LBB4_2
	.local	.LBB4_2
.LBB4_2:                                ;   in Loop: Header=BB4_1 Depth=1
	.local	.Ltmp131
.Ltmp131:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 6)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 12)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 13), a
	.local	.Ltmp132
.Ltmp132:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 13)
	.local	.Ltmp133
.Ltmp133:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB4_4
	jr	.LBB4_3
	.local	.LBB4_3
.LBB4_3:                                ;   in Loop: Header=BB4_1 Depth=1
	.local	.Ltmp134
.Ltmp134:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 8)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 12)
	add	a, l
	ld	l, a
	ld	(ix - 12), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB4_1
	.local	.Ltmp135
.Ltmp135:
	.local	.LBB4_4
.LBB4_4:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 13)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 6)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp136
.Ltmp136:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB4_6
	jr	.LBB4_5
	.local	.LBB4_5
.LBB4_5:
	.local	.Ltmp137
.Ltmp137:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 7)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 12)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 3), 0
	.local	.Ltmp138
.Ltmp138:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 1)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 2)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 3)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp139
.Ltmp139:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 11)
	lea	de, iy + 3
	ld	(ix - 11), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB4_6
	.local	.Ltmp140
.Ltmp140:
	.local	.LBB4_6
.LBB4_6:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB4_7
	.local	.Ltmp141
.Ltmp141:
	.local	.LBB4_7
.LBB4_7:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 11)
	.local	.Ltmp142
.Ltmp142:
	.loc	0 115 13                        ; src/movegen.c:115:13
	ld	(ix - 59), hl
	.loc	0 116 41                        ; src/movegen.c:116:41
	ld	hl, (ix - 55)
	.loc	0 116 48 is_stmt 0              ; src/movegen.c:116:48
	ld	a, (ix - 56)
	.loc	0 116 66                        ; src/movegen.c:116:66
	ld	de, (ix - 59)
	ld	(ix - 19), hl
	ld	(ix - 20), a
	ld	(ix - 21), 1
	ld	(ix - 24), de
	.local	.Ltmp143
.Ltmp143:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 20)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 21)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 25), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB4_8
	.local	.LBB4_8
.LBB4_8:                                ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 25)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_14
	jr	.LBB4_9
	.local	.LBB4_9
.LBB4_9:                                ;   in Loop: Header=BB4_8 Depth=1
	.local	.Ltmp144
.Ltmp144:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 19)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 25)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 26), a
	.local	.Ltmp145
.Ltmp145:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 26)
	.local	.Ltmp146
.Ltmp146:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB4_11
	jr	.LBB4_10
	.local	.LBB4_10
.LBB4_10:                               ;   in Loop: Header=BB4_8 Depth=1
	.local	.Ltmp147
.Ltmp147:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 21)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 25)
	add	a, l
	ld	l, a
	ld	(ix - 25), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB4_8
	.local	.Ltmp148
.Ltmp148:
	.local	.LBB4_11
.LBB4_11:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 26)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 19)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp149
.Ltmp149:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB4_13
	jr	.LBB4_12
	.local	.LBB4_12
.LBB4_12:
	.local	.Ltmp150
.Ltmp150:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 20)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 25)
	ld	(ix - 14), a
	ld	(ix - 15), l
	ld	(ix - 16), 0
	.local	.Ltmp151
.Ltmp151:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 14)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 15)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 16)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp152
.Ltmp152:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 24)
	lea	de, iy + 3
	ld	(ix - 24), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB4_13
	.local	.Ltmp153
.Ltmp153:
	.local	.LBB4_13
.LBB4_13:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB4_14
	.local	.Ltmp154
.Ltmp154:
	.local	.LBB4_14
.LBB4_14:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 24)
	.local	.Ltmp155
.Ltmp155:
	.loc	0 116 13                        ; src/movegen.c:116:13
	ld	(ix - 59), hl
	.loc	0 117 41                        ; src/movegen.c:117:41
	ld	hl, (ix - 55)
	.loc	0 117 48 is_stmt 0              ; src/movegen.c:117:48
	ld	a, (ix - 56)
	.loc	0 117 66                        ; src/movegen.c:117:66
	ld	de, (ix - 59)
	ld	(ix - 32), hl
	ld	(ix - 33), a
	ld	(ix - 34), 16
	ld	(ix - 37), de
	.local	.Ltmp156
.Ltmp156:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 33)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 34)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 38), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB4_15
	.local	.LBB4_15
.LBB4_15:                               ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 38)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_21
	jr	.LBB4_16
	.local	.LBB4_16
.LBB4_16:                               ;   in Loop: Header=BB4_15 Depth=1
	.local	.Ltmp157
.Ltmp157:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 32)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 38)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 39), a
	.local	.Ltmp158
.Ltmp158:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 39)
	.local	.Ltmp159
.Ltmp159:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB4_18
	jr	.LBB4_17
	.local	.LBB4_17
.LBB4_17:                               ;   in Loop: Header=BB4_15 Depth=1
	.local	.Ltmp160
.Ltmp160:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 34)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 38)
	add	a, l
	ld	l, a
	ld	(ix - 38), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB4_15
	.local	.Ltmp161
.Ltmp161:
	.local	.LBB4_18
.LBB4_18:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 39)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 32)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp162
.Ltmp162:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB4_20
	jr	.LBB4_19
	.local	.LBB4_19
.LBB4_19:
	.local	.Ltmp163
.Ltmp163:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 33)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 38)
	ld	(ix - 27), a
	ld	(ix - 28), l
	ld	(ix - 29), 0
	.local	.Ltmp164
.Ltmp164:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 27)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 28)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 29)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp165
.Ltmp165:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 37)
	lea	de, iy + 3
	ld	(ix - 37), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB4_20
	.local	.Ltmp166
.Ltmp166:
	.local	.LBB4_20
.LBB4_20:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB4_21
	.local	.Ltmp167
.Ltmp167:
	.local	.LBB4_21
.LBB4_21:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 37)
	.local	.Ltmp168
.Ltmp168:
	.loc	0 117 13                        ; src/movegen.c:117:13
	ld	(ix - 59), hl
	.loc	0 118 41                        ; src/movegen.c:118:41
	ld	hl, (ix - 55)
	.loc	0 118 48 is_stmt 0              ; src/movegen.c:118:48
	ld	a, (ix - 56)
	.loc	0 118 66                        ; src/movegen.c:118:66
	ld	de, (ix - 59)
	ld	(ix - 45), hl
	ld	(ix - 46), a
	ld	(ix - 47), -1
	ld	(ix - 50), de
	.local	.Ltmp169
.Ltmp169:
	.loc	0 35 19 is_stmt 1               ; src/movegen.c:35:19
	ld	a, (ix - 46)
	.loc	0 35 28 is_stmt 0               ; src/movegen.c:35:28
	ld	l, (ix - 47)
	.loc	0 35 26                         ; src/movegen.c:35:26
	add	a, l
	ld	l, a
	.loc	0 35 10                         ; src/movegen.c:35:10
	ld	(ix - 51), l
	.loc	0 36 3 is_stmt 1                ; src/movegen.c:36:3
	jr	.LBB4_22
	.local	.LBB4_22
.LBB4_22:                               ; =>This Inner Loop Header: Depth=1
	.loc	0 36 11 is_stmt 0               ; src/movegen.c:36:11
	ld	a, (ix - 51)
	ld	l, -120
	and	a, l
	ld	l, a
	.loc	0 36 3                          ; src/movegen.c:36:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_28
	jr	.LBB4_23
	.local	.LBB4_23
.LBB4_23:                               ;   in Loop: Header=BB4_22 Depth=1
	.local	.Ltmp170
.Ltmp170:
	.loc	0 37 26 is_stmt 1               ; src/movegen.c:37:26
	ld	hl, (ix - 45)
	.loc	0 37 39 is_stmt 0               ; src/movegen.c:37:39
	ld	a, (ix - 51)
	.loc	0 37 26                         ; src/movegen.c:37:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 37 11                         ; src/movegen.c:37:11
	ld	(ix - 52), a
	.local	.Ltmp171
.Ltmp171:
	.loc	0 38 9 is_stmt 1                ; src/movegen.c:38:9
	ld	a, (ix - 52)
	.local	.Ltmp172
.Ltmp172:
	.loc	0 38 9 is_stmt 0                ; src/movegen.c:38:9
	or	a, a
	jr	nz, .LBB4_25
	jr	.LBB4_24
	.local	.LBB4_24
.LBB4_24:                               ;   in Loop: Header=BB4_22 Depth=1
	.local	.Ltmp173
.Ltmp173:
	.loc	0 39 17 is_stmt 1               ; src/movegen.c:39:17
	ld	l, (ix - 47)
	.loc	0 39 14 is_stmt 0               ; src/movegen.c:39:14
	ld	a, (ix - 51)
	add	a, l
	ld	l, a
	ld	(ix - 51), l
	.loc	0 40 7 is_stmt 1                ; src/movegen.c:40:7
	jr	.LBB4_22
	.local	.Ltmp174
.Ltmp174:
	.local	.LBB4_25
.LBB4_25:
	.loc	0 44 11                         ; src/movegen.c:44:11
	ld	a, (ix - 52)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 44 38 is_stmt 0               ; src/movegen.c:44:38
	ld	iy, (ix - 45)
	ld	de, 160
	.loc	0 44 45                         ; src/movegen.c:44:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp175
.Ltmp175:
	.loc	0 44 11                         ; src/movegen.c:44:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB4_27
	jr	.LBB4_26
	.local	.LBB4_26
.LBB4_26:
	.local	.Ltmp176
.Ltmp176:
	.loc	0 45 36 is_stmt 1               ; src/movegen.c:45:36
	ld	a, (ix - 46)
	.loc	0 45 44 is_stmt 0               ; src/movegen.c:45:44
	ld	l, (ix - 51)
	ld	(ix - 40), a
	ld	(ix - 41), l
	ld	(ix - 42), 0
	.local	.Ltmp177
.Ltmp177:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 40)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 41)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 42)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp178
.Ltmp178:
	.loc	0 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	iy, (ix - 50)
	lea	de, iy + 3
	ld	(ix - 50), de
	.loc	0 45 22 is_stmt 0               ; src/movegen.c:45:22
	ld	(iy), hl
	.loc	0 46 7 is_stmt 1                ; src/movegen.c:46:7
	jr	.LBB4_27
	.local	.Ltmp179
.Ltmp179:
	.local	.LBB4_27
.LBB4_27:
	.loc	0 48 7                          ; src/movegen.c:48:7
	jr	.LBB4_28
	.local	.Ltmp180
.Ltmp180:
	.local	.LBB4_28
.LBB4_28:
	.loc	0 52 10                         ; src/movegen.c:52:10
	ld	hl, (ix - 50)
	.local	.Ltmp181
.Ltmp181:
	.loc	0 118 13                        ; src/movegen.c:118:13
	ld	(ix - 59), hl
	.loc	0 120 10                        ; src/movegen.c:120:10
	ld	hl, (ix - 59)
	.loc	0 120 3 epilogue_begin is_stmt 0 ; src/movegen.c:120:3
	ld	iy, 59
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp182
.Ltmp182:
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_generate_rook_captures, .Lfunc_end4-_generate_rook_captures
                                        ; -- End function
	.section	.text._generate_queen_captures,"ax",@progbits
	.type	_generate_queen_captures,@function ; -- Begin function generate_queen_captures
_generate_queen_captures:               ; @generate_queen_captures
	.local	.Lfunc_begin5
.Lfunc_begin5:
	.loc	0 123 0 is_stmt 1               ; src/movegen.c:123:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -7
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	de, (ix + 12)
	ld	(ix - 3), hl
	ld	(ix - 4), a
	ld	(ix - 7), de
	.local	.Ltmp183
.Ltmp183:
	.loc	0 124 40 prologue_end           ; src/movegen.c:124:40
	ld	hl, (ix - 3)
	.loc	0 124 47 is_stmt 0              ; src/movegen.c:124:47
	ld	a, (ix - 4)
	.loc	0 124 55                        ; src/movegen.c:124:55
	ld	de, (ix - 7)
	.loc	0 124 15                        ; src/movegen.c:124:15
	push	de
	ld	e, a
	push	de
	push	hl
	call	_generate_bishop_captures
	ld	iy, 9
	add	iy, sp
	ld	sp, iy
	.loc	0 124 13                        ; src/movegen.c:124:13
	ld	(ix - 7), hl
	.loc	0 125 38 is_stmt 1              ; src/movegen.c:125:38
	ld	hl, (ix - 3)
	.loc	0 125 45 is_stmt 0              ; src/movegen.c:125:45
	ld	a, (ix - 4)
	.loc	0 125 53                        ; src/movegen.c:125:53
	ld	de, (ix - 7)
	.loc	0 125 15                        ; src/movegen.c:125:15
	push	de
	ld	e, a
	push	de
	push	hl
	call	_generate_rook_captures
	ld	iy, 9
	add	iy, sp
	ld	sp, iy
	.loc	0 125 13                        ; src/movegen.c:125:13
	ld	(ix - 7), hl
	.loc	0 127 10 is_stmt 1              ; src/movegen.c:127:10
	ld	hl, (ix - 7)
	.loc	0 127 3 epilogue_begin is_stmt 0 ; src/movegen.c:127:3
	ld	iy, 7
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp184
.Ltmp184:
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_generate_queen_captures, .Lfunc_end5-_generate_queen_captures
                                        ; -- End function
	.section	.text._generate_king_captures,"ax",@progbits
	.type	_generate_king_captures,@function ; -- Begin function generate_king_captures
_generate_king_captures:                ; @generate_king_captures
	.local	.Lfunc_begin6
.Lfunc_begin6:
	.loc	0 130 0 is_stmt 1               ; src/movegen.c:130:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -21
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	a, (ix + 9)
	ld	de, (ix + 12)
	ld	iy, _king_offsets
	ld	(ix - 16), hl
	ld	(ix - 17), a
	ld	(ix - 20), de
	.local	.Ltmp185
.Ltmp185:
	.loc	0 131 16 prologue_end           ; src/movegen.c:131:16
	ld	(ix - 21), 0
	.loc	0 131 8 is_stmt 0               ; src/movegen.c:131:8
	jr	.LBB6_1
	.local	.LBB6_1
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp186
.Ltmp186:
	.loc	0 131 23                        ; src/movegen.c:131:23
	ld	a, (ix - 21)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp187
.Ltmp187:
	.loc	0 131 3                         ; src/movegen.c:131:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB6_10
	jr	.LBB6_2
	.local	.LBB6_2
.LBB6_2:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp188
.Ltmp188:
	.loc	0 132 44 is_stmt 1              ; src/movegen.c:132:44
	ld	de, (ix - 16)
	.loc	0 132 51 is_stmt 0              ; src/movegen.c:132:51
	ld	a, (ix - 17)
	.loc	0 132 72                        ; src/movegen.c:132:72
	ld	l, (ix - 21)
	.loc	0 132 59                        ; src/movegen.c:132:59
	ld	bc, 0
	ld	c, l
	lea	hl, iy + 0
	add	hl, bc
	ld	l, (hl)
	.loc	0 132 76                        ; src/movegen.c:132:76
	ld	bc, (ix - 20)
	ld	(ix - 6), de
	ld	(ix - 7), a
	ld	(ix - 8), l
	ld	(ix - 11), bc
	.local	.Ltmp189
.Ltmp189:
	.loc	0 21 19 is_stmt 1               ; src/movegen.c:21:19
	ld	a, (ix - 7)
	.loc	0 21 28 is_stmt 0               ; src/movegen.c:21:28
	ld	l, (ix - 8)
	.loc	0 21 26                         ; src/movegen.c:21:26
	add	a, l
	ld	l, a
	.loc	0 21 10                         ; src/movegen.c:21:10
	ld	(ix - 12), l
	.local	.Ltmp190
.Ltmp190:
	.loc	0 22 8 is_stmt 1                ; src/movegen.c:22:8
	ld	a, (ix - 12)
	ld	l, -120
	and	a, l
	ld	l, a
	.local	.Ltmp191
.Ltmp191:
	.loc	0 22 7 is_stmt 0                ; src/movegen.c:22:7
	ld	a, l
	or	a, a
	jp	nz, .LBB6_8
	jr	.LBB6_3
	.local	.LBB6_3
.LBB6_3:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp192
.Ltmp192:
	.loc	0 23 26 is_stmt 1               ; src/movegen.c:23:26
	ld	hl, (ix - 6)
	.loc	0 23 39 is_stmt 0               ; src/movegen.c:23:39
	ld	a, (ix - 12)
	.loc	0 23 26                         ; src/movegen.c:23:26
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	.loc	0 23 11                         ; src/movegen.c:23:11
	ld	(ix - 13), a
	.local	.Ltmp193
.Ltmp193:
	.loc	0 24 9 is_stmt 1                ; src/movegen.c:24:9
	ld	a, (ix - 13)
	.local	.Ltmp194
.Ltmp194:
	.loc	0 24 9 is_stmt 0                ; src/movegen.c:24:9
	or	a, a
	jr	z, .LBB6_7
	jr	.LBB6_4
	.local	.LBB6_4
.LBB6_4:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp195
.Ltmp195:
	.loc	0 25 11 is_stmt 1               ; src/movegen.c:25:11
	ld	a, (ix - 13)
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, 1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	0 25 38 is_stmt 0               ; src/movegen.c:25:38
	ld	iy, (ix - 6)
	ld	de, 160
	.loc	0 25 45                         ; src/movegen.c:25:45
	add	iy, de
	ld	de, (iy)
	.local	.Ltmp196
.Ltmp196:
	.loc	0 25 11                         ; src/movegen.c:25:11
	or	a, a
	sbc	hl, de
	jr	z, .LBB6_6
	jr	.LBB6_5
	.local	.LBB6_5
.LBB6_5:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp197
.Ltmp197:
	.loc	0 26 36 is_stmt 1               ; src/movegen.c:26:36
	ld	a, (ix - 7)
	.loc	0 26 44 is_stmt 0               ; src/movegen.c:26:44
	ld	l, (ix - 12)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 3), 0
	.local	.Ltmp198
.Ltmp198:
	.loc	0 17 17 is_stmt 1               ; src/movegen.c:17:17
	ld	a, (ix - 1)
	.loc	0 17 11 is_stmt 0               ; src/movegen.c:17:11
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 16
	.loc	0 17 29                         ; src/movegen.c:17:29
	call	__ishl
	push	hl
	pop	iy
	.loc	0 17 45                         ; src/movegen.c:17:45
	ld	a, (ix - 2)
	.loc	0 17 39                         ; src/movegen.c:17:39
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 8
	.loc	0 17 55                         ; src/movegen.c:17:55
	call	__ishl
	push	hl
	pop	de
	.loc	0 17 36                         ; src/movegen.c:17:36
	add	iy, de
	.loc	0 17 63                         ; src/movegen.c:17:63
	ld	a, (ix - 3)
	ld	bc, 0
	ld	c, a
	.loc	0 17 61                         ; src/movegen.c:17:61
	lea	hl, iy + 0
	call	__ior
	.local	.Ltmp199
.Ltmp199:
	.loc	0 26 19 is_stmt 1               ; src/movegen.c:26:19
	ld	iy, (ix - 11)
	lea	de, iy + 3
	ld	(ix - 11), de
	.loc	0 26 22 is_stmt 0               ; src/movegen.c:26:22
	ld	(iy), hl
	.loc	0 27 7 is_stmt 1                ; src/movegen.c:27:7
	jr	.LBB6_6
	.local	.Ltmp200
.Ltmp200:
	.local	.LBB6_6
.LBB6_6:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	0 0 7 is_stmt 0                 ; src/movegen.c:0:7
	ld	iy, _king_offsets
	.loc	0 28 5 is_stmt 1                ; src/movegen.c:28:5
	jr	.LBB6_7
	.local	.Ltmp201
.Ltmp201:
	.local	.LBB6_7
.LBB6_7:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	0 29 3                          ; src/movegen.c:29:3
	jr	.LBB6_8
	.local	.Ltmp202
.Ltmp202:
	.local	.LBB6_8
.LBB6_8:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	0 31 10                         ; src/movegen.c:31:10
	ld	hl, (ix - 11)
	.local	.Ltmp203
.Ltmp203:
	.loc	0 132 15                        ; src/movegen.c:132:15
	ld	(ix - 20), hl
	.loc	0 133 3                         ; src/movegen.c:133:3
	jr	.LBB6_9
	.local	.Ltmp204
.Ltmp204:
	.local	.LBB6_9
.LBB6_9:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	0 131 31                        ; src/movegen.c:131:31
	inc	(ix - 21)
	.loc	0 131 3 is_stmt 0               ; src/movegen.c:131:3
	jp	.LBB6_1
	.local	.Ltmp205
.Ltmp205:
	.local	.LBB6_10
.LBB6_10:
	.loc	0 135 10 is_stmt 1              ; src/movegen.c:135:10
	ld	hl, (ix - 20)
	.loc	0 135 3 epilogue_begin is_stmt 0 ; src/movegen.c:135:3
	ld	iy, 21
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp206
.Ltmp206:
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_generate_king_captures, .Lfunc_end6-_generate_king_captures
                                        ; -- End function
	.section	.bss._move_list_stack,"aw",@nobits
	.balign	1
	.globl	_move_list_stack
_move_list_stack:
	.zero	6144

	.section	.data._w_pawn_capture_offsets,"aw",@progbits
	.balign	1
	.local	_w_pawn_capture_offsets
_w_pawn_capture_offsets:
	.ascii	"\361\357"

	.section	.data._b_pawn_capture_offsets,"aw",@progbits
	.balign	1
	.local	_b_pawn_capture_offsets
_b_pawn_capture_offsets:
	.ascii	"\021\017"

	.section	.data._knight_offsets,"aw",@progbits
	.balign	1
	.local	_knight_offsets
_knight_offsets:
	.ascii	"\362\356\341\337\016\022\037!"

	.section	.data._king_offsets,"aw",@progbits
	.balign	1
	.local	_king_offsets
_king_offsets:
	.ascii	"\360\361\001\021\020\017\377\357"

	.section	.debug_abbrev,"",@progbits
	.local	.Labbrev_start0
.Labbrev_start0:
	db	1                               ; Abbreviation Code
	db	17                              ; DW_TAG_compile_unit
	db	1                               ; DW_CHILDREN_yes
	db	37                              ; DW_AT_producer
	db	37                              ; DW_FORM_strx1
	db	19                              ; DW_AT_language
	db	5                               ; DW_FORM_data2
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	114                             ; DW_AT_str_offsets_base
	db	23                              ; DW_FORM_sec_offset
	db	16                              ; DW_AT_stmt_list
	db	23                              ; DW_FORM_sec_offset
	db	27                              ; DW_AT_comp_dir
	db	37                              ; DW_FORM_strx1
	db	17                              ; DW_AT_low_pc
	db	1                               ; DW_FORM_addr
	db	85                              ; DW_AT_ranges
	db	35                              ; DW_FORM_rnglistx
	db	115                             ; DW_AT_addr_base
	db	23                              ; DW_FORM_sec_offset
	db	116                             ; DW_AT_rnglists_base
	db	23                              ; DW_FORM_sec_offset
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	2                               ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	63                              ; DW_AT_external
	db	25                              ; DW_FORM_flag_present
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	3                               ; Abbreviation Code
	db	22                              ; DW_TAG_typedef
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	4                               ; Abbreviation Code
	db	1                               ; DW_TAG_array_type
	db	1                               ; DW_CHILDREN_yes
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	5                               ; Abbreviation Code
	db	33                              ; DW_TAG_subrange_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	55                              ; DW_AT_count
	db	5                               ; DW_FORM_data2
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	6                               ; Abbreviation Code
	db	36                              ; DW_TAG_base_type
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	62                              ; DW_AT_encoding
	db	11                              ; DW_FORM_data1
	db	11                              ; DW_AT_byte_size
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	7                               ; Abbreviation Code
	db	36                              ; DW_TAG_base_type
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	11                              ; DW_AT_byte_size
	db	11                              ; DW_FORM_data1
	db	62                              ; DW_AT_encoding
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	8                               ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	9                               ; Abbreviation Code
	db	33                              ; DW_TAG_subrange_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	55                              ; DW_AT_count
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	10                              ; Abbreviation Code
	db	4                               ; DW_TAG_enumeration_type
	db	1                               ; DW_CHILDREN_yes
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	11                              ; DW_AT_byte_size
	db	11                              ; DW_FORM_data1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	11                              ; Abbreviation Code
	db	40                              ; DW_TAG_enumerator
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	28                              ; DW_AT_const_value
	db	15                              ; DW_FORM_udata
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	12                              ; Abbreviation Code
	db	46                              ; DW_TAG_subprogram
	db	1                               ; DW_CHILDREN_yes
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	64                              ; DW_AT_frame_base
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	39                              ; DW_AT_prototyped
	db	25                              ; DW_FORM_flag_present
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	63                              ; DW_AT_external
	db	25                              ; DW_FORM_flag_present
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	13                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	14                              ; Abbreviation Code
	db	46                              ; DW_TAG_subprogram
	db	1                               ; DW_CHILDREN_yes
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	39                              ; DW_AT_prototyped
	db	25                              ; DW_FORM_flag_present
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	32                              ; DW_AT_inline
	db	33                              ; DW_FORM_implicit_const
	db	1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	15                              ; Abbreviation Code
	db	5                               ; DW_TAG_formal_parameter
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	16                              ; Abbreviation Code
	db	46                              ; DW_TAG_subprogram
	db	1                               ; DW_CHILDREN_yes
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	64                              ; DW_AT_frame_base
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	39                              ; DW_AT_prototyped
	db	25                              ; DW_FORM_flag_present
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	17                              ; Abbreviation Code
	db	5                               ; DW_TAG_formal_parameter
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	18                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	19                              ; Abbreviation Code
	db	29                              ; DW_TAG_inlined_subroutine
	db	1                               ; DW_CHILDREN_yes
	db	49                              ; DW_AT_abstract_origin
	db	19                              ; DW_FORM_ref4
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	88                              ; DW_AT_call_file
	db	11                              ; DW_FORM_data1
	db	89                              ; DW_AT_call_line
	db	11                              ; DW_FORM_data1
	db	87                              ; DW_AT_call_column
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	20                              ; Abbreviation Code
	db	5                               ; DW_TAG_formal_parameter
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	49                              ; DW_AT_abstract_origin
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	21                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	22                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	23                              ; Abbreviation Code
	db	15                              ; DW_TAG_pointer_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	24                              ; Abbreviation Code
	db	19                              ; DW_TAG_structure_type
	db	1                               ; DW_CHILDREN_yes
	db	11                              ; DW_AT_byte_size
	db	11                              ; DW_FORM_data1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	25                              ; Abbreviation Code
	db	13                              ; DW_TAG_member
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	11                              ; DW_FORM_data1
	db	56                              ; DW_AT_data_member_location
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	26                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	49                              ; DW_AT_abstract_origin
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	0                               ; EOM(3)
	.section	.debug_info,"",@progbits
	.local	.Lcu_begin0
.Lcu_begin0:
	d32	.Ldebug_info_end0-.Ldebug_info_start0 ; Length of Unit
	.local	.Ldebug_info_start0
.Ldebug_info_start0:
	dw	5                               ; DWARF version number
	db	1                               ; DWARF Unit Type
	db	3                               ; Address Size (in bytes)
	d32	.Labbrev_start0                 ; Offset Into Abbrev. Section
	db	1                               ; Abbrev [1] 0xc:0x975 DW_TAG_compile_unit
	db	0                               ; DW_AT_producer
	dw	29                              ; DW_AT_language
	db	1                               ; DW_AT_name
	d32	.Lstr_offsets_base0             ; DW_AT_str_offsets_base
	d32	.Lline_table_start0             ; DW_AT_stmt_list
	db	2                               ; DW_AT_comp_dir
	d24	0                               ; DW_AT_low_pc
	db	0                               ; DW_AT_ranges
	d32	.Laddr_table_base0              ; DW_AT_addr_base
	d32	.Lrnglists_table_base0          ; DW_AT_rnglists_base
	db	2                               ; Abbrev [2] 0x26:0xb DW_TAG_variable
	db	3                               ; DW_AT_name
	d32	49                              ; DW_AT_type
                                        ; DW_AT_external
	db	0                               ; DW_AT_decl_file
	db	8                               ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	0
	db	3                               ; Abbrev [3] 0x31:0x8 DW_TAG_typedef
	d32	57                              ; DW_AT_type
	db	8                               ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	18                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x39:0xd DW_TAG_array_type
	d32	70                              ; DW_AT_type
	db	5                               ; Abbrev [5] 0x3e:0x7 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	dw	2048                            ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x46:0x8 DW_TAG_typedef
	d32	78                              ; DW_AT_type
	db	6                               ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0x4e:0x8 DW_TAG_typedef
	d32	86                              ; DW_AT_type
	db	5                               ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	60                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x56:0x4 DW_TAG_base_type
	db	4                               ; DW_AT_name
	db	7                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	7                               ; Abbrev [7] 0x5a:0x4 DW_TAG_base_type
	db	7                               ; DW_AT_name
	db	8                               ; DW_AT_byte_size
	db	7                               ; DW_AT_encoding
	db	8                               ; Abbrev [8] 0x5e:0xb DW_TAG_variable
	db	9                               ; DW_AT_name
	d32	105                             ; DW_AT_type
	db	0                               ; DW_AT_decl_file
	db	10                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	1
	db	4                               ; Abbrev [4] 0x69:0xc DW_TAG_array_type
	d32	117                             ; DW_AT_type
	db	9                               ; Abbrev [9] 0x6e:0x6 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	db	2                               ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x75:0x8 DW_TAG_typedef
	d32	125                             ; DW_AT_type
	db	11                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	6                               ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x7d:0x4 DW_TAG_base_type
	db	10                              ; DW_AT_name
	db	6                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	8                               ; Abbrev [8] 0x81:0xb DW_TAG_variable
	db	12                              ; DW_AT_name
	d32	105                             ; DW_AT_type
	db	0                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	2
	db	8                               ; Abbrev [8] 0x8c:0xb DW_TAG_variable
	db	13                              ; DW_AT_name
	d32	151                             ; DW_AT_type
	db	0                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	3
	db	4                               ; Abbrev [4] 0x97:0xc DW_TAG_array_type
	d32	117                             ; DW_AT_type
	db	9                               ; Abbrev [9] 0x9c:0x6 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	db	8                               ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	8                               ; Abbrev [8] 0xa3:0xb DW_TAG_variable
	db	14                              ; DW_AT_name
	d32	151                             ; DW_AT_type
	db	0                               ; DW_AT_decl_file
	db	13                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	4
	db	10                              ; Abbrev [10] 0xae:0xf DW_TAG_enumeration_type
	d32	86                              ; DW_AT_type
	db	3                               ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	11                              ; Abbrev [11] 0xb6:0x3 DW_TAG_enumerator
	db	15                              ; DW_AT_name
	db	0                               ; DW_AT_const_value
	db	11                              ; Abbrev [11] 0xb9:0x3 DW_TAG_enumerator
	db	16                              ; DW_AT_name
	db	1                               ; DW_AT_const_value
	db	0                               ; End Of Children Mark
	db	12                              ; Abbrev [12] 0xbd:0x27 DW_TAG_subprogram
	db	5                               ; DW_AT_low_pc
	d32	.Lfunc_end0-.Lfunc_begin0       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	48                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	138                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	2415                            ; DW_AT_type
                                        ; DW_AT_external
	db	13                              ; Abbrev [13] 0xcc:0xc DW_TAG_variable
	db	3                               ; DW_AT_location
	db	145
	.ascii	"\206\006"
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	139                             ; DW_AT_decl_line
	d32	845                             ; DW_AT_type
	db	13                              ; Abbrev [13] 0xd8:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	6
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	140                             ; DW_AT_decl_line
	d32	2419                            ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	14                              ; Abbrev [14] 0xe4:0x21 DW_TAG_subprogram
	db	17                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	16                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	70                              ; DW_AT_type
                                        ; DW_AT_inline
	db	15                              ; Abbrev [15] 0xec:0x8 DW_TAG_formal_parameter
	db	18                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	16                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0xf4:0x8 DW_TAG_formal_parameter
	db	22                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	16                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0xfc:0x8 DW_TAG_formal_parameter
	db	23                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	16                              ; DW_AT_decl_line
	d32	281                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x105:0x8 DW_TAG_typedef
	d32	269                             ; DW_AT_type
	db	21                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	9                               ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0x10d:0x8 DW_TAG_typedef
	d32	277                             ; DW_AT_type
	db	20                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x115:0x4 DW_TAG_base_type
	db	19                              ; DW_AT_name
	db	8                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	3                               ; Abbrev [3] 0x119:0x8 DW_TAG_typedef
	d32	269                             ; DW_AT_type
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	16                              ; Abbrev [16] 0x121:0x1e7 DW_TAG_subprogram
	db	6                               ; DW_AT_low_pc
	d32	.Lfunc_end1-.Lfunc_begin1       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	50                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	55                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x130:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	12
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	55                              ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x13b:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	55                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x146:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	8
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	55                              ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	13                              ; Abbrev [13] 0x151:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	56                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	56                              ; DW_AT_decl_line
	d32	993                             ; DW_AT_type
	db	13                              ; Abbrev [13] 0x15c:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	45                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	57                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x167:0x1a0 DW_TAG_lexical_block
	db	7                               ; DW_AT_low_pc
	d32	.Ltmp51-.Ltmp3                  ; DW_AT_high_pc
	db	13                              ; Abbrev [13] 0x16d:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	57                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	58                              ; DW_AT_decl_line
	d32	2415                            ; DW_AT_type
	db	19                              ; Abbrev [19] 0x178:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	8                               ; DW_AT_low_pc
	d32	.Ltmp15-.Ltmp14                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	64                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x185:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	44
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x18d:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	43
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x195:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	42
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x19e:0x168 DW_TAG_lexical_block
	db	9                               ; DW_AT_low_pc
	d32	.Ltmp48-.Ltmp16                 ; DW_AT_high_pc
	db	13                              ; Abbrev [13] 0x1a4:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	46                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	68                              ; DW_AT_decl_line
	d32	959                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x1af:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	10                              ; DW_AT_low_pc
	d32	.Ltmp25-.Ltmp24                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	72                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x1bc:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	41
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x1c4:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	40
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x1cc:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	39
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x1d5:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	11                              ; DW_AT_low_pc
	d32	.Ltmp27-.Ltmp26                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	73                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x1e2:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	38
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x1ea:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	37
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x1f2:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	36
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x1fb:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	12                              ; DW_AT_low_pc
	d32	.Ltmp29-.Ltmp28                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	74                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x208:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	35
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x210:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	34
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x218:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	33
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x221:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	13                              ; DW_AT_low_pc
	d32	.Ltmp31-.Ltmp30                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	75                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x22e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	32
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x236:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x23e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x247:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	14                              ; DW_AT_low_pc
	d32	.Ltmp36-.Ltmp35                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	79                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x254:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	29
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x25c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	28
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x264:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x26d:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	15                              ; DW_AT_low_pc
	d32	.Ltmp38-.Ltmp37                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	80                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x27a:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x282:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x28a:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	24
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x293:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	16                              ; DW_AT_low_pc
	d32	.Ltmp40-.Ltmp39                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	81                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x2a0:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	23
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2a8:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	22
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2b0:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	21
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x2b9:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	17                              ; DW_AT_low_pc
	d32	.Ltmp42-.Ltmp41                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	82                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x2c6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2ce:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2d6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x2df:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	18                              ; DW_AT_low_pc
	d32	.Ltmp45-.Ltmp44                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	86                              ; DW_AT_call_line
	db	30                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x2ec:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2f4:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	16
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x2fc:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	15
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	14                              ; Abbrev [14] 0x308:0x3b DW_TAG_subprogram
	db	25                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
                                        ; DW_AT_inline
	db	15                              ; Abbrev [15] 0x310:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x318:0x8 DW_TAG_formal_parameter
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x320:0x8 DW_TAG_formal_parameter
	db	43                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	d32	117                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x328:0x8 DW_TAG_formal_parameter
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	21                              ; Abbrev [21] 0x330:0x8 DW_TAG_variable
	db	45                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	21                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x338:0xa DW_TAG_lexical_block
	db	21                              ; Abbrev [21] 0x339:0x8 DW_TAG_variable
	db	46                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	23                              ; DW_AT_decl_line
	d32	959                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	23                              ; Abbrev [23] 0x343:0x5 DW_TAG_pointer_type
	d32	70                              ; DW_AT_type
	db	23                              ; Abbrev [23] 0x348:0x5 DW_TAG_pointer_type
	d32	845                             ; DW_AT_type
	db	3                               ; Abbrev [3] 0x34d:0x8 DW_TAG_typedef
	d32	853                             ; DW_AT_type
	db	41                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	30                              ; DW_AT_decl_line
	db	24                              ; Abbrev [24] 0x355:0x56 DW_TAG_structure_type
	db	169                             ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	db	25                              ; Abbrev [25] 0x359:0x9 DW_TAG_member
	db	27                              ; DW_AT_name
	d32	939                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	18                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x362:0x9 DW_TAG_member
	db	30                              ; DW_AT_name
	d32	967                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	19                              ; DW_AT_decl_line
	db	128                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x36b:0x9 DW_TAG_member
	db	32                              ; DW_AT_name
	d32	993                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	21                              ; DW_AT_decl_line
	db	160                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x374:0x9 DW_TAG_member
	db	34                              ; DW_AT_name
	d32	261                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	23                              ; DW_AT_decl_line
	db	163                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x37d:0x9 DW_TAG_member
	db	35                              ; DW_AT_name
	d32	1001                            ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	24                              ; DW_AT_decl_line
	db	164                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x386:0x9 DW_TAG_member
	db	37                              ; DW_AT_name
	d32	1001                            ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	26                              ; DW_AT_decl_line
	db	165                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x38f:0x9 DW_TAG_member
	db	38                              ; DW_AT_name
	d32	1001                            ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	27                              ; DW_AT_decl_line
	db	166                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x398:0x9 DW_TAG_member
	db	39                              ; DW_AT_name
	d32	1001                            ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	28                              ; DW_AT_decl_line
	db	167                             ; DW_AT_data_member_location
	db	25                              ; Abbrev [25] 0x3a1:0x9 DW_TAG_member
	db	40                              ; DW_AT_name
	d32	1001                            ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	29                              ; DW_AT_decl_line
	db	168                             ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x3ab:0x8 DW_TAG_typedef
	d32	947                             ; DW_AT_type
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	14                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x3b3:0xc DW_TAG_array_type
	d32	959                             ; DW_AT_type
	db	9                               ; Abbrev [9] 0x3b8:0x6 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	db	128                             ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x3bf:0x8 DW_TAG_typedef
	d32	269                             ; DW_AT_type
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	10                              ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0x3c7:0x8 DW_TAG_typedef
	d32	975                             ; DW_AT_type
	db	31                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	15                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x3cf:0x12 DW_TAG_array_type
	d32	959                             ; DW_AT_type
	db	9                               ; Abbrev [9] 0x3d4:0x6 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	db	2                               ; DW_AT_count
	db	9                               ; Abbrev [9] 0x3da:0x6 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	db	16                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x3e1:0x8 DW_TAG_typedef
	d32	174                             ; DW_AT_type
	db	33                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x3e9:0x4 DW_TAG_base_type
	db	36                              ; DW_AT_name
	db	2                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	16                              ; Abbrev [16] 0x3ed:0xae DW_TAG_subprogram
	db	19                              ; DW_AT_low_pc
	d32	.Lfunc_end2-.Lfunc_begin2       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	51                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	97                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x3fc:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	97                              ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x407:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	97                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x412:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	97                              ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x41d:0x7d DW_TAG_lexical_block
	db	20                              ; DW_AT_low_pc
	d32	.Ltmp73-.Ltmp53                 ; DW_AT_high_pc
	db	13                              ; Abbrev [13] 0x423:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	57                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	98                              ; DW_AT_decl_line
	d32	269                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x42e:0x6b DW_TAG_inlined_subroutine
	d32	776                             ; DW_AT_abstract_origin
	db	21                              ; DW_AT_low_pc
	d32	.Ltmp71-.Ltmp57                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	99                              ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x43b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	15
	d32	784                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x443:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	14
	d32	792                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x44b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	800                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x453:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	808                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x45b:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	816                             ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x463:0x35 DW_TAG_lexical_block
	db	22                              ; DW_AT_low_pc
	d32	.Ltmp70-.Ltmp60                 ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x469:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	d32	825                             ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x471:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	23                              ; DW_AT_low_pc
	d32	.Ltmp67-.Ltmp66                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	26                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x47e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x486:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x48e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	14                              ; Abbrev [14] 0x49b:0x3b DW_TAG_subprogram
	db	47                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	34                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
                                        ; DW_AT_inline
	db	15                              ; Abbrev [15] 0x4a3:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	34                              ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x4ab:0x8 DW_TAG_formal_parameter
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	34                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x4b3:0x8 DW_TAG_formal_parameter
	db	43                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	34                              ; DW_AT_decl_line
	d32	117                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x4bb:0x8 DW_TAG_formal_parameter
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	34                              ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	21                              ; Abbrev [21] 0x4c3:0x8 DW_TAG_variable
	db	45                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	35                              ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x4cb:0xa DW_TAG_lexical_block
	db	21                              ; Abbrev [21] 0x4cc:0x8 DW_TAG_variable
	db	46                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	37                              ; DW_AT_decl_line
	d32	959                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	16                              ; Abbrev [16] 0x4d6:0x1dd DW_TAG_subprogram
	db	24                              ; DW_AT_low_pc
	d32	.Lfunc_end3-.Lfunc_begin3       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	52                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	105                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x4e5:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	105                             ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x4f0:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	105                             ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x4fb:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	105                             ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x506:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	25                              ; DW_AT_low_pc
	d32	.Ltmp88-.Ltmp76                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	106                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x513:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	53
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x51b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	52
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x523:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	51
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x52b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	48
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x533:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	47
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x53b:0x35 DW_TAG_lexical_block
	db	26                              ; DW_AT_low_pc
	d32	.Ltmp87-.Ltmp77                 ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x541:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	46
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x549:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	27                              ; DW_AT_low_pc
	d32	.Ltmp85-.Ltmp84                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x556:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	58
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x55e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	57
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x566:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	56
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x571:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	28                              ; DW_AT_low_pc
	d32	.Ltmp101-.Ltmp89                ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	107                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x57e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	40
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x586:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	39
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x58e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	38
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x596:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	35
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x59e:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	34
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x5a6:0x35 DW_TAG_lexical_block
	db	29                              ; DW_AT_low_pc
	d32	.Ltmp100-.Ltmp90                ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x5ac:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	33
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x5b4:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	30                              ; DW_AT_low_pc
	d32	.Ltmp98-.Ltmp97                 ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x5c1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	45
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x5c9:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	44
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x5d1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	43
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x5dc:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	31                              ; DW_AT_low_pc
	d32	.Ltmp114-.Ltmp102               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	108                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x5e9:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x5f1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x5f9:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x601:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	22
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x609:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	21
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x611:0x35 DW_TAG_lexical_block
	db	32                              ; DW_AT_low_pc
	d32	.Ltmp113-.Ltmp103               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x617:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x61f:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	33                              ; DW_AT_low_pc
	d32	.Ltmp111-.Ltmp110               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x62c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	32
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x634:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x63c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x647:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	34                              ; DW_AT_low_pc
	d32	.Ltmp127-.Ltmp115               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	109                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x654:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	14
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x65c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x664:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x66c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x674:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x67c:0x35 DW_TAG_lexical_block
	db	35                              ; DW_AT_low_pc
	d32	.Ltmp126-.Ltmp116               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x682:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	7
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x68a:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	36                              ; DW_AT_low_pc
	d32	.Ltmp124-.Ltmp123               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x697:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x69f:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x6a7:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	16                              ; Abbrev [16] 0x6b3:0x1dd DW_TAG_subprogram
	db	37                              ; DW_AT_low_pc
	d32	.Lfunc_end4-.Lfunc_begin4       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	53                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	114                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x6c2:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	114                             ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x6cd:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	114                             ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x6d8:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	114                             ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x6e3:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	38                              ; DW_AT_low_pc
	d32	.Ltmp142-.Ltmp130               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	115                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x6f0:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	53
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x6f8:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	52
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x700:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	51
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x708:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	48
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x710:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	47
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x718:0x35 DW_TAG_lexical_block
	db	39                              ; DW_AT_low_pc
	d32	.Ltmp141-.Ltmp131               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x71e:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	46
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x726:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	40                              ; DW_AT_low_pc
	d32	.Ltmp139-.Ltmp138               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x733:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	58
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x73b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	57
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x743:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	56
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x74e:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	41                              ; DW_AT_low_pc
	d32	.Ltmp155-.Ltmp143               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	116                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x75b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	40
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x763:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	39
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x76b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	38
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x773:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	35
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x77b:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	34
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x783:0x35 DW_TAG_lexical_block
	db	42                              ; DW_AT_low_pc
	d32	.Ltmp154-.Ltmp144               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x789:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	33
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x791:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	43                              ; DW_AT_low_pc
	d32	.Ltmp152-.Ltmp151               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x79e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	45
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x7a6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	44
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x7ae:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	43
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x7b9:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	44                              ; DW_AT_low_pc
	d32	.Ltmp168-.Ltmp156               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	117                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x7c6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x7ce:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x7d6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x7de:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	22
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x7e6:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	21
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x7ee:0x35 DW_TAG_lexical_block
	db	45                              ; DW_AT_low_pc
	d32	.Ltmp167-.Ltmp157               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x7f4:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x7fc:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	46                              ; DW_AT_low_pc
	d32	.Ltmp165-.Ltmp164               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x809:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	32
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x811:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x819:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x824:0x6b DW_TAG_inlined_subroutine
	d32	1179                            ; DW_AT_abstract_origin
	db	47                              ; DW_AT_low_pc
	d32	.Ltmp181-.Ltmp169               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	118                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x831:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	14
	d32	1187                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x839:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	1195                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x841:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	1203                            ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x849:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	1211                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x851:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	d32	1219                            ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x859:0x35 DW_TAG_lexical_block
	db	48                              ; DW_AT_low_pc
	d32	.Ltmp180-.Ltmp170               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x85f:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	7
	d32	1228                            ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x867:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	49                              ; DW_AT_low_pc
	d32	.Ltmp178-.Ltmp177               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	45                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x874:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x87c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x884:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	16                              ; Abbrev [16] 0x890:0x31 DW_TAG_subprogram
	db	50                              ; DW_AT_low_pc
	d32	.Lfunc_end5-.Lfunc_begin5       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	54                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	123                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x89f:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	123                             ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x8aa:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	123                             ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x8b5:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	123                             ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	16                              ; Abbrev [16] 0x8c1:0xae DW_TAG_subprogram
	db	51                              ; DW_AT_low_pc
	d32	.Lfunc_end6-.Lfunc_begin6       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	55                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	130                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	835                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x8d0:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	26                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	130                             ; DW_AT_decl_line
	d32	840                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x8db:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	42                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	130                             ; DW_AT_decl_line
	d32	261                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x8e6:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	44                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	130                             ; DW_AT_decl_line
	d32	835                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x8f1:0x7d DW_TAG_lexical_block
	db	52                              ; DW_AT_low_pc
	d32	.Ltmp205-.Ltmp185               ; DW_AT_high_pc
	db	13                              ; Abbrev [13] 0x8f7:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	57                              ; DW_AT_name
	db	0                               ; DW_AT_decl_file
	db	131                             ; DW_AT_decl_line
	d32	269                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x902:0x6b DW_TAG_inlined_subroutine
	d32	776                             ; DW_AT_abstract_origin
	db	53                              ; DW_AT_low_pc
	d32	.Ltmp203-.Ltmp189               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	132                             ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x90f:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	15
	d32	784                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x917:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	14
	d32	792                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x91f:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	800                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x927:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	808                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x92f:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	816                             ; DW_AT_abstract_origin
	db	18                              ; Abbrev [18] 0x937:0x35 DW_TAG_lexical_block
	db	54                              ; DW_AT_low_pc
	d32	.Ltmp202-.Ltmp192               ; DW_AT_high_pc
	db	26                              ; Abbrev [26] 0x93d:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	d32	825                             ; DW_AT_abstract_origin
	db	19                              ; Abbrev [19] 0x945:0x26 DW_TAG_inlined_subroutine
	d32	228                             ; DW_AT_abstract_origin
	db	55                              ; DW_AT_low_pc
	d32	.Ltmp199-.Ltmp198               ; DW_AT_high_pc
	db	0                               ; DW_AT_call_file
	db	26                              ; DW_AT_call_line
	db	24                              ; DW_AT_call_column
	db	20                              ; Abbrev [20] 0x952:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	236                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x95a:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	244                             ; DW_AT_abstract_origin
	db	20                              ; Abbrev [20] 0x962:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	252                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	6                               ; Abbrev [6] 0x96f:0x4 DW_TAG_base_type
	db	49                              ; DW_AT_name
	db	5                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	4                               ; Abbrev [4] 0x973:0xd DW_TAG_array_type
	d32	70                              ; DW_AT_type
	db	5                               ; Abbrev [5] 0x978:0x7 DW_TAG_subrange_type
	d32	90                              ; DW_AT_type
	dw	256                             ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	.local	.Ldebug_info_end0
.Ldebug_info_end0:
	.section	.debug_rnglists,"",@progbits
	d32	.Ldebug_list_header_end0-.Ldebug_list_header_start0 ; Length
	.local	.Ldebug_list_header_start0
.Ldebug_list_header_start0:
	dw	5                               ; Version
	db	3                               ; Address size
	db	0                               ; Segment selector size
	d32	1                               ; Offset entry count
	.local	.Lrnglists_table_base0
.Lrnglists_table_base0:
	d32	.Ldebug_ranges0-.Lrnglists_table_base0
	.local	.Ldebug_ranges0
.Ldebug_ranges0:
	db	3                               ; DW_RLE_startx_length
	db	5                               ;   start index
	.uleb128 .Lfunc_end0-.Lfunc_begin0      ;   length
	db	3                               ; DW_RLE_startx_length
	db	6                               ;   start index
	.uleb128 .Lfunc_end1-.Lfunc_begin1      ;   length
	db	3                               ; DW_RLE_startx_length
	db	19                              ;   start index
	.uleb128 .Lfunc_end2-.Lfunc_begin2      ;   length
	db	3                               ; DW_RLE_startx_length
	db	24                              ;   start index
	.uleb128 .Lfunc_end3-.Lfunc_begin3      ;   length
	db	3                               ; DW_RLE_startx_length
	db	37                              ;   start index
	.uleb128 .Lfunc_end4-.Lfunc_begin4      ;   length
	db	3                               ; DW_RLE_startx_length
	db	50                              ;   start index
	.uleb128 .Lfunc_end5-.Lfunc_begin5      ;   length
	db	3                               ; DW_RLE_startx_length
	db	51                              ;   start index
	.uleb128 .Lfunc_end6-.Lfunc_begin6      ;   length
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_list_header_end0
.Ldebug_list_header_end0:
	.section	.debug_str_offsets,"",@progbits
	d32	236                             ; Length of String Offsets Set
	dw	5
	dw	0
	.local	.Lstr_offsets_base0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
	.local	.Linfo_string0
.Linfo_string0:
	.asciz	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)" ; string offset=0
	.local	.Linfo_string1
.Linfo_string1:
	.asciz	"src/movegen.c"                 ; string offset=111
	.local	.Linfo_string2
.Linfo_string2:
	.asciz	"/Users/jaden/dev/calculator/MinTI-Chess" ; string offset=125
	.local	.Linfo_string3
.Linfo_string3:
	.asciz	"move_list_stack"               ; string offset=165
	.local	.Linfo_string4
.Linfo_string4:
	.asciz	"unsigned int"                  ; string offset=181
	.local	.Linfo_string5
.Linfo_string5:
	.asciz	"uint24_t"                      ; string offset=194
	.local	.Linfo_string6
.Linfo_string6:
	.asciz	"Move"                          ; string offset=203
	.local	.Linfo_string7
.Linfo_string7:
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=208
	.local	.Linfo_string8
.Linfo_string8:
	.asciz	"MoveListStack"                 ; string offset=228
	.local	.Linfo_string9
.Linfo_string9:
	.asciz	"w_pawn_capture_offsets"        ; string offset=242
	.local	.Linfo_string10
.Linfo_string10:
	.asciz	"signed char"                   ; string offset=265
	.local	.Linfo_string11
.Linfo_string11:
	.asciz	"int8_t"                        ; string offset=277
	.local	.Linfo_string12
.Linfo_string12:
	.asciz	"b_pawn_capture_offsets"        ; string offset=284
	.local	.Linfo_string13
.Linfo_string13:
	.asciz	"knight_offsets"                ; string offset=307
	.local	.Linfo_string14
.Linfo_string14:
	.asciz	"king_offsets"                  ; string offset=322
	.local	.Linfo_string15
.Linfo_string15:
	.asciz	"WHITE"                         ; string offset=335
	.local	.Linfo_string16
.Linfo_string16:
	.asciz	"BLACK"                         ; string offset=341
	.local	.Linfo_string17
.Linfo_string17:
	.asciz	"create_move"                   ; string offset=347
	.local	.Linfo_string18
.Linfo_string18:
	.asciz	"from_square"                   ; string offset=359
	.local	.Linfo_string19
.Linfo_string19:
	.asciz	"unsigned char"                 ; string offset=371
	.local	.Linfo_string20
.Linfo_string20:
	.asciz	"uint8_t"                       ; string offset=385
	.local	.Linfo_string21
.Linfo_string21:
	.asciz	"Square"                        ; string offset=393
	.local	.Linfo_string22
.Linfo_string22:
	.asciz	"to_square"                     ; string offset=400
	.local	.Linfo_string23
.Linfo_string23:
	.asciz	"flags"                         ; string offset=410
	.local	.Linfo_string24
.Linfo_string24:
	.asciz	"Flags"                         ; string offset=416
	.local	.Linfo_string25
.Linfo_string25:
	.asciz	"generate_stepping_captures"    ; string offset=422
	.local	.Linfo_string26
.Linfo_string26:
	.asciz	"state"                         ; string offset=449
	.local	.Linfo_string27
.Linfo_string27:
	.asciz	"board"                         ; string offset=455
	.local	.Linfo_string28
.Linfo_string28:
	.asciz	"Piece"                         ; string offset=461
	.local	.Linfo_string29
.Linfo_string29:
	.asciz	"Board"                         ; string offset=467
	.local	.Linfo_string30
.Linfo_string30:
	.asciz	"piece_list"                    ; string offset=473
	.local	.Linfo_string31
.Linfo_string31:
	.asciz	"PieceList"                     ; string offset=484
	.local	.Linfo_string32
.Linfo_string32:
	.asciz	"side_to_move"                  ; string offset=494
	.local	.Linfo_string33
.Linfo_string33:
	.asciz	"Color"                         ; string offset=507
	.local	.Linfo_string34
.Linfo_string34:
	.asciz	"en_passant_target"             ; string offset=513
	.local	.Linfo_string35
.Linfo_string35:
	.asciz	"en_passant_legal"              ; string offset=531
	.local	.Linfo_string36
.Linfo_string36:
	.asciz	"_Bool"                         ; string offset=548
	.local	.Linfo_string37
.Linfo_string37:
	.asciz	"w_kingside_castle"             ; string offset=554
	.local	.Linfo_string38
.Linfo_string38:
	.asciz	"w_queenside_castle"            ; string offset=572
	.local	.Linfo_string39
.Linfo_string39:
	.asciz	"b_kingside_castle"             ; string offset=591
	.local	.Linfo_string40
.Linfo_string40:
	.asciz	"b_queenside_castle"            ; string offset=609
	.local	.Linfo_string41
.Linfo_string41:
	.asciz	"State"                         ; string offset=628
	.local	.Linfo_string42
.Linfo_string42:
	.asciz	"square"                        ; string offset=634
	.local	.Linfo_string43
.Linfo_string43:
	.asciz	"offset"                        ; string offset=641
	.local	.Linfo_string44
.Linfo_string44:
	.asciz	"move_list"                     ; string offset=648
	.local	.Linfo_string45
.Linfo_string45:
	.asciz	"target"                        ; string offset=658
	.local	.Linfo_string46
.Linfo_string46:
	.asciz	"target_piece"                  ; string offset=665
	.local	.Linfo_string47
.Linfo_string47:
	.asciz	"generate_sliding_captures"     ; string offset=678
	.local	.Linfo_string48
.Linfo_string48:
	.asciz	"main"                          ; string offset=704
	.local	.Linfo_string49
.Linfo_string49:
	.asciz	"int"                           ; string offset=709
	.local	.Linfo_string50
.Linfo_string50:
	.asciz	"generate_pawn_captures"        ; string offset=713
	.local	.Linfo_string51
.Linfo_string51:
	.asciz	"generate_knight_captures"      ; string offset=736
	.local	.Linfo_string52
.Linfo_string52:
	.asciz	"generate_bishop_captures"      ; string offset=761
	.local	.Linfo_string53
.Linfo_string53:
	.asciz	"generate_rook_captures"        ; string offset=786
	.local	.Linfo_string54
.Linfo_string54:
	.asciz	"generate_queen_captures"       ; string offset=809
	.local	.Linfo_string55
.Linfo_string55:
	.asciz	"generate_king_captures"        ; string offset=833
	.local	.Linfo_string56
.Linfo_string56:
	.asciz	"my_color"                      ; string offset=856
	.local	.Linfo_string57
.Linfo_string57:
	.asciz	"i"                             ; string offset=865
	.section	.debug_str_offsets,"",@progbits
	d32	.Linfo_string0
	d32	.Linfo_string1
	d32	.Linfo_string2
	d32	.Linfo_string3
	d32	.Linfo_string4
	d32	.Linfo_string5
	d32	.Linfo_string6
	d32	.Linfo_string7
	d32	.Linfo_string8
	d32	.Linfo_string9
	d32	.Linfo_string10
	d32	.Linfo_string11
	d32	.Linfo_string12
	d32	.Linfo_string13
	d32	.Linfo_string14
	d32	.Linfo_string15
	d32	.Linfo_string16
	d32	.Linfo_string17
	d32	.Linfo_string18
	d32	.Linfo_string19
	d32	.Linfo_string20
	d32	.Linfo_string21
	d32	.Linfo_string22
	d32	.Linfo_string23
	d32	.Linfo_string24
	d32	.Linfo_string25
	d32	.Linfo_string26
	d32	.Linfo_string27
	d32	.Linfo_string28
	d32	.Linfo_string29
	d32	.Linfo_string30
	d32	.Linfo_string31
	d32	.Linfo_string32
	d32	.Linfo_string33
	d32	.Linfo_string34
	d32	.Linfo_string35
	d32	.Linfo_string36
	d32	.Linfo_string37
	d32	.Linfo_string38
	d32	.Linfo_string39
	d32	.Linfo_string40
	d32	.Linfo_string41
	d32	.Linfo_string42
	d32	.Linfo_string43
	d32	.Linfo_string44
	d32	.Linfo_string45
	d32	.Linfo_string46
	d32	.Linfo_string47
	d32	.Linfo_string48
	d32	.Linfo_string49
	d32	.Linfo_string50
	d32	.Linfo_string51
	d32	.Linfo_string52
	d32	.Linfo_string53
	d32	.Linfo_string54
	d32	.Linfo_string55
	d32	.Linfo_string56
	d32	.Linfo_string57
	.section	.debug_addr,"",@progbits
	d32	.Ldebug_addr_end0-.Ldebug_addr_start0 ; Length of contribution
	.local	.Ldebug_addr_start0
.Ldebug_addr_start0:
	dw	5                               ; DWARF version number
	db	3                               ; Address size
	db	0                               ; Segment selector size
	.local	.Laddr_table_base0
.Laddr_table_base0:
	d24	_move_list_stack
	d24	_w_pawn_capture_offsets
	d24	_b_pawn_capture_offsets
	d24	_knight_offsets
	d24	_king_offsets
	d24	.Lfunc_begin0
	d24	.Lfunc_begin1
	d24	.Ltmp3
	d24	.Ltmp14
	d24	.Ltmp16
	d24	.Ltmp24
	d24	.Ltmp26
	d24	.Ltmp28
	d24	.Ltmp30
	d24	.Ltmp35
	d24	.Ltmp37
	d24	.Ltmp39
	d24	.Ltmp41
	d24	.Ltmp44
	d24	.Lfunc_begin2
	d24	.Ltmp53
	d24	.Ltmp57
	d24	.Ltmp60
	d24	.Ltmp66
	d24	.Lfunc_begin3
	d24	.Ltmp76
	d24	.Ltmp77
	d24	.Ltmp84
	d24	.Ltmp89
	d24	.Ltmp90
	d24	.Ltmp97
	d24	.Ltmp102
	d24	.Ltmp103
	d24	.Ltmp110
	d24	.Ltmp115
	d24	.Ltmp116
	d24	.Ltmp123
	d24	.Lfunc_begin4
	d24	.Ltmp130
	d24	.Ltmp131
	d24	.Ltmp138
	d24	.Ltmp143
	d24	.Ltmp144
	d24	.Ltmp151
	d24	.Ltmp156
	d24	.Ltmp157
	d24	.Ltmp164
	d24	.Ltmp169
	d24	.Ltmp170
	d24	.Ltmp177
	d24	.Lfunc_begin5
	d24	.Lfunc_begin6
	d24	.Ltmp185
	d24	.Ltmp189
	d24	.Ltmp192
	d24	.Ltmp198
	.local	.Ldebug_addr_end0
.Ldebug_addr_end0:
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	.Lline_table_start0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	__Unwind_SjLj_Unregister
	.extern	__ior
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.frameaddress.p0
	.extern	_llvm.stackrestore.p0
	.extern	_llvm.eh.sjlj.lsda
	.extern	__iand
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.stacksave.p0
	.extern	__Unwind_SjLj_Register
	.extern	__ishl
	.section	.debug_line,"",@progbits
	.local	.Lline_table_start0
.Lline_table_start0:
