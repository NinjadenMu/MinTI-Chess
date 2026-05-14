	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"movegen.c"
	.section	.text._generate_moves,"ax",@progbits
	.globl	_generate_moves                 ; -- Begin function generate_moves
	.type	_generate_moves,@function
_generate_moves:                        ; @generate_moves
; %bb.0:
	ld	hl, -21
	call	__frameset
	ld	hl, (_state+194)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_2
; %bb.1:
	ld	c, 0
	jr	.LBB0_3
	.local	.LBB0_2
.LBB0_2:
	ld	c, -1
	.local	.LBB0_3
.LBB0_3:
	bit	0, c
	jr	nz, .LBB0_5
; %bb.4:
	ld	iy, _state+160
	jr	.LBB0_6
	.local	.LBB0_5
.LBB0_5:
	ld	iy, _state+128
	.local	.LBB0_6
.LBB0_6:
	ld	hl, (ix + 6)
	ld	a, (_state+192)
	ld	e, a
	ld	a, (_state+193)
	bit	0, c
	jr	nz, .LBB0_8
; %bb.7:
	ld	e, a
	.local	.LBB0_8
.LBB0_8:
	ld	bc, (ix + 9)
	ld	(ix - 3), bc
	ld	bc, 1
	ld	a, e
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_120
; %bb.9:                                ; %.preheader
	or	a, a
	jp	z, .LBB0_243
; %bb.10:                               ; %.lr.ph134.preheader
	or	a, a
	sbc	hl, hl
	lea	bc, iy + 0
	ld	(ix - 6), bc
	ld	iy, 0
	ld	iyl, e
	ld	(ix - 12), iy
	push	hl
	pop	bc
	.local	.LBB0_11
.LBB0_11:                               ; %.lr.ph134
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
	ld	(ix - 9), bc
	push	bc
	pop	hl
	add	hl, hl
	ex	de, hl
	ld	iy, (ix - 6)
	add	iy, de
	ld	a, (iy)
	dec	a
	cp	a, 12
	jp	nc, .LBB0_116
; %bb.12:                               ; %.lr.ph134
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	b, (iy + 1)
	ld	de, 0
	ld	e, a
	ld	hl, JTI0_1
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	ld	(ix - 15), b                    ; 1-byte Folded Spill
	jp	(hl)
	.local	.LBB0_13
.LBB0_13:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	hl, (_state+194)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, _w_pawn_capture_offsets
	ld	(ix - 18), hl
	jr	z, .LBB0_15
; %bb.14:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	hl, _b_pawn_capture_offsets
	ld	(ix - 18), hl
	.local	.LBB0_15
.LBB0_15:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	a, 1
	ld	c, a
	ld	de, 0
	.local	.LBB0_16
.LBB0_16:                               ;   Parent Loop BB0_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	hl, (ix - 18)
	add	hl, de
	ld	a, (hl)
	add	a, b
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB0_29
; %bb.17:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	a, (_state+197)
	ld	l, a
	ld	a, e
	cp	a, l
	jr	nz, .LBB0_20
; %bb.18:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	a, (_state+198)
	bit	0, a
	jr	z, .LBB0_20
; %bb.19:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	iy, (ix - 3)
	ld	(iy), 8
	ld	(iy + 1), e
	ld	(iy + 2), b
	lea	iy, iy + 3
	jp	.LBB0_28
	.local	.LBB0_20
.LBB0_20:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	d, c
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_22
; %bb.21:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_23
	.local	.LBB0_22
.LBB0_22:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	ld	c, d
	jp	.LBB0_29
	.local	.LBB0_23
.LBB0_23:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	a, e
	cp	a, 16
	ld	c, d
	jr	nc, .LBB0_25
; %bb.24:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	hl, (ix - 3)
	ld	(hl), -112
	ld	iy, (ix - 3)
	ld	(iy + 1), e
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	ld	iy, (ix - 3)
	ld	(iy + 2), b
	ld	iy, (ix - 3)
	ld	(iy + 3), 112
	ld	iy, (ix - 3)
	ld	(iy + 4), e
	ld	iy, (ix - 3)
	ld	(iy + 5), b
	ld	iy, (ix - 3)
	ld	(iy + 6), 80
	ld	iy, (ix - 3)
	ld	(iy + 7), e
	ld	iy, (ix - 3)
	ld	(iy + 8), b
	ld	iy, (ix - 3)
	ld	(iy + 9), 48
	jr	.LBB0_27
	.local	.LBB0_25
.LBB0_25:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	a, e
	cp	a, 112
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	c, .LBB0_30
; %bb.26:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	hl, (ix - 3)
	ld	(hl), -96
	ld	iy, (ix - 3)
	ld	(iy + 1), e
	ld	iy, (ix - 3)
	ld	(iy + 2), b
	ld	iy, (ix - 3)
	ld	(iy + 3), -128
	ld	iy, (ix - 3)
	ld	(iy + 4), e
	ld	iy, (ix - 3)
	ld	(iy + 5), b
	ld	iy, (ix - 3)
	ld	(iy + 6), 96
	ld	iy, (ix - 3)
	ld	(iy + 7), e
	ld	iy, (ix - 3)
	ld	(iy + 8), b
	ld	iy, (ix - 3)
	ld	(iy + 9), 64
	.local	.LBB0_27
.LBB0_27:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	iy, (ix - 3)
	ld	(iy + 10), e
	ld	iy, (ix - 3)
	ld	(iy + 11), b
	ld	iy, (ix - 3)
	lea	iy, iy + 12
	.local	.LBB0_28
.LBB0_28:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	(ix - 3), iy
	.local	.LBB0_29
.LBB0_29:                               ;   in Loop: Header=BB0_16 Depth=2
	bit	0, c
	ld	a, 0
	ld	c, a
	ld	de, 1
	jp	nz, .LBB0_16
	jp	.LBB0_116
	.local	.LBB0_30
.LBB0_30:                               ;   in Loop: Header=BB0_16 Depth=2
	ld	iy, (ix - 3)
	lea	hl, iy + 3
	ld	(iy), 0
	ld	(iy + 1), e
	ld	(iy + 2), b
	ld	(ix - 3), hl
	jr	.LBB0_29
	.local	.LBB0_31
.LBB0_31:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	hl, (ix - 3)
	push	hl
	ld	l, b
	push	hl
	call	_generate_bishop_captures_at
	pop	de
	pop	de
	push	hl
	ld	l, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_34
	.local	.LBB0_32
.LBB0_32:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	hl, (ix - 3)
	push	hl
	ld	l, b
	push	hl
	call	_generate_bishop_captures_at
	jr	.LBB0_35
	.local	.LBB0_33
.LBB0_33:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	hl, (ix - 3)
	push	hl
	ld	l, b
	.local	.LBB0_34
.LBB0_34:                               ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_11 Depth=1
	push	hl
	call	_generate_rook_captures_at
	.local	.LBB0_35
.LBB0_35:                               ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	(ix - 3), hl
	pop	hl
	pop	hl
	jp	.LBB0_116
	.local	.LBB0_36
.LBB0_36:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	l, -14
	ld	a, b
	add	a, l
	ld	e, a
	ld	c, -120
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_44
; %bb.37:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, -18
	jr	z, .LBB0_39
; %bb.38:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_83
	.local	.LBB0_39
.LBB0_39:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_45
	.local	.LBB0_40
.LBB0_40:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	l, -16
	ld	a, b
	add	a, l
	ld	e, a
	ld	c, -120
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jp	nz, .LBB0_73
; %bb.41:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, -15
	jr	z, .LBB0_43
; %bb.42:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_89
	.local	.LBB0_43
.LBB0_43:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jp	.LBB0_74
	.local	.LBB0_44
.LBB0_44:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, -18
	.local	.LBB0_45
.LBB0_45:                               ; %generate_stepping_captures_at.exit.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_49
; %bb.46:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, -31
	jr	z, .LBB0_48
; %bb.47:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_84
	.local	.LBB0_48
.LBB0_48:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_50
	.local	.LBB0_49
.LBB0_49:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, -31
	.local	.LBB0_50
.LBB0_50:                               ; %generate_stepping_captures_at.exit.1.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_54
; %bb.51:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, -33
	jr	z, .LBB0_53
; %bb.52:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_85
	.local	.LBB0_53
.LBB0_53:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_55
	.local	.LBB0_54
.LBB0_54:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, -33
	.local	.LBB0_55
.LBB0_55:                               ; %generate_stepping_captures_at.exit.2.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_59
; %bb.56:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 14
	jr	z, .LBB0_58
; %bb.57:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_86
	.local	.LBB0_58
.LBB0_58:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_60
	.local	.LBB0_59
.LBB0_59:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 14
	.local	.LBB0_60
.LBB0_60:                               ; %generate_stepping_captures_at.exit.3.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_64
; %bb.61:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 18
	jr	z, .LBB0_63
; %bb.62:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_87
	.local	.LBB0_63
.LBB0_63:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_65
	.local	.LBB0_64
.LBB0_64:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 18
	.local	.LBB0_65
.LBB0_65:                               ; %generate_stepping_captures_at.exit.4.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_69
; %bb.66:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 31
	jr	z, .LBB0_68
; %bb.67:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_88
	.local	.LBB0_68
.LBB0_68:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_70
	.local	.LBB0_69
.LBB0_69:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 31
	.local	.LBB0_70
.LBB0_70:                               ; %generate_stepping_captures_at.exit.5.i
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_72
; %bb.71:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 33
	jp	nz, .LBB0_109
	jp	.LBB0_110
	.local	.LBB0_72
.LBB0_72:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 33
	jp	.LBB0_112
	.local	.LBB0_73
.LBB0_73:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, -15
	.local	.LBB0_74
.LBB0_74:                               ; %generate_stepping_captures_at.exit.i47
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_78
; %bb.75:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 17
	jr	z, .LBB0_77
; %bb.76:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_90
	.local	.LBB0_77
.LBB0_77:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_79
	.local	.LBB0_78
.LBB0_78:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 17
	.local	.LBB0_79
.LBB0_79:                               ; %generate_stepping_captures_at.exit.1.i50
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	e, b
	inc	e
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jp	nz, .LBB0_92
; %bb.80:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_82
; %bb.81:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_91
	.local	.LBB0_82
.LBB0_82:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jp	.LBB0_92
	.local	.LBB0_83
.LBB0_83:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_45
	.local	.LBB0_84
.LBB0_84:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_50
	.local	.LBB0_85
.LBB0_85:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_55
	.local	.LBB0_86
.LBB0_86:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_60
	.local	.LBB0_87
.LBB0_87:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_65
	.local	.LBB0_88
.LBB0_88:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_70
	.local	.LBB0_89
.LBB0_89:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_74
	.local	.LBB0_90
.LBB0_90:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_79
	.local	.LBB0_91
.LBB0_91:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	.local	.LBB0_92
.LBB0_92:                               ; %generate_stepping_captures_at.exit.2.i53
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_96
; %bb.93:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 16
	jr	z, .LBB0_95
; %bb.94:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_117
	.local	.LBB0_95
.LBB0_95:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_97
	.local	.LBB0_96
.LBB0_96:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 16
	.local	.LBB0_97
.LBB0_97:                               ; %generate_stepping_captures_at.exit.3.i56
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_101
; %bb.98:                               ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, 15
	jr	z, .LBB0_100
; %bb.99:                               ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_118
	.local	.LBB0_100
.LBB0_100:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_102
	.local	.LBB0_101
.LBB0_101:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	d, 15
	.local	.LBB0_102
.LBB0_102:                              ; %generate_stepping_captures_at.exit.4.i59
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_106
; %bb.103:                              ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	ld	d, -17
	jr	z, .LBB0_105
; %bb.104:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_119
	.local	.LBB0_105
.LBB0_105:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_107
	.local	.LBB0_106
.LBB0_106:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	d, -17
	.local	.LBB0_107
.LBB0_107:                              ; %generate_stepping_captures_at.exit.5.i62
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	e, b
	dec	e
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_112
; %bb.108:                              ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_110
	.local	.LBB0_109
.LBB0_109:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_111
	.local	.LBB0_110
.LBB0_110:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -120
	ld	b, (ix - 15)                    ; 1-byte Folded Reload
	jr	.LBB0_112
	.local	.LBB0_111
.LBB0_111:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	.local	.LBB0_112
.LBB0_112:                              ; %generate_stepping_captures_at.exit.6.i65
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	a, b
	add	a, d
	ld	e, a
	ld	a, e
	and	a, c
	ld	l, a
	or	a, a
	jr	nz, .LBB0_116
; %bb.113:                              ;   in Loop: Header=BB0_11 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_116
; %bb.114:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_116
; %bb.115:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB0_116
.LBB0_116:                              ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_11 Depth=1
	ld	bc, (ix - 9)
	inc	bc
	push	bc
	pop	hl
	ld	de, (ix - 12)
	or	a, a
	sbc	hl, de
	jp	nz, .LBB0_11
	jp	.LBB0_243
	.local	.LBB0_117
.LBB0_117:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_97
	.local	.LBB0_118
.LBB0_118:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_102
	.local	.LBB0_119
.LBB0_119:                              ;   in Loop: Header=BB0_11 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	ld	b, a
	ld	c, -120
	jp	.LBB0_107
	.local	.LBB0_120
.LBB0_120:                              ; %.preheader128
	or	a, a
	jp	z, .LBB0_243
; %bb.121:                              ; %.lr.ph.preheader
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	inc	iy
	ld	(ix - 6), iy
	.local	.LBB0_122
.LBB0_122:                              ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 3)
	ld	iy, (ix - 6)
	ld	a, (iy - 1)
	dec	a
	cp	a, 12
	jr	c, .LBB0_124
	.local	.LBB0_123
.LBB0_123:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	(ix - 3), hl
	jp	.LBB0_242
	.local	.LBB0_124
.LBB0_124:                              ; %.lr.ph
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	(ix - 9), hl
	ld	hl, (ix - 6)
	ld	l, (hl)
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 0
	ld	e, a
	ld	hl, JTI0_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	e, iyl
	ld	hl, (hl)
	ld	(ix - 15), bc
	ld	(ix - 12), e                    ; 1-byte Folded Spill
	jp	(hl)
	.local	.LBB0_125
.LBB0_125:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (_state+194)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_143
; %bb.126:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -16
	ld	a, (ix - 12)
	add	a, l
	ld	e, a
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	(ix - 18), hl
	ld	a, (hl)
	or	a, a
	jp	nz, .LBB0_180
; %bb.127:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	cp	a, 16
	jp	c, .LBB0_235
; %bb.128:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	lea	hl, iy + 3
	ld	(ix - 3), hl
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	l, -16
	and	a, l
	ld	l, a
	cp	a, 96
	ld	bc, (ix - 15)
	jp	nz, .LBB0_242
; %bb.129:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 18)
	ld	a, (iy - 16)
	or	a, a
	jp	nz, .LBB0_242
; %bb.130:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	e, -32
	ld	l, (ix - 12)                    ; 1-byte Folded Reload
	ld	a, l
	add	a, e
	ld	e, a
	ld	a, l
	ld	iy, (ix - 9)
	ld	(iy + 3), 0
	ld	bc, 4
	jp	.LBB0_238
	.local	.LBB0_131
.LBB0_131:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, e
	push	hl
	call	_generate_bishop_moves_at
	pop	de
	pop	de
	push	hl
	ld	l, (ix - 12)                    ; 1-byte Folded Reload
	jr	.LBB0_134
	.local	.LBB0_132
.LBB0_132:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, e
	push	hl
	call	_generate_bishop_moves_at
	jr	.LBB0_135
	.local	.LBB0_133
.LBB0_133:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, e
	.local	.LBB0_134
.LBB0_134:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_122 Depth=1
	push	hl
	call	_generate_rook_moves_at
	.local	.LBB0_135
.LBB0_135:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	(ix - 3), hl
	pop	hl
	pop	hl
	jp	.LBB0_242
	.local	.LBB0_136
.LBB0_136:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -14
	ld	h, e
	ld	a, h
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	ld	d, -31
	jp	nz, .LBB0_148
; %bb.137:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ld	l, -18
	jp	nz, .LBB0_149
; %bb.138:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jp	.LBB0_150
	.local	.LBB0_139
.LBB0_139:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (_state+194)
	ld	(ix - 3), hl
	ld	l, -16
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_142
; %bb.140:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	nz, .LBB0_182
; %bb.141:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_142
.LBB0_142:                              ; %generate_stepping_moves_at.exit.i103
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -15
	jp	.LBB0_183
	.local	.LBB0_143
.LBB0_143:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 16
	ld	a, (ix - 12)
	add	a, l
	ld	e, a
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	nz, .LBB0_180
; %bb.144:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	cp	a, 112
	jp	nc, .LBB0_236
; %bb.145:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	lea	hl, iy + 3
	ld	(ix - 3), hl
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	l, -16
	and	a, l
	ld	l, a
	cp	a, 16
	jp	nz, .LBB0_241
; %bb.146:                              ;   in Loop: Header=BB0_122 Depth=1
	push	bc
	pop	hl
	ld	bc, 16
	call	__ior
	ex	de, hl
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	ld	bc, (ix - 15)
	jp	nz, .LBB0_242
; %bb.147:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy + 3), 0
	ld	bc, 4
	ld	(ix - 3), bc
	inc	bc
	ld	(ix - 18), bc
	inc	bc
	ld	(ix - 21), bc
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	jp	.LBB0_239
	.local	.LBB0_148
.LBB0_148:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -18
	jr	.LBB0_150
	.local	.LBB0_149
.LBB0_149:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_150
.LBB0_150:                              ; %generate_stepping_moves_at.exit.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_154
; %bb.151:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_153
; %bb.152:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_154
	.local	.LBB0_153
.LBB0_153:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_154
.LBB0_154:                              ; %generate_stepping_moves_at.exit.1.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, d
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_157
; %bb.155:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ld	l, -33
	ld	d, 14
	jr	nz, .LBB0_158
; %bb.156:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_159
	.local	.LBB0_157
.LBB0_157:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -33
	ld	d, 14
	jr	.LBB0_159
	.local	.LBB0_158
.LBB0_158:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_159
.LBB0_159:                              ; %generate_stepping_moves_at.exit.2.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_163
; %bb.160:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_162
; %bb.161:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_163
	.local	.LBB0_162
.LBB0_162:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_163
.LBB0_163:                              ; %generate_stepping_moves_at.exit.3.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, d
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_166
; %bb.164:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ld	l, 18
	ld	d, 31
	jr	nz, .LBB0_167
; %bb.165:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_168
	.local	.LBB0_166
.LBB0_166:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 18
	ld	d, 31
	jr	.LBB0_168
	.local	.LBB0_167
.LBB0_167:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_168
.LBB0_168:                              ; %generate_stepping_moves_at.exit.4.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_172
; %bb.169:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_171
; %bb.170:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_172
	.local	.LBB0_171
.LBB0_171:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_172
.LBB0_172:                              ; %generate_stepping_moves_at.exit.5.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, d
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_175
; %bb.173:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ld	l, 33
	jr	nz, .LBB0_176
; %bb.174:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	bc, (ix - 15)
	jr	.LBB0_177
	.local	.LBB0_175
.LBB0_175:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 33
	jr	.LBB0_177
	.local	.LBB0_176
.LBB0_176:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_177
.LBB0_177:                              ; %generate_stepping_moves_at.exit.6.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, h
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_181
; %bb.178:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 0
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_180
; %bb.179:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 12)
	ld	(iy + 2), a
	lea	hl, iy + 3
	jp	.LBB0_240
	.local	.LBB0_180
.LBB0_180:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	jp	.LBB0_240
	.local	.LBB0_181
.LBB0_181:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	jp	.LBB0_123
	.local	.LBB0_182
.LBB0_182:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -15
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_183
.LBB0_183:                              ; %generate_stepping_moves_at.exit.i103
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_187
; %bb.184:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_186
; %bb.185:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	jr	.LBB0_187
	.local	.LBB0_186
.LBB0_186:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_187
.LBB0_187:                              ; %generate_stepping_moves_at.exit.1.i106
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	c, e
	inc	c
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_190
; %bb.188:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_191
; %bb.189:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_190
.LBB0_190:                              ; %generate_stepping_moves_at.exit.2.i109
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 17
	jr	.LBB0_192
	.local	.LBB0_191
.LBB0_191:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 17
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_192
.LBB0_192:                              ; %generate_stepping_moves_at.exit.2.i109
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_195
; %bb.193:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_196
; %bb.194:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_195
.LBB0_195:                              ; %generate_stepping_moves_at.exit.3.i112
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 16
	jr	.LBB0_197
	.local	.LBB0_196
.LBB0_196:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 16
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_197
.LBB0_197:                              ; %generate_stepping_moves_at.exit.3.i112
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_200
; %bb.198:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_201
; %bb.199:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_200
.LBB0_200:                              ; %generate_stepping_moves_at.exit.4.i115
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 15
	jr	.LBB0_202
	.local	.LBB0_201
.LBB0_201:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 15
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_202
.LBB0_202:                              ; %generate_stepping_moves_at.exit.4.i115
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_206
; %bb.203:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_205
; %bb.204:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	jr	.LBB0_206
	.local	.LBB0_205
.LBB0_205:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_206
.LBB0_206:                              ; %generate_stepping_moves_at.exit.5.i118
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	c, e
	dec	c
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_209
; %bb.207:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_210
; %bb.208:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), e
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_209
.LBB0_209:                              ; %generate_stepping_moves_at.exit.6.i121
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -17
	jr	.LBB0_211
	.local	.LBB0_210
.LBB0_210:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, -17
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB0_211
.LBB0_211:                              ; %generate_stepping_moves_at.exit.6.i121
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, e
	add	a, l
	ld	c, a
	ld	l, -120
	ld	a, c
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_214
; %bb.212:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_214
; %bb.213:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	a, (ix - 12)
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 9), iy
	.local	.LBB0_214
.LBB0_214:                              ; %generate_stepping_moves_at.exit.7.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 3)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	bc, (ix - 15)
	jr	nz, .LBB0_219
; %bb.215:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (_state+199)
	ld	l, a
	bit	0, l
	jr	z, .LBB0_223
; %bb.216:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, (ix - 6)
	ld	de, 0
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	e, h
	ld	iy, _state
	add	iy, de
	ld	a, (iy + 1)
	or	a, a
	jr	nz, .LBB0_225
; %bb.217:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (iy + 2)
	or	a, a
	jr	nz, .LBB0_225
; %bb.218:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 2
	ld	a, h
	add	a, l
	ld	l, a
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), h
	lea	hl, iy + 3
	ld	(ix - 3), hl
	ld	a, (_state+199)
	ld	l, a
	jr	.LBB0_226
	.local	.LBB0_219
.LBB0_219:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (_state+201)
	bit	0, a
	jr	z, .LBB0_224
; %bb.220:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 6)
	ld	de, 0
	ld	h, (ix - 12)                    ; 1-byte Folded Reload
	ld	e, h
	ld	iy, _state
	add	iy, de
	ld	a, (iy + 1)
	or	a, a
	jr	nz, .LBB0_228
; %bb.221:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (iy + 2)
	or	a, a
	jr	nz, .LBB0_228
; %bb.222:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	l, 2
	ld	a, h
	add	a, l
	ld	l, a
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), h
	lea	hl, iy + 3
	jr	.LBB0_229
	.local	.LBB0_223
.LBB0_223:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, (ix - 9)
	ld	(ix - 3), de
	jr	.LBB0_227
	.local	.LBB0_224
.LBB0_224:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	ld	(ix - 3), hl
	jr	.LBB0_230
	.local	.LBB0_225
.LBB0_225:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, (ix - 9)
	ld	(ix - 3), de
	.local	.LBB0_226
.LBB0_226:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_227
.LBB0_227:                              ;   in Loop: Header=BB0_122 Depth=1
	bit	0, l
	jr	nz, .LBB0_231
	jp	.LBB0_242
	.local	.LBB0_228
.LBB0_228:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	hl, (ix - 9)
	.local	.LBB0_229
.LBB0_229:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	(ix - 3), hl
	ld	bc, (ix - 15)
	.local	.LBB0_230
.LBB0_230:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (_state+202)
	bit	0, a
	jp	z, .LBB0_242
	.local	.LBB0_231
.LBB0_231:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	de, 0
	ld	e, (ix - 12)                    ; 1-byte Folded Reload
	ld	hl, _state
	push	hl
	pop	iy
	add	iy, de
	ld	a, (iy - 1)
	or	a, a
	jp	nz, .LBB0_242
; %bb.232:                              ;   in Loop: Header=BB0_122 Depth=1
	ex	de, hl
	ld	de, -2
	add	hl, de
	ld	a, (iy - 2)
	or	a, a
	jp	nz, .LBB0_242
; %bb.233:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	a, (iy - 3)
	or	a, a
	jp	nz, .LBB0_242
; %bb.234:                              ; %.sink.split.i126
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	a, l
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), a
	ld	a, (ix - 12)
	ld	(iy + 2), a
	lea	iy, iy + 3
	ld	(ix - 3), iy
	jp	.LBB0_242
	.local	.LBB0_235
.LBB0_235:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), -112
	ld	(iy + 1), e
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	(iy + 3), 112
	ld	(iy + 4), e
	ld	(iy + 5), a
	ld	(iy + 6), 80
	ld	(iy + 7), e
	ld	(iy + 8), a
	ld	(iy + 9), 48
	jr	.LBB0_237
	.local	.LBB0_236
.LBB0_236:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), -96
	ld	(iy + 1), e
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	(iy + 3), -128
	ld	(iy + 4), e
	ld	(iy + 5), a
	ld	(iy + 6), 96
	ld	(iy + 7), e
	ld	(iy + 8), a
	ld	(iy + 9), 64
	.local	.LBB0_237
.LBB0_237:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, 10
	.local	.LBB0_238
.LBB0_238:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	(ix - 3), bc
	inc	bc
	ld	(ix - 18), bc
	inc	bc
	ld	(ix - 21), bc
	.local	.LBB0_239
.LBB0_239:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_122 Depth=1
	lea	hl, iy + 0
	ld	bc, (ix - 3)
	add	iy, bc
	ld	(iy), e
	push	hl
	pop	iy
	ld	de, (ix - 18)
	add	iy, de
	ld	(iy), a
	ld	de, (ix - 21)
	add	hl, de
	.local	.LBB0_240
.LBB0_240:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	(ix - 3), hl
	.local	.LBB0_241
.LBB0_241:                              ;   in Loop: Header=BB0_122 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_242
.LBB0_242:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_122 Depth=1
	ld	iy, (ix - 6)
	lea	iy, iy + 2
	ld	(ix - 6), iy
	dec	bc
	sbc	hl, hl
	adc	hl, bc
	jp	nz, .LBB0_122
	.local	.LBB0_243
.LBB0_243:                              ; %.loopexit
	ld	hl, (ix - 3)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_generate_moves, .Lfunc_end0-_generate_moves
	.section	.rodata._generate_moves,"a",@progbits
JTI0_0:
	d24	.LBB0_125
	d24	.LBB0_125
	d24	.LBB0_136
	d24	.LBB0_136
	d24	.LBB0_132
	d24	.LBB0_132
	d24	.LBB0_133
	d24	.LBB0_133
	d24	.LBB0_131
	d24	.LBB0_131
	d24	.LBB0_139
	d24	.LBB0_139
JTI0_1:
	d24	.LBB0_13
	d24	.LBB0_13
	d24	.LBB0_36
	d24	.LBB0_36
	d24	.LBB0_32
	d24	.LBB0_32
	d24	.LBB0_33
	d24	.LBB0_33
	d24	.LBB0_31
	d24	.LBB0_31
	d24	.LBB0_40
	d24	.LBB0_40
                                        ; -- End function
	.section	.text._generate_bishop_captures_at,"ax",@progbits
	.type	_generate_bishop_captures_at,@function ; -- Begin function generate_bishop_captures_at
_generate_bishop_captures_at:           ; @generate_bishop_captures_at
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	b, -15
	ld	h, -120
	ld	c, (ix + 6)
	ld	iy, 0
	.local	.LBB1_1
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	ld	a, c
	add	a, b
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB1_5
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	lea	de, iy + 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_1
; %bb.3:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	lea	de, iy + 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	nz, .LBB1_6
; %bb.4:
	ld	b, (ix + 6)
	ld	iy, (ix + 9)
	jr	.LBB1_7
	.local	.LBB1_5
.LBB1_5:
	ld	b, (ix + 6)
	ld	iy, (ix + 9)
	jr	.LBB1_8
	.local	.LBB1_6
.LBB1_6:
	ld	iy, (ix + 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	b, (ix + 6)
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB1_7
.LBB1_7:                                ; %generate_sliding_captures_at.exit40
	ld	h, -120
	.local	.LBB1_8
.LBB1_8:                                ; %generate_sliding_captures_at.exit40
	ld	c, b
	.local	.LBB1_9
.LBB1_9:                                ; =>This Inner Loop Header: Depth=1
	ld	l, 17
	ld	a, c
	add	a, l
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB1_14
; %bb.10:                               ;   in Loop: Header=BB1_9 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_9
; %bb.11:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	z, .LBB1_13
; %bb.12:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB1_13
.LBB1_13:                               ; %generate_sliding_captures_at.exit29
	ld	h, -120
	.local	.LBB1_14
.LBB1_14:                               ; %generate_sliding_captures_at.exit29
	ld	c, b
	.local	.LBB1_15
.LBB1_15:                               ; =>This Inner Loop Header: Depth=1
	ld	l, 15
	ld	a, c
	add	a, l
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB1_20
; %bb.16:                               ;   in Loop: Header=BB1_15 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_15
; %bb.17:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	z, .LBB1_19
; %bb.18:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB1_19
.LBB1_19:                               ; %generate_sliding_captures_at.exit18
	ld	h, -120
	.local	.LBB1_20
.LBB1_20:                               ; %generate_sliding_captures_at.exit18
	ld	c, b
	.local	.LBB1_21
.LBB1_21:                               ; =>This Inner Loop Header: Depth=1
	ld	l, -17
	ld	a, c
	add	a, l
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB1_26
; %bb.22:                               ;   in Loop: Header=BB1_21 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_21
; %bb.23:
	ld	(ix - 3), iy
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	iyl, a
	ld	hl, (_state+194)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB1_25
; %bb.24:
	ld	iy, (ix - 3)
	jr	.LBB1_26
	.local	.LBB1_25
.LBB1_25:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB1_26
.LBB1_26:                               ; %generate_sliding_captures_at.exit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_generate_bishop_captures_at, .Lfunc_end1-_generate_bishop_captures_at
                                        ; -- End function
	.section	.text._generate_rook_captures_at,"ax",@progbits
	.type	_generate_rook_captures_at,@function ; -- Begin function generate_rook_captures_at
_generate_rook_captures_at:             ; @generate_rook_captures_at
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	b, -16
	ld	h, -120
	ld	c, (ix + 6)
	ld	iy, 0
	.local	.LBB2_1
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	ld	a, c
	add	a, b
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB2_5
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	lea	de, iy + 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_1
; %bb.3:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	lea	de, iy + 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	nz, .LBB2_6
; %bb.4:
	ld	b, (ix + 6)
	ld	iy, (ix + 9)
	jr	.LBB2_7
	.local	.LBB2_5
.LBB2_5:
	ld	b, (ix + 6)
	ld	iy, (ix + 9)
	jr	.LBB2_8
	.local	.LBB2_6
.LBB2_6:
	ld	iy, (ix + 9)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	b, (ix + 6)
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB2_7
.LBB2_7:                                ; %generate_sliding_captures_at.exit40
	ld	h, -120
	.local	.LBB2_8
.LBB2_8:                                ; %generate_sliding_captures_at.exit40
	ld	c, b
	.local	.LBB2_9
.LBB2_9:                                ; =>This Inner Loop Header: Depth=1
	inc	c
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB2_14
; %bb.10:                               ;   in Loop: Header=BB2_9 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_9
; %bb.11:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	z, .LBB2_13
; %bb.12:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB2_13
.LBB2_13:                               ; %generate_sliding_captures_at.exit29
	ld	h, -120
	.local	.LBB2_14
.LBB2_14:                               ; %generate_sliding_captures_at.exit29
	ld	c, b
	.local	.LBB2_15
.LBB2_15:                               ; =>This Inner Loop Header: Depth=1
	ld	l, 16
	ld	a, c
	add	a, l
	ld	c, a
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB2_20
; %bb.16:                               ;   in Loop: Header=BB2_15 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_15
; %bb.17:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 0
	ld	e, l
	ld	hl, (_state+194)
	or	a, a
	sbc	hl, de
	jr	z, .LBB2_19
; %bb.18:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB2_19
.LBB2_19:                               ; %generate_sliding_captures_at.exit18
	ld	h, -120
	.local	.LBB2_20
.LBB2_20:                               ; %generate_sliding_captures_at.exit18
	ld	c, b
	.local	.LBB2_21
.LBB2_21:                               ; =>This Inner Loop Header: Depth=1
	dec	c
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB2_26
; %bb.22:                               ;   in Loop: Header=BB2_21 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, _state
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_21
; %bb.23:
	ld	(ix - 3), iy
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	iyl, a
	ld	hl, (_state+194)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB2_25
; %bb.24:
	ld	iy, (ix - 3)
	jr	.LBB2_26
	.local	.LBB2_25
.LBB2_25:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	.local	.LBB2_26
.LBB2_26:                               ; %generate_sliding_captures_at.exit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_generate_rook_captures_at, .Lfunc_end2-_generate_rook_captures_at
                                        ; -- End function
	.section	.text._generate_bishop_moves_at,"ax",@progbits
	.type	_generate_bishop_moves_at,@function ; -- Begin function generate_bishop_moves_at
_generate_bishop_moves_at:              ; @generate_bishop_moves_at
; %bb.0:
	call	__frameset0
	ld	c, (ix + 6)
	ld	iy, (ix + 9)
	ld	l, -15
	ld	a, c
	add	a, l
	ld	h, a
	ld	de, 0
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB3_4
; %bb.1:                                ; %.lr.ph.preheader
	ld	l, -30
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_2
.LBB3_2:                                ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB3_4
; %bb.3:                                ;   in Loop: Header=BB3_2 Depth=1
	ld	l, 15
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, -15
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB3_2
	.local	.LBB3_4
.LBB3_4:                                ; %generate_sliding_moves_at.exit34
	ld	l, 17
	ld	a, c
	add	a, l
	ld	h, a
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB3_8
; %bb.5:                                ; %.lr.ph64.preheader
	ld	l, 34
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_6
.LBB3_6:                                ; %.lr.ph64
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB3_8
; %bb.7:                                ;   in Loop: Header=BB3_6 Depth=1
	ld	l, -17
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, 17
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB3_6
	.local	.LBB3_8
.LBB3_8:                                ; %generate_sliding_moves_at.exit25
	ld	l, 15
	ld	a, c
	add	a, l
	ld	h, a
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB3_12
; %bb.9:                                ; %.lr.ph72.preheader
	ld	l, 30
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_10
.LBB3_10:                               ; %.lr.ph72
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB3_12
; %bb.11:                               ;   in Loop: Header=BB3_10 Depth=1
	ld	l, -15
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, 15
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB3_10
	.local	.LBB3_12
.LBB3_12:                               ; %generate_sliding_moves_at.exit16
	ld	l, -17
	ld	a, c
	add	a, l
	ld	h, a
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB3_16
; %bb.13:                               ; %.lr.ph80.preheader
	ld	l, -34
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_14
.LBB3_14:                               ; %.lr.ph80
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB3_16
; %bb.15:                               ;   in Loop: Header=BB3_14 Depth=1
	ld	l, 17
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, -17
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB3_14
	.local	.LBB3_16
.LBB3_16:                               ; %generate_sliding_moves_at.exit
	lea	hl, iy + 0
	pop	ix
	ret
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_generate_bishop_moves_at, .Lfunc_end3-_generate_bishop_moves_at
                                        ; -- End function
	.section	.text._generate_rook_moves_at,"ax",@progbits
	.type	_generate_rook_moves_at,@function ; -- Begin function generate_rook_moves_at
_generate_rook_moves_at:                ; @generate_rook_moves_at
; %bb.0:
	call	__frameset0
	ld	c, (ix + 6)
	ld	iy, (ix + 9)
	ld	l, -16
	ld	a, c
	add	a, l
	ld	h, a
	ld	de, 0
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_4
; %bb.1:                                ; %.lr.ph.preheader
	ld	l, -32
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_2
.LBB4_2:                                ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB4_4
; %bb.3:                                ;   in Loop: Header=BB4_2 Depth=1
	ld	l, 16
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, -16
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB4_2
	.local	.LBB4_4
.LBB4_4:                                ; %generate_sliding_moves_at.exit34
	ld	h, c
	inc	h
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_8
; %bb.5:                                ; %.lr.ph64.preheader
	ld	l, 2
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_6
.LBB4_6:                                ; %.lr.ph64
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB4_8
; %bb.7:                                ;   in Loop: Header=BB4_6 Depth=1
	ld	a, b
	dec	a
	ld	(iy), 0
	ld	(iy + 1), a
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	inc	b
	or	a, a
	jr	z, .LBB4_6
	.local	.LBB4_8
.LBB4_8:                                ; %generate_sliding_moves_at.exit25
	ld	l, 16
	ld	a, c
	add	a, l
	ld	h, a
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_12
; %bb.9:                                ; %.lr.ph72.preheader
	ld	l, 32
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_10
.LBB4_10:                               ; %.lr.ph72
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB4_12
; %bb.11:                               ;   in Loop: Header=BB4_10 Depth=1
	ld	l, -16
	ld	a, b
	add	a, l
	ld	l, a
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	ld	h, 16
	ld	a, b
	add	a, h
	ld	b, a
	ld	a, l
	or	a, a
	jr	z, .LBB4_10
	.local	.LBB4_12
.LBB4_12:                               ; %generate_sliding_moves_at.exit16
	ld	h, c
	dec	h
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_16
; %bb.13:                               ; %.lr.ph80.preheader
	ld	l, -2
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_14
.LBB4_14:                               ; %.lr.ph80
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB4_16
; %bb.15:                               ;   in Loop: Header=BB4_14 Depth=1
	ld	a, b
	inc	a
	ld	(iy), 0
	ld	(iy + 1), a
	ld	(iy + 2), c
	lea	iy, iy + 3
	ld	de, 0
	ld	e, b
	ld	l, -120
	ld	a, b
	and	a, l
	ld	l, a
	dec	b
	or	a, a
	jr	z, .LBB4_14
	.local	.LBB4_16
.LBB4_16:                               ; %generate_sliding_moves_at.exit
	lea	hl, iy + 0
	pop	ix
	ret
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_generate_rook_moves_at, .Lfunc_end4-_generate_rook_moves_at
                                        ; -- End function
	.section	.rodata._w_pawn_capture_offsets,"a",@progbits
	.balign	1
	.local	_w_pawn_capture_offsets
_w_pawn_capture_offsets:
	.ascii	"\361\357"

	.section	.rodata._b_pawn_capture_offsets,"a",@progbits
	.balign	1
	.local	_b_pawn_capture_offsets
_b_pawn_capture_offsets:
	.ascii	"\021\017"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.eh.sjlj.lsda
	.extern	_state
	.extern	__Unwind_SjLj_Unregister
	.extern	__frameset
	.extern	__ior
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stacksave.p0
	.extern	__frameset0
	.extern	_llvm.frameaddress.p0
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.stackrestore.p0
