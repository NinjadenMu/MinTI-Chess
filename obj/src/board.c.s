	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"board.c"
	.file	0 "/Users/jaden/dev/calculator/MinTI-Chess" "board.c" md5 0x34e59d9c427a6c1d244a03f12a72a6cd
	.file	1 "/Users/jaden" "CEdev/include/stdint.h"
	.file	2 "src" "types.h"
	.file	3 "src" "board.c"
	.section	.text._reset_board,"ax",@progbits
	.globl	_reset_board                    ; -- Begin function reset_board
	.type	_reset_board,@function
_reset_board:                           ; @reset_board
	.local	.Lfunc_begin0
.Lfunc_begin0:
	.loc	3 66 0                          ; src/board.c:66:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, _state
	ld	de, _initial_state
	ld	bc, 203
	.local	.Ltmp0
.Ltmp0:
	.loc	3 67 13 prologue_end            ; src/board.c:67:13
	push	bc
	push	de
	push	hl
	call	_memcpy
	.loc	3 68 1 epilogue_begin           ; src/board.c:68:1
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
	.local	.Ltmp1
.Ltmp1:
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_reset_board, .Lfunc_end0-_reset_board
                                        ; -- End function
	.section	.text._square_is_attacked,"ax",@progbits
	.globl	_square_is_attacked             ; -- Begin function square_is_attacked
	.type	_square_is_attacked,@function
_square_is_attacked:                    ; @square_is_attacked
	.local	.Lfunc_begin1
.Lfunc_begin1:
	.loc	3 70 0                          ; src/board.c:70:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -19
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	bc, _state
	ld	iy, _knight_offsets
	ld	(ix - 2), a
	.local	.Ltmp2
.Ltmp2:
	.loc	3 73 14 prologue_end            ; src/board.c:73:14
	ld	hl, (_state+194)
	.local	.Ltmp3
.Ltmp3:
	.loc	3 73 7 is_stmt 0                ; src/board.c:73:7
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB1_2
	jr	.LBB1_1
	.local	.LBB1_1
.LBB1_1:
	.local	.Ltmp4
.Ltmp4:
	.loc	3 74 16 is_stmt 1               ; src/board.c:74:16
	ld	(ix - 3), 2
	.loc	3 75 18                         ; src/board.c:75:18
	ld	(ix - 4), 4
	.loc	3 76 18                         ; src/board.c:76:18
	ld	(ix - 5), 6
	.loc	3 77 16                         ; src/board.c:77:16
	ld	(ix - 6), 8
	.loc	3 78 17                         ; src/board.c:78:17
	ld	(ix - 7), 10
	.loc	3 79 16                         ; src/board.c:79:16
	ld	(ix - 8), 12
	.loc	3 81 20                         ; src/board.c:81:20
	ld	a, (_w_pawn_capture_offsets)
	.loc	3 81 18 is_stmt 0               ; src/board.c:81:18
	ld	(ix - 9), a
	.loc	3 82 20 is_stmt 1               ; src/board.c:82:20
	ld	a, (_w_pawn_capture_offsets+1)
	.loc	3 82 18 is_stmt 0               ; src/board.c:82:18
	ld	(ix - 10), a
	.loc	3 83 3 is_stmt 1                ; src/board.c:83:3
	jr	.LBB1_3
	.local	.Ltmp5
.Ltmp5:
	.local	.LBB1_2
.LBB1_2:
	.loc	3 85 16                         ; src/board.c:85:16
	ld	(ix - 3), 1
	.loc	3 86 18                         ; src/board.c:86:18
	ld	(ix - 4), 3
	.loc	3 87 18                         ; src/board.c:87:18
	ld	(ix - 5), 5
	.loc	3 88 16                         ; src/board.c:88:16
	ld	(ix - 6), 7
	.loc	3 89 17                         ; src/board.c:89:17
	ld	(ix - 7), 9
	.loc	3 90 16                         ; src/board.c:90:16
	ld	(ix - 8), 11
	.loc	3 92 20                         ; src/board.c:92:20
	ld	a, (_b_pawn_capture_offsets)
	.loc	3 92 18 is_stmt 0               ; src/board.c:92:18
	ld	(ix - 9), a
	.loc	3 93 20 is_stmt 1               ; src/board.c:93:20
	ld	a, (_b_pawn_capture_offsets+1)
	.loc	3 93 18 is_stmt 0               ; src/board.c:93:18
	ld	(ix - 10), a
	jr	.LBB1_3
	.local	.Ltmp6
.Ltmp6:
	.local	.LBB1_3
.LBB1_3:
	.loc	3 99 12 is_stmt 1               ; src/board.c:99:12
	ld	a, (ix - 2)
	.loc	3 99 21 is_stmt 0               ; src/board.c:99:21
	ld	l, (ix - 9)
	.loc	3 99 19                         ; src/board.c:99:19
	add	a, l
	ld	l, a
	.loc	3 99 10                         ; src/board.c:99:10
	ld	(ix - 11), l
	.local	.Ltmp7
.Ltmp7:
	.loc	3 100 10 is_stmt 1              ; src/board.c:100:10
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 100 18 is_stmt 0              ; src/board.c:100:18
	and	a, l
	ld	l, a
	.loc	3 100 26                        ; src/board.c:100:26
	ld	a, l
	or	a, a
	jr	nz, .LBB1_6
	jr	.LBB1_4
	.local	.LBB1_4
.LBB1_4:
	.loc	3 100 43                        ; src/board.c:100:43
	ld	a, (ix - 11)
	.loc	3 100 30                        ; src/board.c:100:30
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 100 56                        ; src/board.c:100:56
	ld	l, (ix - 3)
	.local	.Ltmp8
.Ltmp8:
	.loc	3 100 7                         ; src/board.c:100:7
	cp	a, l
	jr	nz, .LBB1_6
	jr	.LBB1_5
	.local	.LBB1_5
.LBB1_5:
	.local	.Ltmp9
.Ltmp9:
	.loc	3 100 68                        ; src/board.c:100:68
	ld	(ix - 1), 1
	jp	.LBB1_48
	.local	.Ltmp10
.Ltmp10:
	.local	.LBB1_6
.LBB1_6:
	.loc	3 102 12 is_stmt 1              ; src/board.c:102:12
	ld	a, (ix - 2)
	.loc	3 102 21 is_stmt 0              ; src/board.c:102:21
	ld	l, (ix - 10)
	.loc	3 102 19                        ; src/board.c:102:19
	add	a, l
	ld	l, a
	.loc	3 102 10                        ; src/board.c:102:10
	ld	(ix - 11), l
	.local	.Ltmp11
.Ltmp11:
	.loc	3 103 10 is_stmt 1              ; src/board.c:103:10
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 103 18 is_stmt 0              ; src/board.c:103:18
	and	a, l
	ld	l, a
	.loc	3 103 26                        ; src/board.c:103:26
	ld	a, l
	or	a, a
	jr	nz, .LBB1_9
	jr	.LBB1_7
	.local	.LBB1_7
.LBB1_7:
	.loc	3 103 43                        ; src/board.c:103:43
	ld	a, (ix - 11)
	.loc	3 103 30                        ; src/board.c:103:30
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 103 56                        ; src/board.c:103:56
	ld	l, (ix - 3)
	.local	.Ltmp12
.Ltmp12:
	.loc	3 103 7                         ; src/board.c:103:7
	cp	a, l
	jr	nz, .LBB1_9
	jr	.LBB1_8
	.local	.LBB1_8
.LBB1_8:
	.local	.Ltmp13
.Ltmp13:
	.loc	3 103 68                        ; src/board.c:103:68
	ld	(ix - 1), 1
	jp	.LBB1_48
	.local	.Ltmp14
.Ltmp14:
	.local	.LBB1_9
.LBB1_9:
	.loc	3 107 16 is_stmt 1              ; src/board.c:107:16
	ld	(ix - 12), 0
	.loc	3 107 8 is_stmt 0               ; src/board.c:107:8
	jr	.LBB1_10
	.local	.LBB1_10
.LBB1_10:                               ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp15
.Ltmp15:
	.loc	3 107 23                        ; src/board.c:107:23
	ld	a, (ix - 12)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp16
.Ltmp16:
	.loc	3 107 3                         ; src/board.c:107:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jr	nc, .LBB1_16
	jr	.LBB1_11
	.local	.LBB1_11
.LBB1_11:                               ;   in Loop: Header=BB1_10 Depth=1
	.local	.Ltmp17
.Ltmp17:
	.loc	3 108 14 is_stmt 1              ; src/board.c:108:14
	ld	a, (ix - 2)
	.loc	3 108 38 is_stmt 0              ; src/board.c:108:38
	ld	l, (ix - 12)
	.loc	3 108 23                        ; src/board.c:108:23
	ld	de, 0
	ld	e, l
	lea	hl, iy + 0
	add	hl, de
	ld	l, (hl)
	.loc	3 108 21                        ; src/board.c:108:21
	add	a, l
	ld	l, a
	.loc	3 108 12                        ; src/board.c:108:12
	ld	(ix - 11), l
	.local	.Ltmp18
.Ltmp18:
	.loc	3 109 12 is_stmt 1              ; src/board.c:109:12
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 109 20 is_stmt 0              ; src/board.c:109:20
	and	a, l
	ld	l, a
	.loc	3 109 28                        ; src/board.c:109:28
	ld	a, l
	or	a, a
	jr	nz, .LBB1_14
	jr	.LBB1_12
	.local	.LBB1_12
.LBB1_12:                               ;   in Loop: Header=BB1_10 Depth=1
	.loc	3 109 45                        ; src/board.c:109:45
	ld	a, (ix - 11)
	.loc	3 109 32                        ; src/board.c:109:32
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 109 58                        ; src/board.c:109:58
	ld	l, (ix - 4)
	.local	.Ltmp19
.Ltmp19:
	.loc	3 109 9                         ; src/board.c:109:9
	cp	a, l
	jr	nz, .LBB1_14
	jr	.LBB1_13
	.local	.LBB1_13
.LBB1_13:
	.local	.Ltmp20
.Ltmp20:
	.loc	3 109 72                        ; src/board.c:109:72
	ld	(ix - 1), 1
	jp	.LBB1_48
	.local	.Ltmp21
.Ltmp21:
	.local	.LBB1_14
.LBB1_14:                               ;   in Loop: Header=BB1_10 Depth=1
	.loc	3 110 3 is_stmt 1               ; src/board.c:110:3
	jr	.LBB1_15
	.local	.Ltmp22
.Ltmp22:
	.local	.LBB1_15
.LBB1_15:                               ;   in Loop: Header=BB1_10 Depth=1
	.loc	3 107 31                        ; src/board.c:107:31
	inc	(ix - 12)
	.loc	3 107 3 is_stmt 0               ; src/board.c:107:3
	jr	.LBB1_10
	.local	.Ltmp23
.Ltmp23:
	.local	.LBB1_16
.LBB1_16:
	.loc	3 114 16 is_stmt 1              ; src/board.c:114:16
	ld	(ix - 13), 0
	.loc	3 114 8 is_stmt 0               ; src/board.c:114:8
	jr	.LBB1_17
	.local	.LBB1_17
.LBB1_17:                               ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp24
.Ltmp24:
	.loc	3 114 23                        ; src/board.c:114:23
	ld	a, (ix - 13)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp25
.Ltmp25:
	.loc	3 114 3                         ; src/board.c:114:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jr	nc, .LBB1_23
	jr	.LBB1_18
	.local	.LBB1_18
.LBB1_18:                               ;   in Loop: Header=BB1_17 Depth=1
	.local	.Ltmp26
.Ltmp26:
	.loc	3 115 14 is_stmt 1              ; src/board.c:115:14
	ld	a, (ix - 2)
	.loc	3 115 36 is_stmt 0              ; src/board.c:115:36
	ld	l, (ix - 13)
	.loc	3 115 23                        ; src/board.c:115:23
	ld	de, 0
	ld	e, l
	ld	hl, _king_offsets
	add	hl, de
	ld	l, (hl)
	.loc	3 115 21                        ; src/board.c:115:21
	add	a, l
	ld	l, a
	.loc	3 115 12                        ; src/board.c:115:12
	ld	(ix - 11), l
	.local	.Ltmp27
.Ltmp27:
	.loc	3 116 12 is_stmt 1              ; src/board.c:116:12
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 116 20 is_stmt 0              ; src/board.c:116:20
	and	a, l
	ld	l, a
	.loc	3 116 28                        ; src/board.c:116:28
	ld	a, l
	or	a, a
	jr	nz, .LBB1_21
	jr	.LBB1_19
	.local	.LBB1_19
.LBB1_19:                               ;   in Loop: Header=BB1_17 Depth=1
	.loc	3 116 45                        ; src/board.c:116:45
	ld	a, (ix - 11)
	.loc	3 116 32                        ; src/board.c:116:32
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 116 58                        ; src/board.c:116:58
	ld	l, (ix - 8)
	.local	.Ltmp28
.Ltmp28:
	.loc	3 116 9                         ; src/board.c:116:9
	cp	a, l
	jr	nz, .LBB1_21
	jr	.LBB1_20
	.local	.LBB1_20
.LBB1_20:
	.local	.Ltmp29
.Ltmp29:
	.loc	3 116 70                        ; src/board.c:116:70
	ld	(ix - 1), 1
	jp	.LBB1_48
	.local	.Ltmp30
.Ltmp30:
	.local	.LBB1_21
.LBB1_21:                               ;   in Loop: Header=BB1_17 Depth=1
	.loc	3 117 3 is_stmt 1               ; src/board.c:117:3
	jr	.LBB1_22
	.local	.Ltmp31
.Ltmp31:
	.local	.LBB1_22
.LBB1_22:                               ;   in Loop: Header=BB1_17 Depth=1
	.loc	3 114 31                        ; src/board.c:114:31
	inc	(ix - 13)
	.loc	3 114 3 is_stmt 0               ; src/board.c:114:3
	jr	.LBB1_17
	.local	.Ltmp32
.Ltmp32:
	.local	.LBB1_23
.LBB1_23:
	.loc	3 121 16 is_stmt 1              ; src/board.c:121:16
	ld	(ix - 14), 0
	.loc	3 121 8 is_stmt 0               ; src/board.c:121:8
	jr	.LBB1_24
	.local	.LBB1_24
.LBB1_24:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_26 Depth 2
	.local	.Ltmp33
.Ltmp33:
	.loc	3 121 23                        ; src/board.c:121:23
	ld	a, (ix - 14)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp34
.Ltmp34:
	.loc	3 121 3                         ; src/board.c:121:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388604
	or	a, a
	sbc	hl, de
	jr	nc, .LBB1_35
	jr	.LBB1_25
	.local	.LBB1_25
.LBB1_25:                               ;   in Loop: Header=BB1_24 Depth=1
	.local	.Ltmp35
.Ltmp35:
	.loc	3 122 36 is_stmt 1              ; src/board.c:122:36
	ld	a, (ix - 14)
	.loc	3 122 21 is_stmt 0              ; src/board.c:122:21
	ld	de, 0
	ld	e, a
	ld	hl, _bishop_offsets
	add	hl, de
	ld	a, (hl)
	.loc	3 122 12                        ; src/board.c:122:12
	ld	(ix - 15), a
	.loc	3 123 14 is_stmt 1              ; src/board.c:123:14
	ld	a, (ix - 2)
	.loc	3 123 23 is_stmt 0              ; src/board.c:123:23
	ld	l, (ix - 15)
	.loc	3 123 21                        ; src/board.c:123:21
	add	a, l
	ld	l, a
	.loc	3 123 12                        ; src/board.c:123:12
	ld	(ix - 11), l
	.loc	3 125 5 is_stmt 1               ; src/board.c:125:5
	jr	.LBB1_26
	.local	.LBB1_26
.LBB1_26:                               ;   Parent Loop BB1_24 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	.loc	3 125 15 is_stmt 0              ; src/board.c:125:15
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 125 23                        ; src/board.c:125:23
	and	a, l
	ld	l, a
	.loc	3 125 5                         ; src/board.c:125:5
	ld	a, l
	or	a, a
	jr	nz, .LBB1_33
	jr	.LBB1_27
	.local	.LBB1_27
.LBB1_27:                               ;   in Loop: Header=BB1_26 Depth=2
	.local	.Ltmp36
.Ltmp36:
	.loc	3 126 35 is_stmt 1              ; src/board.c:126:35
	ld	a, (ix - 11)
	.loc	3 126 22 is_stmt 0              ; src/board.c:126:22
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 126 13                        ; src/board.c:126:13
	ld	(ix - 16), a
	.local	.Ltmp37
.Ltmp37:
	.loc	3 127 11 is_stmt 1              ; src/board.c:127:11
	ld	a, (ix - 16)
	.local	.Ltmp38
.Ltmp38:
	.loc	3 127 11 is_stmt 0              ; src/board.c:127:11
	or	a, a
	jr	z, .LBB1_32
	jr	.LBB1_28
	.local	.LBB1_28
.LBB1_28:                               ;   in Loop: Header=BB1_24 Depth=1
	.local	.Ltmp39
.Ltmp39:
	.loc	3 128 13 is_stmt 1              ; src/board.c:128:13
	ld	a, (ix - 16)
	.loc	3 128 21 is_stmt 0              ; src/board.c:128:21
	ld	l, (ix - 5)
	.loc	3 128 34                        ; src/board.c:128:34
	cp	a, l
	jr	z, .LBB1_30
	jr	.LBB1_29
	.local	.LBB1_29
.LBB1_29:                               ;   in Loop: Header=BB1_24 Depth=1
	.loc	3 128 37                        ; src/board.c:128:37
	ld	a, (ix - 16)
	.loc	3 128 46                        ; src/board.c:128:46
	ld	l, (ix - 7)
	.local	.Ltmp40
.Ltmp40:
	.loc	3 128 13                        ; src/board.c:128:13
	cp	a, l
	jr	nz, .LBB1_31
	jr	.LBB1_30
	.local	.LBB1_30
.LBB1_30:
	.local	.Ltmp41
.Ltmp41:
	.loc	3 128 59                        ; src/board.c:128:59
	ld	(ix - 1), 1
	jp	.LBB1_48
	.local	.Ltmp42
.Ltmp42:
	.local	.LBB1_31
.LBB1_31:                               ;   in Loop: Header=BB1_24 Depth=1
	.loc	3 129 9 is_stmt 1               ; src/board.c:129:9
	jr	.LBB1_33
	.local	.Ltmp43
.Ltmp43:
	.local	.LBB1_32
.LBB1_32:                               ;   in Loop: Header=BB1_26 Depth=2
	.loc	3 131 17                        ; src/board.c:131:17
	ld	l, (ix - 15)
	.loc	3 131 14 is_stmt 0              ; src/board.c:131:14
	ld	a, (ix - 11)
	add	a, l
	ld	l, a
	ld	(ix - 11), l
	.local	.Ltmp44
.Ltmp44:
	.loc	3 125 5 is_stmt 1               ; src/board.c:125:5
	jr	.LBB1_26
	.local	.LBB1_33
.LBB1_33:                               ;   in Loop: Header=BB1_24 Depth=1
	.loc	3 133 3                         ; src/board.c:133:3
	jr	.LBB1_34
	.local	.Ltmp45
.Ltmp45:
	.local	.LBB1_34
.LBB1_34:                               ;   in Loop: Header=BB1_24 Depth=1
	.loc	3 121 31                        ; src/board.c:121:31
	inc	(ix - 14)
	.loc	3 121 3 is_stmt 0               ; src/board.c:121:3
	jp	.LBB1_24
	.local	.Ltmp46
.Ltmp46:
	.local	.LBB1_35
.LBB1_35:
	.loc	3 137 16 is_stmt 1              ; src/board.c:137:16
	ld	(ix - 17), 0
	.loc	3 137 8 is_stmt 0               ; src/board.c:137:8
	jr	.LBB1_36
	.local	.LBB1_36
.LBB1_36:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_38 Depth 2
	.local	.Ltmp47
.Ltmp47:
	.loc	3 137 23                        ; src/board.c:137:23
	ld	a, (ix - 17)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp48
.Ltmp48:
	.loc	3 137 3                         ; src/board.c:137:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388604
	or	a, a
	sbc	hl, de
	jp	nc, .LBB1_47
	jr	.LBB1_37
	.local	.LBB1_37
.LBB1_37:                               ;   in Loop: Header=BB1_36 Depth=1
	.local	.Ltmp49
.Ltmp49:
	.loc	3 138 34 is_stmt 1              ; src/board.c:138:34
	ld	a, (ix - 17)
	.loc	3 138 21 is_stmt 0              ; src/board.c:138:21
	ld	de, 0
	ld	e, a
	ld	iy, _rook_offsets
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	3 138 12                        ; src/board.c:138:12
	ld	(ix - 18), a
	.loc	3 139 14 is_stmt 1              ; src/board.c:139:14
	ld	a, (ix - 2)
	.loc	3 139 36 is_stmt 0              ; src/board.c:139:36
	ld	l, (ix - 17)
	.loc	3 139 23                        ; src/board.c:139:23
	ld	de, 0
	ld	e, l
	lea	hl, iy + 0
	add	hl, de
	ld	l, (hl)
	.loc	3 139 21                        ; src/board.c:139:21
	add	a, l
	ld	l, a
	.loc	3 139 12                        ; src/board.c:139:12
	ld	(ix - 11), l
	.loc	3 141 5 is_stmt 1               ; src/board.c:141:5
	jr	.LBB1_38
	.local	.LBB1_38
.LBB1_38:                               ;   Parent Loop BB1_36 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	.loc	3 141 15 is_stmt 0              ; src/board.c:141:15
	ld	a, (ix - 11)
	ld	l, -120
	.loc	3 141 23                        ; src/board.c:141:23
	and	a, l
	ld	l, a
	.loc	3 141 5                         ; src/board.c:141:5
	ld	a, l
	or	a, a
	jr	nz, .LBB1_45
	jr	.LBB1_39
	.local	.LBB1_39
.LBB1_39:                               ;   in Loop: Header=BB1_38 Depth=2
	.local	.Ltmp50
.Ltmp50:
	.loc	3 142 35 is_stmt 1              ; src/board.c:142:35
	ld	a, (ix - 11)
	.loc	3 142 22 is_stmt 0              ; src/board.c:142:22
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	3 142 13                        ; src/board.c:142:13
	ld	(ix - 19), a
	.local	.Ltmp51
.Ltmp51:
	.loc	3 143 11 is_stmt 1              ; src/board.c:143:11
	ld	a, (ix - 19)
	.local	.Ltmp52
.Ltmp52:
	.loc	3 143 11 is_stmt 0              ; src/board.c:143:11
	or	a, a
	jr	z, .LBB1_44
	jr	.LBB1_40
	.local	.LBB1_40
.LBB1_40:                               ;   in Loop: Header=BB1_36 Depth=1
	.local	.Ltmp53
.Ltmp53:
	.loc	3 144 13 is_stmt 1              ; src/board.c:144:13
	ld	a, (ix - 19)
	.loc	3 144 22 is_stmt 0              ; src/board.c:144:22
	ld	l, (ix - 6)
	.loc	3 144 33                        ; src/board.c:144:33
	cp	a, l
	jr	z, .LBB1_42
	jr	.LBB1_41
	.local	.LBB1_41
.LBB1_41:                               ;   in Loop: Header=BB1_36 Depth=1
	.loc	3 144 36                        ; src/board.c:144:36
	ld	a, (ix - 19)
	.loc	3 144 45                        ; src/board.c:144:45
	ld	l, (ix - 7)
	.local	.Ltmp54
.Ltmp54:
	.loc	3 144 13                        ; src/board.c:144:13
	cp	a, l
	jr	nz, .LBB1_43
	jr	.LBB1_42
	.local	.LBB1_42
.LBB1_42:
	.local	.Ltmp55
.Ltmp55:
	.loc	3 144 58                        ; src/board.c:144:58
	ld	(ix - 1), 1
	jr	.LBB1_48
	.local	.Ltmp56
.Ltmp56:
	.local	.LBB1_43
.LBB1_43:                               ;   in Loop: Header=BB1_36 Depth=1
	.loc	3 145 9 is_stmt 1               ; src/board.c:145:9
	jr	.LBB1_45
	.local	.Ltmp57
.Ltmp57:
	.local	.LBB1_44
.LBB1_44:                               ;   in Loop: Header=BB1_38 Depth=2
	.loc	3 147 17                        ; src/board.c:147:17
	ld	l, (ix - 18)
	.loc	3 147 14 is_stmt 0              ; src/board.c:147:14
	ld	a, (ix - 11)
	add	a, l
	ld	l, a
	ld	(ix - 11), l
	.local	.Ltmp58
.Ltmp58:
	.loc	3 141 5 is_stmt 1               ; src/board.c:141:5
	jr	.LBB1_38
	.local	.LBB1_45
.LBB1_45:                               ;   in Loop: Header=BB1_36 Depth=1
	.loc	3 149 3                         ; src/board.c:149:3
	jr	.LBB1_46
	.local	.Ltmp59
.Ltmp59:
	.local	.LBB1_46
.LBB1_46:                               ;   in Loop: Header=BB1_36 Depth=1
	.loc	3 137 31                        ; src/board.c:137:31
	inc	(ix - 17)
	.loc	3 137 3 is_stmt 0               ; src/board.c:137:3
	jp	.LBB1_36
	.local	.Ltmp60
.Ltmp60:
	.local	.LBB1_47
.LBB1_47:
	.loc	3 151 3 is_stmt 1               ; src/board.c:151:3
	ld	(ix - 1), 0
	jr	.LBB1_48
	.local	.LBB1_48
.LBB1_48:
	.loc	3 152 1                         ; src/board.c:152:1
	ld	a, (ix - 1)
	.loc	3 152 1 epilogue_begin is_stmt 0 ; src/board.c:152:1
	ld	hl, 19
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
	.local	.Ltmp61
.Ltmp61:
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_square_is_attacked, .Lfunc_end1-_square_is_attacked
                                        ; -- End function
	.section	.text._make_move,"ax",@progbits
	.globl	_make_move                      ; -- Begin function make_move
	.type	_make_move,@function
_make_move:                             ; @make_move
	.local	.Lfunc_begin2
.Lfunc_begin2:
	.loc	3 154 0 is_stmt 1               ; src/board.c:154:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -13
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	bc, (ix + 9)
	lea	de, ix - 3
	ld	(ix - 3), hl
	ld	(ix - 6), bc
	.local	.Ltmp62
.Ltmp62:
	.loc	3 157 12 prologue_end           ; src/board.c:157:12
	ld	(ix - 9), de
	.loc	3 158 17                        ; src/board.c:158:17
	ld	hl, (ix - 9)
	ld	a, (hl)
	.loc	3 158 9 is_stmt 0               ; src/board.c:158:9
	ld	(ix - 10), a
	.loc	3 159 22 is_stmt 1              ; src/board.c:159:22
	ld	iy, (ix - 9)
	ld	a, (iy + 1)
	.loc	3 159 10 is_stmt 0              ; src/board.c:159:10
	ld	(ix - 11), a
	.loc	3 160 24 is_stmt 1              ; src/board.c:160:24
	ld	iy, (ix - 9)
	ld	a, (iy + 2)
	ld	iy, _state
	.loc	3 160 10 is_stmt 0              ; src/board.c:160:10
	ld	(ix - 12), a
	.loc	3 161 31 is_stmt 1              ; src/board.c:161:31
	ld	a, (ix - 12)
	.loc	3 161 18 is_stmt 0              ; src/board.c:161:18
	ld	bc, 0
	ld	c, a
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	.loc	3 161 9                         ; src/board.c:161:9
	ld	(ix - 13), a
	.local	.Ltmp63
.Ltmp63:
	.loc	3 163 8 is_stmt 1               ; src/board.c:163:8
	ld	a, (ix - 10)
	.local	.Ltmp64
.Ltmp64:
	.loc	3 163 7 is_stmt 0               ; src/board.c:163:7
	or	a, a
	jr	nz, .LBB2_2
	jr	.LBB2_1
	.local	.LBB2_1
.LBB2_1:
	.local	.Ltmp65
.Ltmp65:
	.loc	3 164 47 is_stmt 1              ; src/board.c:164:47
	ld	a, (ix - 11)
	.loc	3 164 34 is_stmt 0              ; src/board.c:164:34
	ld	bc, 0
	ld	c, a
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	.loc	3 164 5                         ; src/board.c:164:5
	ld	hl, (ix - 6)
	.loc	3 164 31                        ; src/board.c:164:31
	ld	(hl), a
	.loc	3 166 34 is_stmt 1              ; src/board.c:166:34
	ld	a, (ix - 13)
	.loc	3 166 19 is_stmt 0              ; src/board.c:166:19
	ld	l, (ix - 11)
	.loc	3 166 6                         ; src/board.c:166:6
	ld	bc, 0
	ld	c, l
	lea	hl, iy + 0
	add	hl, bc
	.loc	3 166 31                        ; src/board.c:166:31
	ld	(hl), a
	.loc	3 167 19 is_stmt 1              ; src/board.c:167:19
	ld	a, (ix - 12)
	.loc	3 167 6 is_stmt 0               ; src/board.c:167:6
	ld	bc, 0
	ld	c, a
	add	iy, bc
	.loc	3 167 33                        ; src/board.c:167:33
	ld	(iy), 0
	.loc	3 168 3 is_stmt 1               ; src/board.c:168:3
	jr	.LBB2_2
	.local	.Ltmp66
.Ltmp66:
	.local	.LBB2_2
.LBB2_2:
	.loc	3 170 10                        ; src/board.c:170:10
	ld	a, (ix - 10)
	.loc	3 170 9 is_stmt 0               ; src/board.c:170:9
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 2
	.loc	3 170 17                        ; src/board.c:170:17
	call	__ishrs
	.loc	3 170 23                        ; src/board.c:170:23
	ld	bc, 1
	call	__iand
	.local	.Ltmp67
.Ltmp67:
	.loc	3 170 7                         ; src/board.c:170:7
	bit	0, l
	jr	z, .LBB2_4
	jr	.LBB2_3
	.local	.LBB2_3
.LBB2_3:
	.local	.Ltmp68
.Ltmp68:
	.loc	3 172 3 is_stmt 1               ; src/board.c:172:3
	jr	.LBB2_4
	.local	.Ltmp69
.Ltmp69:
	.local	.LBB2_4
.LBB2_4:
	.loc	3 0 3 is_stmt 0                 ; src/board.c:0:3
	ld	a, 1
	.loc	3 174 3 epilogue_begin is_stmt 1 ; src/board.c:174:3
	ld	hl, 13
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
	.local	.Ltmp70
.Ltmp70:
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_make_move, .Lfunc_end2-_make_move
                                        ; -- End function
	.section	.bss._state,"aw",@nobits
	.balign	1
	.globl	_state
_state:
	.zero	203

	.section	.rodata._initial_state,"a",@progbits
	.balign	1
	.local	_initial_state
_initial_state:
	.ascii	"\b\004\006\n\f\006\004\b\000\000\000\000\000\000\000\000\002\002\002\002\002\002\002\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\001\001\001\001\001\000\000\000\000\000\000\000\000\007\003\005\t\013\005\003\007"
	.zero	8
	db	7                               ; 0x7
	db	112                             ; 0x70
	db	3                               ; 0x3
	db	113                             ; 0x71
	db	5                               ; 0x5
	db	114                             ; 0x72
	db	9                               ; 0x9
	db	115                             ; 0x73
	db	11                              ; 0xb
	db	116                             ; 0x74
	db	5                               ; 0x5
	db	117                             ; 0x75
	db	3                               ; 0x3
	db	118                             ; 0x76
	db	7                               ; 0x7
	db	119                             ; 0x77
	db	1                               ; 0x1
	db	96                              ; 0x60
	db	1                               ; 0x1
	db	97                              ; 0x61
	db	1                               ; 0x1
	db	98                              ; 0x62
	db	1                               ; 0x1
	db	99                              ; 0x63
	db	1                               ; 0x1
	db	100                             ; 0x64
	db	1                               ; 0x1
	db	101                             ; 0x65
	db	1                               ; 0x1
	db	102                             ; 0x66
	db	1                               ; 0x1
	db	103                             ; 0x67
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	4                               ; 0x4
	db	6                               ; 0x6
	db	5                               ; 0x5
	db	4                               ; 0x4
	db	6                               ; 0x6
	db	8                               ; 0x8
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	2                               ; 0x2
	db	17                              ; 0x11
	db	2                               ; 0x2
	db	18                              ; 0x12
	db	2                               ; 0x2
	db	19                              ; 0x13
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	2                               ; 0x2
	db	21                              ; 0x15
	db	2                               ; 0x2
	db	22                              ; 0x16
	db	2                               ; 0x2
	db	23                              ; 0x17
	db	16                              ; 0x10
	db	16                              ; 0x10
	d24	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	1                               ; 0x1

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
	db	5                               ; Abbreviation Code
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
	db	6                               ; Abbreviation Code
	db	1                               ; DW_TAG_array_type
	db	1                               ; DW_CHILDREN_yes
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	7                               ; Abbreviation Code
	db	33                              ; DW_TAG_subrange_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	55                              ; DW_AT_count
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	8                               ; Abbreviation Code
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
	db	9                               ; Abbreviation Code
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
	db	13                              ; Abbreviation Code
	db	38                              ; DW_TAG_const_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	14                              ; Abbreviation Code
	db	15                              ; DW_TAG_pointer_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	15                              ; Abbreviation Code
	db	46                              ; DW_TAG_subprogram
	db	0                               ; DW_CHILDREN_no
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
	db	63                              ; DW_AT_external
	db	25                              ; DW_FORM_flag_present
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
	db	63                              ; DW_AT_external
	db	25                              ; DW_FORM_flag_present
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
	db	19                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
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
	db	1                               ; Abbrev [1] 0xc:0x333 DW_TAG_compile_unit
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
	db	3                               ; DW_AT_decl_file
	db	9                               ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	0
	db	3                               ; Abbrev [3] 0x31:0x8 DW_TAG_typedef
	d32	57                              ; DW_AT_type
	db	32                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	66                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x39:0x56 DW_TAG_structure_type
	db	203                             ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	53                              ; DW_AT_decl_line
	db	5                               ; Abbrev [5] 0x3d:0x9 DW_TAG_member
	db	4                               ; DW_AT_name
	d32	143                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	54                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x46:0x9 DW_TAG_member
	db	10                              ; DW_AT_name
	d32	187                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	55                              ; DW_AT_decl_line
	db	128                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x4f:0x9 DW_TAG_member
	db	20                              ; DW_AT_name
	d32	287                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	57                              ; DW_AT_decl_line
	db	194                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x58:0x9 DW_TAG_member
	db	25                              ; DW_AT_name
	d32	279                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	59                              ; DW_AT_decl_line
	db	197                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x61:0x9 DW_TAG_member
	db	26                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	60                              ; DW_AT_decl_line
	db	198                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x6a:0x9 DW_TAG_member
	db	28                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	62                              ; DW_AT_decl_line
	db	199                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x73:0x9 DW_TAG_member
	db	29                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	63                              ; DW_AT_decl_line
	db	200                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x7c:0x9 DW_TAG_member
	db	30                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	64                              ; DW_AT_decl_line
	db	201                             ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x85:0x9 DW_TAG_member
	db	31                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	65                              ; DW_AT_decl_line
	db	202                             ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x8f:0x8 DW_TAG_typedef
	d32	151                             ; DW_AT_type
	db	9                               ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	16                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x97:0xc DW_TAG_array_type
	d32	163                             ; DW_AT_type
	db	7                               ; Abbrev [7] 0x9c:0x6 DW_TAG_subrange_type
	d32	183                             ; DW_AT_type
	db	128                             ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0xa3:0x8 DW_TAG_typedef
	d32	171                             ; DW_AT_type
	db	7                               ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0xab:0x8 DW_TAG_typedef
	d32	179                             ; DW_AT_type
	db	6                               ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	8                               ; Abbrev [8] 0xb3:0x4 DW_TAG_base_type
	db	5                               ; DW_AT_name
	db	8                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	9                               ; Abbrev [9] 0xb7:0x4 DW_TAG_base_type
	db	8                               ; DW_AT_name
	db	8                               ; DW_AT_byte_size
	db	7                               ; DW_AT_encoding
	db	3                               ; Abbrev [3] 0xbb:0x8 DW_TAG_typedef
	d32	195                             ; DW_AT_type
	db	19                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	44                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0xc3:0x29 DW_TAG_structure_type
	db	66                              ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	39                              ; DW_AT_decl_line
	db	5                               ; Abbrev [5] 0xc7:0x9 DW_TAG_member
	db	11                              ; DW_AT_name
	d32	236                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	40                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0xd0:0x9 DW_TAG_member
	db	16                              ; DW_AT_name
	d32	236                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	41                              ; DW_AT_decl_line
	db	32                              ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0xd9:0x9 DW_TAG_member
	db	17                              ; DW_AT_name
	d32	171                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	42                              ; DW_AT_decl_line
	db	64                              ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0xe2:0x9 DW_TAG_member
	db	18                              ; DW_AT_name
	d32	171                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	43                              ; DW_AT_decl_line
	db	65                              ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	6                               ; Abbrev [6] 0xec:0xc DW_TAG_array_type
	d32	248                             ; DW_AT_type
	db	7                               ; Abbrev [7] 0xf1:0x6 DW_TAG_subrange_type
	d32	183                             ; DW_AT_type
	db	16                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0xf8:0x8 DW_TAG_typedef
	d32	256                             ; DW_AT_type
	db	15                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	21                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x100:0x17 DW_TAG_structure_type
	db	2                               ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	18                              ; DW_AT_decl_line
	db	5                               ; Abbrev [5] 0x104:0x9 DW_TAG_member
	db	12                              ; DW_AT_name
	d32	163                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	19                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x10d:0x9 DW_TAG_member
	db	13                              ; DW_AT_name
	d32	279                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	db	1                               ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x117:0x8 DW_TAG_typedef
	d32	171                             ; DW_AT_type
	db	14                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	10                              ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0x11f:0x8 DW_TAG_typedef
	d32	295                             ; DW_AT_type
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	10                              ; Abbrev [10] 0x127:0xf DW_TAG_enumeration_type
	d32	310                             ; DW_AT_type
	db	3                               ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	11                              ; Abbrev [11] 0x12f:0x3 DW_TAG_enumerator
	db	22                              ; DW_AT_name
	db	0                               ; DW_AT_const_value
	db	11                              ; Abbrev [11] 0x132:0x3 DW_TAG_enumerator
	db	23                              ; DW_AT_name
	db	1                               ; DW_AT_const_value
	db	0                               ; End Of Children Mark
	db	8                               ; Abbrev [8] 0x136:0x4 DW_TAG_base_type
	db	21                              ; DW_AT_name
	db	7                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	8                               ; Abbrev [8] 0x13a:0x4 DW_TAG_base_type
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	12                              ; Abbrev [12] 0x13e:0xb DW_TAG_variable
	db	33                              ; DW_AT_name
	d32	329                             ; DW_AT_type
	db	3                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	1
	db	13                              ; Abbrev [13] 0x149:0x5 DW_TAG_const_type
	d32	49                              ; DW_AT_type
	db	14                              ; Abbrev [14] 0x14e:0x5 DW_TAG_pointer_type
	d32	171                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x153:0xb DW_TAG_subprogram
	db	2                               ; DW_AT_low_pc
	d32	.Lfunc_end0-.Lfunc_begin0       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	34                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	66                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_external
	db	16                              ; Abbrev [16] 0x15e:0x10e DW_TAG_subprogram
	db	3                               ; DW_AT_low_pc
	d32	.Lfunc_end1-.Lfunc_begin1       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	35                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	70                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	314                             ; DW_AT_type
                                        ; DW_AT_external
	db	17                              ; Abbrev [17] 0x16d:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	db	13                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	70                              ; DW_AT_decl_line
	d32	279                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x178:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	16
	db	37                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x183:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	15
	db	38                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x18e:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	14
	db	39                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x199:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	13
	db	40                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x1a4:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	12
	db	41                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x1af:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	11
	db	42                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x1ba:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	10
	db	43                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	72                              ; DW_AT_decl_line
	d32	713                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x1c5:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	9
	db	46                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	72                              ; DW_AT_decl_line
	d32	713                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x1d0:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	db	47                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	96                              ; DW_AT_decl_line
	d32	279                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x1db:0x12 DW_TAG_lexical_block
	db	4                               ; DW_AT_low_pc
	d32	.Ltmp23-.Ltmp14                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x1e1:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	7
	db	48                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	107                             ; DW_AT_decl_line
	d32	171                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x1ed:0x12 DW_TAG_lexical_block
	db	5                               ; DW_AT_low_pc
	d32	.Ltmp32-.Ltmp23                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x1f3:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	6
	db	48                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	114                             ; DW_AT_decl_line
	d32	171                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x1ff:0x36 DW_TAG_lexical_block
	db	6                               ; DW_AT_low_pc
	d32	.Ltmp46-.Ltmp32                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x205:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	48                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	121                             ; DW_AT_decl_line
	d32	171                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x210:0x24 DW_TAG_lexical_block
	db	7                               ; DW_AT_low_pc
	d32	.Ltmp45-.Ltmp35                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x216:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	49                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	122                             ; DW_AT_decl_line
	d32	713                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x221:0x12 DW_TAG_lexical_block
	db	8                               ; DW_AT_low_pc
	d32	.Ltmp44-.Ltmp36                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x227:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	12                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	126                             ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	19                              ; Abbrev [19] 0x235:0x36 DW_TAG_lexical_block
	db	9                               ; DW_AT_low_pc
	d32	.Ltmp60-.Ltmp46                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x23b:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	2
	db	48                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	137                             ; DW_AT_decl_line
	d32	171                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x246:0x24 DW_TAG_lexical_block
	db	10                              ; DW_AT_low_pc
	d32	.Ltmp59-.Ltmp49                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x24c:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	49                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	138                             ; DW_AT_decl_line
	d32	713                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x257:0x12 DW_TAG_lexical_block
	db	11                              ; DW_AT_low_pc
	d32	.Ltmp58-.Ltmp50                 ; DW_AT_high_pc
	db	18                              ; Abbrev [18] 0x25d:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	12                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	142                             ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	16                              ; Abbrev [16] 0x26c:0x5d DW_TAG_subprogram
	db	12                              ; DW_AT_low_pc
	d32	.Lfunc_end2-.Lfunc_begin2       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	36                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	154                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	314                             ; DW_AT_type
                                        ; DW_AT_external
	db	17                              ; Abbrev [17] 0x27b:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	db	50                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	154                             ; DW_AT_decl_line
	d32	725                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x286:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	db	53                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	154                             ; DW_AT_decl_line
	d32	741                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x291:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	57                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	157                             ; DW_AT_decl_line
	d32	334                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x29c:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	58                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	158                             ; DW_AT_decl_line
	d32	822                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x2a7:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	2
	db	60                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	159                             ; DW_AT_decl_line
	d32	279                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x2b2:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	61                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	160                             ; DW_AT_decl_line
	d32	279                             ; DW_AT_type
	db	18                              ; Abbrev [18] 0x2bd:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	12                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	161                             ; DW_AT_decl_line
	d32	163                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x2c9:0x8 DW_TAG_typedef
	d32	721                             ; DW_AT_type
	db	45                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	6                               ; DW_AT_decl_line
	db	8                               ; Abbrev [8] 0x2d1:0x4 DW_TAG_base_type
	db	44                              ; DW_AT_name
	db	6                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	3                               ; Abbrev [3] 0x2d5:0x8 DW_TAG_typedef
	d32	733                             ; DW_AT_type
	db	52                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	3                               ; Abbrev [3] 0x2dd:0x8 DW_TAG_typedef
	d32	310                             ; DW_AT_type
	db	51                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	60                              ; DW_AT_decl_line
	db	14                              ; Abbrev [14] 0x2e5:0x5 DW_TAG_pointer_type
	d32	746                             ; DW_AT_type
	db	3                               ; Abbrev [3] 0x2ea:0x8 DW_TAG_typedef
	d32	754                             ; DW_AT_type
	db	56                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	77                              ; DW_AT_decl_line
	db	4                               ; Abbrev [4] 0x2f2:0x44 DW_TAG_structure_type
	db	7                               ; DW_AT_byte_size
	db	2                               ; DW_AT_decl_file
	db	68                              ; DW_AT_decl_line
	db	5                               ; Abbrev [5] 0x2f6:0x9 DW_TAG_member
	db	54                              ; DW_AT_name
	d32	163                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	69                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x2ff:0x9 DW_TAG_member
	db	25                              ; DW_AT_name
	d32	279                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	70                              ; DW_AT_decl_line
	db	1                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x308:0x9 DW_TAG_member
	db	55                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	71                              ; DW_AT_decl_line
	db	2                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x311:0x9 DW_TAG_member
	db	28                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	73                              ; DW_AT_decl_line
	db	3                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x31a:0x9 DW_TAG_member
	db	29                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	74                              ; DW_AT_decl_line
	db	4                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x323:0x9 DW_TAG_member
	db	30                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	75                              ; DW_AT_decl_line
	db	5                               ; DW_AT_data_member_location
	db	5                               ; Abbrev [5] 0x32c:0x9 DW_TAG_member
	db	31                              ; DW_AT_name
	d32	314                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	76                              ; DW_AT_decl_line
	db	6                               ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	3                               ; Abbrev [3] 0x336:0x8 DW_TAG_typedef
	d32	171                             ; DW_AT_type
	db	59                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	14                              ; DW_AT_decl_line
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
	db	2                               ;   start index
	.uleb128 .Lfunc_end0-.Lfunc_begin0      ;   length
	db	3                               ; DW_RLE_startx_length
	db	3                               ;   start index
	.uleb128 .Lfunc_end1-.Lfunc_begin1      ;   length
	db	3                               ; DW_RLE_startx_length
	db	12                              ;   start index
	.uleb128 .Lfunc_end2-.Lfunc_begin2      ;   length
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_list_header_end0
.Ldebug_list_header_end0:
	.section	.debug_str_offsets,"",@progbits
	d32	252                             ; Length of String Offsets Set
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
	.asciz	"board.c"                       ; string offset=111
	.local	.Linfo_string2
.Linfo_string2:
	.asciz	"/Users/jaden/dev/calculator/MinTI-Chess" ; string offset=119
	.local	.Linfo_string3
.Linfo_string3:
	.asciz	"state"                         ; string offset=159
	.local	.Linfo_string4
.Linfo_string4:
	.asciz	"board"                         ; string offset=165
	.local	.Linfo_string5
.Linfo_string5:
	.asciz	"unsigned char"                 ; string offset=171
	.local	.Linfo_string6
.Linfo_string6:
	.asciz	"uint8_t"                       ; string offset=185
	.local	.Linfo_string7
.Linfo_string7:
	.asciz	"Piece"                         ; string offset=193
	.local	.Linfo_string8
.Linfo_string8:
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=199
	.local	.Linfo_string9
.Linfo_string9:
	.asciz	"Board"                         ; string offset=219
	.local	.Linfo_string10
.Linfo_string10:
	.asciz	"piece_list"                    ; string offset=225
	.local	.Linfo_string11
.Linfo_string11:
	.asciz	"w_piece_list"                  ; string offset=236
	.local	.Linfo_string12
.Linfo_string12:
	.asciz	"piece"                         ; string offset=249
	.local	.Linfo_string13
.Linfo_string13:
	.asciz	"square"                        ; string offset=255
	.local	.Linfo_string14
.Linfo_string14:
	.asciz	"Square"                        ; string offset=262
	.local	.Linfo_string15
.Linfo_string15:
	.asciz	"PieceInfo"                     ; string offset=269
	.local	.Linfo_string16
.Linfo_string16:
	.asciz	"b_piece_list"                  ; string offset=279
	.local	.Linfo_string17
.Linfo_string17:
	.asciz	"w_count"                       ; string offset=292
	.local	.Linfo_string18
.Linfo_string18:
	.asciz	"b_count"                       ; string offset=300
	.local	.Linfo_string19
.Linfo_string19:
	.asciz	"PieceList"                     ; string offset=308
	.local	.Linfo_string20
.Linfo_string20:
	.asciz	"side_to_move"                  ; string offset=318
	.local	.Linfo_string21
.Linfo_string21:
	.asciz	"unsigned int"                  ; string offset=331
	.local	.Linfo_string22
.Linfo_string22:
	.asciz	"WHITE"                         ; string offset=344
	.local	.Linfo_string23
.Linfo_string23:
	.asciz	"BLACK"                         ; string offset=350
	.local	.Linfo_string24
.Linfo_string24:
	.asciz	"Color"                         ; string offset=356
	.local	.Linfo_string25
.Linfo_string25:
	.asciz	"en_passant_target"             ; string offset=362
	.local	.Linfo_string26
.Linfo_string26:
	.asciz	"en_passant_legal"              ; string offset=380
	.local	.Linfo_string27
.Linfo_string27:
	.asciz	"_Bool"                         ; string offset=397
	.local	.Linfo_string28
.Linfo_string28:
	.asciz	"w_kingside_castle"             ; string offset=403
	.local	.Linfo_string29
.Linfo_string29:
	.asciz	"w_queenside_castle"            ; string offset=421
	.local	.Linfo_string30
.Linfo_string30:
	.asciz	"b_kingside_castle"             ; string offset=440
	.local	.Linfo_string31
.Linfo_string31:
	.asciz	"b_queenside_castle"            ; string offset=458
	.local	.Linfo_string32
.Linfo_string32:
	.asciz	"State"                         ; string offset=477
	.local	.Linfo_string33
.Linfo_string33:
	.asciz	"initial_state"                 ; string offset=483
	.local	.Linfo_string34
.Linfo_string34:
	.asciz	"reset_board"                   ; string offset=497
	.local	.Linfo_string35
.Linfo_string35:
	.asciz	"square_is_attacked"            ; string offset=509
	.local	.Linfo_string36
.Linfo_string36:
	.asciz	"make_move"                     ; string offset=528
	.local	.Linfo_string37
.Linfo_string37:
	.asciz	"enemy_pawn"                    ; string offset=538
	.local	.Linfo_string38
.Linfo_string38:
	.asciz	"enemy_knight"                  ; string offset=549
	.local	.Linfo_string39
.Linfo_string39:
	.asciz	"enemy_bishop"                  ; string offset=562
	.local	.Linfo_string40
.Linfo_string40:
	.asciz	"enemy_rook"                    ; string offset=575
	.local	.Linfo_string41
.Linfo_string41:
	.asciz	"enemy_queen"                   ; string offset=586
	.local	.Linfo_string42
.Linfo_string42:
	.asciz	"enemy_king"                    ; string offset=598
	.local	.Linfo_string43
.Linfo_string43:
	.asciz	"pawn_offset1"                  ; string offset=609
	.local	.Linfo_string44
.Linfo_string44:
	.asciz	"signed char"                   ; string offset=622
	.local	.Linfo_string45
.Linfo_string45:
	.asciz	"int8_t"                        ; string offset=634
	.local	.Linfo_string46
.Linfo_string46:
	.asciz	"pawn_offset2"                  ; string offset=641
	.local	.Linfo_string47
.Linfo_string47:
	.asciz	"target"                        ; string offset=654
	.local	.Linfo_string48
.Linfo_string48:
	.asciz	"i"                             ; string offset=661
	.local	.Linfo_string49
.Linfo_string49:
	.asciz	"offset"                        ; string offset=663
	.local	.Linfo_string50
.Linfo_string50:
	.asciz	"move"                          ; string offset=670
	.local	.Linfo_string51
.Linfo_string51:
	.asciz	"uint24_t"                      ; string offset=675
	.local	.Linfo_string52
.Linfo_string52:
	.asciz	"Move"                          ; string offset=684
	.local	.Linfo_string53
.Linfo_string53:
	.asciz	"undo_info"                     ; string offset=689
	.local	.Linfo_string54
.Linfo_string54:
	.asciz	"captured_piece"                ; string offset=699
	.local	.Linfo_string55
.Linfo_string55:
	.asciz	"en_passsant_legal"             ; string offset=714
	.local	.Linfo_string56
.Linfo_string56:
	.asciz	"UndoInfo"                      ; string offset=732
	.local	.Linfo_string57
.Linfo_string57:
	.asciz	"move_block"                    ; string offset=741
	.local	.Linfo_string58
.Linfo_string58:
	.asciz	"flags"                         ; string offset=752
	.local	.Linfo_string59
.Linfo_string59:
	.asciz	"Flags"                         ; string offset=758
	.local	.Linfo_string60
.Linfo_string60:
	.asciz	"to_square"                     ; string offset=764
	.local	.Linfo_string61
.Linfo_string61:
	.asciz	"from_square"                   ; string offset=774
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
	d32	.Linfo_string58
	d32	.Linfo_string59
	d32	.Linfo_string60
	d32	.Linfo_string61
	.section	.debug_addr,"",@progbits
	d32	.Ldebug_addr_end0-.Ldebug_addr_start0 ; Length of contribution
	.local	.Ldebug_addr_start0
.Ldebug_addr_start0:
	dw	5                               ; DWARF version number
	db	3                               ; Address size
	db	0                               ; Segment selector size
	.local	.Laddr_table_base0
.Laddr_table_base0:
	d24	_state
	d24	_initial_state
	d24	.Lfunc_begin0
	d24	.Lfunc_begin1
	d24	.Ltmp14
	d24	.Ltmp23
	d24	.Ltmp32
	d24	.Ltmp35
	d24	.Ltmp36
	d24	.Ltmp46
	d24	.Ltmp49
	d24	.Ltmp50
	d24	.Lfunc_begin2
	.local	.Ldebug_addr_end0
.Ldebug_addr_end0:
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_knight_offsets
	.extern	.Lline_table_start0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_memcpy
	.extern	_llvm.eh.sjlj.lsda
	.extern	__Unwind_SjLj_Unregister
	.extern	__iand
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_king_offsets
	.extern	_llvm.stacksave.p0
	.extern	_w_pawn_capture_offsets
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.frameaddress.p0
	.extern	_llvm.stackrestore.p0
	.extern	__ishrs
	.extern	_bishop_offsets
	.extern	_b_pawn_capture_offsets
	.extern	_rook_offsets
	.section	.debug_line,"",@progbits
	.local	.Lline_table_start0
.Lline_table_start0:
