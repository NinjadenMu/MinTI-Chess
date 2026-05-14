	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"movegen.c"
	.section	.text._generate_moves,"ax",@progbits
	.globl	_generate_moves                 ; -- Begin function generate_moves
	.type	_generate_moves,@function
_generate_moves:                        ; @generate_moves
; %bb.0:
	ld	hl, -25
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, 194
	add	hl, de
	ld	(ix - 6), hl
	ld	hl, (hl)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_2
; %bb.1:
	ld	a, 0
	jr	.LBB0_3
	.local	.LBB0_2
.LBB0_2:
	ld	a, -1
	.local	.LBB0_3
.LBB0_3:
	ld	iy, (ix + 9)
	ld	bc, 0
	bit	0, a
	jr	nz, .LBB0_5
; %bb.4:
	ld	bc, 32
	.local	.LBB0_5
.LBB0_5:
	lea	hl, iy + 0
	add	hl, bc
	ld	(ix - 3), hl
	rrc	a
	sbc	hl, hl
	ex	de, hl
	add	iy, de
	ld	e, (iy + 65)
	ld	hl, (ix + 12)
	ld	a, e
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_115
; %bb.6:                                ; %.preheader
	or	a, a
	jp	z, .LBB0_116
; %bb.7:                                ; %.lr.ph149
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	(ix - 12), hl
	ld	bc, 0
	ld	iy, (ix + 15)
	.local	.LBB0_8
.LBB0_8:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_14 Depth 2
	ld	(ix - 9), iy
	push	bc
	pop	hl
	add	hl, hl
	ex	de, hl
	ld	iy, (ix - 3)
	add	iy, de
	ld	a, (iy)
	dec	a
	cp	a, 12
	jr	c, .LBB0_10
	.local	.LBB0_9
.LBB0_9:                                ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	jp	.LBB0_114
	.local	.LBB0_10
.LBB0_10:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	l, (iy + 1)
	ld	de, 0
	ld	e, a
	ld	a, l
	ld	hl, JTI0_1
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	ld	(ix - 15), bc
	ld	(ix - 16), a                    ; 1-byte Folded Spill
	jp	(hl)
	.local	.LBB0_11
.LBB0_11:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	hl, (ix - 6)
	ld	hl, (hl)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, _w_pawn_capture_offsets
	ld	(ix - 22), hl
	jr	z, .LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	hl, _b_pawn_capture_offsets
	ld	(ix - 22), hl
	.local	.LBB0_13
.LBB0_13:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	a, 1
	ld	de, 0
	ld	iy, (ix - 9)
	.local	.LBB0_14
.LBB0_14:                               ;   Parent Loop BB0_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 19), a
	ld	hl, (ix - 22)
	add	hl, de
	ld	a, (hl)
	ld	l, (ix - 16)
	add	a, l
	ld	e, a
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_22
; %bb.15:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	(ix - 9), iy
	ld	iy, (ix + 6)
	lea	hl, iy + 0
	ld	bc, 197
	add	hl, bc
	ld	l, (hl)
	ld	a, e
	cp	a, l
	jr	nz, .LBB0_18
; %bb.16:                               ;   in Loop: Header=BB0_14 Depth=2
	lea	hl, iy + 0
	ld	bc, 198
	add	hl, bc
	bit	0, (hl)
	jr	z, .LBB0_18
; %bb.17:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	iy, (ix - 9)
	ld	(iy), 8
	ld	(iy + 1), e
	ld	a, (ix - 16)
	ld	(iy + 2), a
	lea	iy, iy + 3
	jr	.LBB0_21
	.local	.LBB0_18
.LBB0_18:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_20
; %bb.19:                               ;   in Loop: Header=BB0_14 Depth=2
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
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_23
	.local	.LBB0_20
.LBB0_20:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	iy, (ix - 9)
	.local	.LBB0_21
.LBB0_21:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	bc, (ix - 15)
	.local	.LBB0_22
.LBB0_22:                               ;   in Loop: Header=BB0_14 Depth=2
	bit	0, (ix - 19)                    ; 1-byte Folded Reload
	ld	a, 0
	ld	de, 1
	jp	nz, .LBB0_14
	jp	.LBB0_114
	.local	.LBB0_23
.LBB0_23:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	a, e
	cp	a, 16
	ld	iy, (ix - 9)
	ld	bc, (ix - 15)
	ld	l, (ix - 16)                    ; 1-byte Folded Reload
	jr	nc, .LBB0_25
; %bb.24:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	(iy), -112
	ld	(iy + 1), e
	ld	(iy + 2), l
	ld	(iy + 3), 112
	ld	(iy + 4), e
	ld	(iy + 5), l
	ld	(iy + 6), 80
	ld	(iy + 7), e
	ld	(iy + 8), l
	ld	(iy + 9), 48
	jr	.LBB0_27
	.local	.LBB0_25
.LBB0_25:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	a, e
	cp	a, 112
	jr	c, .LBB0_28
; %bb.26:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	(iy), -96
	ld	(iy + 1), e
	ld	(iy + 2), l
	ld	(iy + 3), -128
	ld	(iy + 4), e
	ld	(iy + 5), l
	ld	(iy + 6), 96
	ld	(iy + 7), e
	ld	(iy + 8), l
	ld	(iy + 9), 64
	.local	.LBB0_27
.LBB0_27:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	(iy + 10), e
	ld	(iy + 11), l
	lea	iy, iy + 12
	jr	.LBB0_22
	.local	.LBB0_28
.LBB0_28:                               ;   in Loop: Header=BB0_14 Depth=2
	ld	a, l
	lea	hl, iy + 3
	ld	(iy), 0
	ld	(iy + 1), e
	ld	(iy + 2), a
	push	hl
	pop	iy
	jp	.LBB0_22
	.local	.LBB0_29
.LBB0_29:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_generate_bishop_captures_at
	pop	de
	pop	de
	pop	de
	push	hl
	ld	l, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_32
	.local	.LBB0_30
.LBB0_30:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_generate_bishop_captures_at
	jr	.LBB0_33
	.local	.LBB0_31
.LBB0_31:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	hl, (ix - 9)
	push	hl
	ld	l, a
	.local	.LBB0_32
.LBB0_32:                               ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_8 Depth=1
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_generate_rook_captures_at
	.local	.LBB0_33
.LBB0_33:                               ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	push	hl
	pop	iy
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB0_114
	.local	.LBB0_34
.LBB0_34:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -14
	ld	h, a
	ld	a, h
	add	a, l
	ld	e, a
	ld	d, -120
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	ld	iy, (ix + 6)
	jr	nz, .LBB0_42
; %bb.35:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	hl, iy + 0
	ld	iy, 0
	lea	bc, iy + 0
	ld	c, e
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_37
; %bb.36:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_52
	.local	.LBB0_37
.LBB0_37:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_43
	.local	.LBB0_38
.LBB0_38:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -16
	ld	h, a
	ld	a, h
	add	a, l
	ld	e, a
	ld	d, -120
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	ld	iy, (ix + 6)
	jr	nz, .LBB0_47
; %bb.39:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	hl, iy + 0
	ld	iy, 0
	lea	bc, iy + 0
	ld	c, e
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_41
; %bb.40:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_80
	.local	.LBB0_41
.LBB0_41:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_48
	.local	.LBB0_42
.LBB0_42:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, 0
	.local	.LBB0_43
.LBB0_43:                               ; %generate_stepping_captures_at.exit.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -18
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jp	nz, .LBB0_54
; %bb.44:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_46
; %bb.45:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_53
	.local	.LBB0_46
.LBB0_46:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jp	.LBB0_54
	.local	.LBB0_47
.LBB0_47:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, 0
	.local	.LBB0_48
.LBB0_48:                               ; %generate_stepping_captures_at.exit.i63
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -15
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jp	nz, .LBB0_82
; %bb.49:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_51
; %bb.50:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_81
	.local	.LBB0_51
.LBB0_51:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jp	.LBB0_82
	.local	.LBB0_52
.LBB0_52:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	jp	.LBB0_43
	.local	.LBB0_53
.LBB0_53:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_54
.LBB0_54:                               ; %generate_stepping_captures_at.exit.1.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -31
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_59
; %bb.55:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_57
; %bb.56:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_58
	.local	.LBB0_57
.LBB0_57:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_59
	.local	.LBB0_58
.LBB0_58:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_59
.LBB0_59:                               ; %generate_stepping_captures_at.exit.2.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -33
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_64
; %bb.60:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_62
; %bb.61:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_63
	.local	.LBB0_62
.LBB0_62:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_64
	.local	.LBB0_63
.LBB0_63:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_64
.LBB0_64:                               ; %generate_stepping_captures_at.exit.3.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 14
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_69
; %bb.65:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_67
; %bb.66:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_68
	.local	.LBB0_67
.LBB0_67:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_69
	.local	.LBB0_68
.LBB0_68:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_69
.LBB0_69:                               ; %generate_stepping_captures_at.exit.4.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 18
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_74
; %bb.70:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_72
; %bb.71:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_73
	.local	.LBB0_72
.LBB0_72:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_74
	.local	.LBB0_73
.LBB0_73:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_74
.LBB0_74:                               ; %generate_stepping_captures_at.exit.5.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 31
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_79
; %bb.75:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_77
; %bb.76:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_78
	.local	.LBB0_77
.LBB0_77:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_79
	.local	.LBB0_78
.LBB0_78:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_79
.LBB0_79:                               ; %generate_stepping_captures_at.exit.6.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 33
	jp	.LBB0_108
	.local	.LBB0_80
.LBB0_80:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	jp	.LBB0_48
	.local	.LBB0_81
.LBB0_81:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_82
.LBB0_82:                               ; %generate_stepping_captures_at.exit.1.i66
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	e, h
	inc	e
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_87
; %bb.83:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_85
; %bb.84:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_86
	.local	.LBB0_85
.LBB0_85:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_87
	.local	.LBB0_86
.LBB0_86:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_87
.LBB0_87:                               ; %generate_stepping_captures_at.exit.2.i69
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 17
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_92
; %bb.88:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_90
; %bb.89:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_91
	.local	.LBB0_90
.LBB0_90:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_92
	.local	.LBB0_91
.LBB0_91:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_92
.LBB0_92:                               ; %generate_stepping_captures_at.exit.3.i72
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 16
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_97
; %bb.93:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_95
; %bb.94:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_96
	.local	.LBB0_95
.LBB0_95:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_97
	.local	.LBB0_96
.LBB0_96:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_97
.LBB0_97:                               ; %generate_stepping_captures_at.exit.4.i75
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, 15
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_102
; %bb.98:                               ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_100
; %bb.99:                               ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_101
	.local	.LBB0_100
.LBB0_100:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_102
	.local	.LBB0_101
.LBB0_101:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_102
.LBB0_102:                              ; %generate_stepping_captures_at.exit.5.i78
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	e, h
	dec	e
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_107
; %bb.103:                              ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_105
; %bb.104:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_106
	.local	.LBB0_105
.LBB0_105:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	jr	.LBB0_107
	.local	.LBB0_106
.LBB0_106:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	h, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), h
	lea	iy, iy + 3
	ld	(ix - 9), iy
	ld	iy, 0
	ld	bc, (ix - 15)
	.local	.LBB0_107
.LBB0_107:                              ; %generate_stepping_captures_at.exit.6.i81
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	l, -17
	.local	.LBB0_108
.LBB0_108:                              ; %generate_stepping_captures_at.exit.6.i
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	a, h
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jp	nz, .LBB0_9
; %bb.109:                              ;   in Loop: Header=BB0_8 Depth=1
	lea	bc, iy + 0
	ld	c, e
	ld	hl, (ix + 6)
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB0_111
; %bb.110:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	iy, (ix - 9)
	jr	.LBB0_113
	.local	.LBB0_111
.LBB0_111:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	c, 1
	ld	a, l
	and	a, c
	ld	l, a
	lea	bc, iy + 0
	ld	c, l
	ld	hl, (ix - 6)
	ld	hl, (hl)
	or	a, a
	sbc	hl, bc
	ld	iy, (ix - 9)
	jr	z, .LBB0_113
; %bb.112:                              ;   in Loop: Header=BB0_8 Depth=1
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 16)
	ld	(iy + 2), a
	lea	iy, iy + 3
	.local	.LBB0_113
.LBB0_113:                              ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_8 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_114
.LBB0_114:                              ; %generate_pawn_captures_at.exit
                                        ;   in Loop: Header=BB0_8 Depth=1
	inc	bc
	push	bc
	pop	hl
	ld	de, (ix - 12)
	or	a, a
	sbc	hl, de
	jp	nz, .LBB0_8
	jr	.LBB0_117
	.local	.LBB0_115
.LBB0_115:                              ; %.preheader143
	or	a, a
	jr	nz, .LBB0_118
	.local	.LBB0_116
.LBB0_116:
	ld	iy, (ix + 15)
	.local	.LBB0_117
.LBB0_117:                              ; %.loopexit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB0_118
.LBB0_118:                              ; %.lr.ph
	or	a, a
	sbc	hl, hl
	ld	l, e
	ex	de, hl
	ld	hl, (ix + 9)
	add	hl, bc
	inc	hl
	push	hl
	pop	bc
	ld	iy, (ix + 15)
	.local	.LBB0_119
.LBB0_119:                              ; =>This Inner Loop Header: Depth=1
	ld	(ix - 3), de
	lea	de, iy + 0
	push	bc
	pop	iy
	ld	a, (iy - 1)
	dec	a
	cp	a, 12
	ld	(ix - 12), iy
	jr	c, .LBB0_122
; %bb.120:                              ;   in Loop: Header=BB0_119 Depth=1
	push	de
	.local	.LBB0_121
.LBB0_121:                              ;   in Loop: Header=BB0_119 Depth=1
	pop	bc
	jp	.LBB0_211
	.local	.LBB0_122
.LBB0_122:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	(ix - 15), de
	ld	b, (iy)
	ld	de, 0
	ld	e, a
	ld	hl, JTI0_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	ld	iy, (ix + 6)
	ld	(ix - 16), b                    ; 1-byte Folded Spill
	jp	(hl)
	.local	.LBB0_123
.LBB0_123:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 6)
	ld	hl, (hl)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_173
; %bb.124:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -16
	ld	a, b
	add	a, l
	ld	e, a
	ld	bc, 0
	ld	c, e
	add	iy, bc
	ld	a, (iy)
	or	a, a
	jp	nz, .LBB0_210
; %bb.125:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	(ix - 9), iy
	ld	a, e
	cp	a, 16
	ld	iy, (ix - 15)
	jp	c, .LBB0_228
; %bb.126:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	bc, iy + 3
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	and	a, l
	ld	l, a
	cp	a, 96
	jp	nz, .LBB0_211
; %bb.127:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix - 9)
	ld	a, (iy - 16)
	or	a, a
	ld	de, (ix - 3)
	jp	nz, .LBB0_212
; %bb.128:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -32
	ld	c, (ix - 16)                    ; 1-byte Folded Reload
	ld	a, c
	add	a, l
	ld	e, a
	ld	a, c
	ld	iy, (ix - 15)
	ld	(iy + 3), 0
	ld	hl, 4
	ld	(ix - 9), hl
	inc	hl
	ld	(ix - 19), hl
	ld	bc, 6
	jp	.LBB0_231
	.local	.LBB0_129
.LBB0_129:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 15)
	push	hl
	ld	l, b
	push	hl
	push	iy
	call	_generate_bishop_moves_at
	pop	de
	pop	de
	pop	de
	push	hl
	ld	l, (ix - 16)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 6)
	push	hl
	jr	.LBB0_132
	.local	.LBB0_130
.LBB0_130:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 15)
	push	hl
	ld	l, b
	push	hl
	push	iy
	call	_generate_bishop_moves_at
	jr	.LBB0_133
	.local	.LBB0_131
.LBB0_131:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 15)
	push	hl
	ld	l, b
	push	hl
	push	iy
	.local	.LBB0_132
.LBB0_132:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_119 Depth=1
	call	_generate_rook_moves_at
	.local	.LBB0_133
.LBB0_133:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_119 Depth=1
	push	hl
	pop	bc
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB0_211
	.local	.LBB0_134
.LBB0_134:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -14
	ld	a, b
	add	a, l
	ld	e, a
	ld	d, -120
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jp	nz, .LBB0_183
; %bb.135:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	nz, .LBB0_182
; %bb.136:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jp	.LBB0_183
	.local	.LBB0_137
.LBB0_137:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 6)
	ld	hl, (hl)
	ld	(ix - 9), hl
	ld	l, -16
	ld	a, b
	add	a, l
	ld	c, a
	ld	e, -120
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_141
; %bb.138:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_140
; %bb.139:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_140
.LBB0_140:                              ; %generate_stepping_moves_at.exit.i119
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_141
.LBB0_141:                              ; %generate_stepping_moves_at.exit.i119
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -15
	ld	a, b
	add	a, l
	ld	c, a
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_145
; %bb.142:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_144
; %bb.143:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_144
.LBB0_144:                              ; %generate_stepping_moves_at.exit.1.i122
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_145
.LBB0_145:                              ; %generate_stepping_moves_at.exit.1.i122
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	c, b
	inc	c
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_149
; %bb.146:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_148
; %bb.147:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_148
.LBB0_148:                              ; %generate_stepping_moves_at.exit.2.i125
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_149
.LBB0_149:                              ; %generate_stepping_moves_at.exit.2.i125
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 17
	ld	a, b
	add	a, l
	ld	c, a
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_153
; %bb.150:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_152
; %bb.151:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_152
.LBB0_152:                              ; %generate_stepping_moves_at.exit.3.i128
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_153
.LBB0_153:                              ; %generate_stepping_moves_at.exit.3.i128
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 16
	ld	a, b
	add	a, l
	ld	c, a
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_157
; %bb.154:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_156
; %bb.155:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_156
.LBB0_156:                              ; %generate_stepping_moves_at.exit.4.i131
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_157
.LBB0_157:                              ; %generate_stepping_moves_at.exit.4.i131
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 15
	ld	a, b
	add	a, l
	ld	c, a
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_161
; %bb.158:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_160
; %bb.159:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_160
.LBB0_160:                              ; %generate_stepping_moves_at.exit.5.i134
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_161
.LBB0_161:                              ; %generate_stepping_moves_at.exit.5.i134
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	c, b
	dec	c
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_165
; %bb.162:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_164
; %bb.163:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_164
.LBB0_164:                              ; %generate_stepping_moves_at.exit.6.i137
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	e, -120
	.local	.LBB0_165
.LBB0_165:                              ; %generate_stepping_moves_at.exit.6.i137
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -17
	ld	a, b
	add	a, l
	ld	c, a
	ld	a, c
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB0_168
; %bb.166:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, c
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_168
; %bb.167:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	.local	.LBB0_168
.LBB0_168:                              ; %generate_stepping_moves_at.exit.7.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, (ix - 9)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB0_178
; %bb.169:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	de, 199
	add	hl, de
	bit	0, (hl)
	jp	z, .LBB0_213
; %bb.170:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, b
	add	iy, de
	ld	a, (iy + 1)
	or	a, a
	jp	nz, .LBB0_215
; %bb.171:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	a, (iy + 2)
	or	a, a
	jp	nz, .LBB0_215
; %bb.172:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 2
	ld	a, b
	add	a, l
	ld	l, a
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), b
	lea	bc, iy + 3
	jp	.LBB0_216
	.local	.LBB0_173
.LBB0_173:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 16
	ld	a, b
	add	a, l
	ld	e, a
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	nz, .LBB0_210
; %bb.174:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	a, e
	cp	a, 112
	jp	nc, .LBB0_229
; %bb.175:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix - 15)
	lea	hl, iy + 3
	ld	(ix - 9), hl
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	l, -16
	and	a, l
	ld	l, a
	cp	a, 16
	jp	nz, .LBB0_233
; %bb.176:                              ;   in Loop: Header=BB0_119 Depth=1
	push	bc
	pop	hl
	ld	bc, 16
	call	__ior
	ex	de, hl
	ld	hl, (ix + 6)
	ld	(ix - 25), de
	add	hl, de
	ld	a, (hl)
	or	a, a
	ld	bc, (ix - 9)
	ld	de, (ix - 3)
	jp	nz, .LBB0_212
; %bb.177:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix - 15)
	ld	(iy + 3), 0
	ld	hl, 4
	ld	(ix - 9), hl
	inc	hl
	ld	(ix - 19), hl
	ld	bc, 6
	ld	(ix - 22), bc
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	de, (ix - 25)
	jp	.LBB0_232
	.local	.LBB0_178
.LBB0_178:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	de, 201
	add	hl, de
	bit	0, (hl)
	jp	z, .LBB0_214
; %bb.179:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, b
	add	iy, de
	ld	a, (iy + 1)
	or	a, a
	jp	nz, .LBB0_220
; %bb.180:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	a, (iy + 2)
	or	a, a
	jp	nz, .LBB0_220
; %bb.181:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 2
	ld	a, b
	add	a, l
	ld	l, a
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), l
	ld	(iy + 2), b
	lea	bc, iy + 3
	jp	.LBB0_221
	.local	.LBB0_182
.LBB0_182:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_183
.LBB0_183:                              ; %generate_stepping_moves_at.exit.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -18
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_187
; %bb.184:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_186
; %bb.185:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_187
	.local	.LBB0_186
.LBB0_186:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_187
.LBB0_187:                              ; %generate_stepping_moves_at.exit.1.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -31
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_191
; %bb.188:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_190
; %bb.189:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_191
	.local	.LBB0_190
.LBB0_190:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_191
.LBB0_191:                              ; %generate_stepping_moves_at.exit.2.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, -33
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_195
; %bb.192:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_194
; %bb.193:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_195
	.local	.LBB0_194
.LBB0_194:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_195
.LBB0_195:                              ; %generate_stepping_moves_at.exit.3.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 14
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_199
; %bb.196:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_198
; %bb.197:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_199
	.local	.LBB0_198
.LBB0_198:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_199
.LBB0_199:                              ; %generate_stepping_moves_at.exit.4.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 18
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_203
; %bb.200:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_202
; %bb.201:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_203
	.local	.LBB0_202
.LBB0_202:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_203
.LBB0_203:                              ; %generate_stepping_moves_at.exit.5.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 31
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_207
; %bb.204:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_206
; %bb.205:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 15), iy
	push	hl
	pop	iy
	jr	.LBB0_207
	.local	.LBB0_206
.LBB0_206:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	b, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB0_207
.LBB0_207:                              ; %generate_stepping_moves_at.exit.6.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	l, 33
	ld	a, b
	add	a, l
	ld	e, a
	ld	a, e
	and	a, d
	ld	l, a
	or	a, a
	jr	nz, .LBB0_210
; %bb.208:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, 0
	ld	c, e
	lea	hl, iy + 0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB0_210
; %bb.209:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix - 15)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	a, (ix - 16)
	ld	(iy + 2), a
	lea	bc, iy + 3
	jr	.LBB0_211
	.local	.LBB0_210
.LBB0_210:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_211
.LBB0_211:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, (ix - 3)
	.local	.LBB0_212
.LBB0_212:                              ; %generate_pawn_moves_at.exit
                                        ;   in Loop: Header=BB0_119 Depth=1
	push	bc
	pop	hl
	ld	iy, (ix - 12)
	lea	iy, iy + 2
	lea	bc, iy + 0
	push	hl
	pop	iy
	dec	de
	sbc	hl, hl
	adc	hl, de
	jp	nz, .LBB0_119
	jp	.LBB0_117
	.local	.LBB0_213
.LBB0_213:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 15)
	jr	.LBB0_217
	.local	.LBB0_214
.LBB0_214:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 15)
	jr	.LBB0_222
	.local	.LBB0_215
.LBB0_215:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_216
.LBB0_216:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix + 6)
	.local	.LBB0_217
.LBB0_217:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	de, 200
	add	hl, de
	bit	0, (hl)
	jr	z, .LBB0_211
; %bb.218:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, (ix - 16)                    ; 1-byte Folded Reload
	add	iy, de
	ld	a, (iy - 1)
	or	a, a
	jr	nz, .LBB0_211
; %bb.219:                              ;   in Loop: Header=BB0_119 Depth=1
	ex	de, hl
	ld	de, -2
	add	hl, de
	ld	a, (iy - 2)
	or	a, a
	jr	nz, .LBB0_211
	jr	.LBB0_226
	.local	.LBB0_220
.LBB0_220:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 15)
	.local	.LBB0_221
.LBB0_221:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix + 6)
	.local	.LBB0_222
.LBB0_222:                              ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	de, 202
	add	hl, de
	bit	0, (hl)
	jr	z, .LBB0_211
; %bb.223:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	de, 0
	ld	e, (ix - 16)                    ; 1-byte Folded Reload
	add	iy, de
	ld	a, (iy - 1)
	or	a, a
	jr	nz, .LBB0_211
; %bb.224:                              ;   in Loop: Header=BB0_119 Depth=1
	ex	de, hl
	ld	de, -2
	add	hl, de
	lea	de, iy + 0
	ld	a, (iy - 2)
	or	a, a
	jp	nz, .LBB0_211
; %bb.225:                              ;   in Loop: Header=BB0_119 Depth=1
	push	de
	pop	iy
	.local	.LBB0_226
.LBB0_226:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	a, (iy - 3)
	or	a, a
	ld	de, (ix - 3)
	jp	nz, .LBB0_212
; %bb.227:                              ; %.sink.split.i142
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	a, l
	push	bc
	pop	iy
	ld	(iy), 0
	ld	(iy + 1), a
	ld	a, (ix - 16)
	ld	(iy + 2), a
	lea	iy, iy + 3
	lea	bc, iy + 0
	jp	.LBB0_212
	.local	.LBB0_228
.LBB0_228:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	(iy), -112
	ld	(iy + 1), e
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	(iy + 3), 112
	ld	(iy + 4), e
	ld	(iy + 5), a
	ld	(iy + 6), 80
	ld	(iy + 7), e
	ld	(iy + 8), a
	ld	(iy + 9), 48
	jr	.LBB0_230
	.local	.LBB0_229
.LBB0_229:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	iy, (ix - 15)
	ld	(iy), -96
	ld	(iy + 1), e
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	(iy + 2), a
	ld	(iy + 3), -128
	ld	(iy + 4), e
	ld	(iy + 5), a
	ld	(iy + 6), 96
	ld	(iy + 7), e
	ld	(iy + 8), a
	ld	(iy + 9), 64
	.local	.LBB0_230
.LBB0_230:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	hl, 10
	ld	(ix - 9), hl
	inc	hl
	ld	(ix - 19), hl
	ld	bc, 12
	.local	.LBB0_231
.LBB0_231:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	ld	(ix - 22), bc
	.local	.LBB0_232
.LBB0_232:                              ; %.sink.split.i
                                        ;   in Loop: Header=BB0_119 Depth=1
	lea	hl, iy + 0
	ld	bc, (ix - 9)
	add	iy, bc
	ld	(iy), e
	push	hl
	pop	iy
	ld	de, (ix - 19)
	add	iy, de
	ld	(iy), a
	ld	de, (ix - 22)
	add	hl, de
	push	hl
	jp	.LBB0_121
	.local	.LBB0_233
.LBB0_233:                              ;   in Loop: Header=BB0_119 Depth=1
	ld	bc, (ix - 9)
	jp	.LBB0_211
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_generate_moves, .Lfunc_end0-_generate_moves
	.section	.rodata._generate_moves,"a",@progbits
JTI0_0:
	d24	.LBB0_123
	d24	.LBB0_123
	d24	.LBB0_134
	d24	.LBB0_134
	d24	.LBB0_130
	d24	.LBB0_130
	d24	.LBB0_131
	d24	.LBB0_131
	d24	.LBB0_129
	d24	.LBB0_129
	d24	.LBB0_137
	d24	.LBB0_137
JTI0_1:
	d24	.LBB0_11
	d24	.LBB0_11
	d24	.LBB0_34
	d24	.LBB0_34
	d24	.LBB0_30
	d24	.LBB0_30
	d24	.LBB0_31
	d24	.LBB0_31
	d24	.LBB0_29
	d24	.LBB0_29
	d24	.LBB0_38
	d24	.LBB0_38
                                        ; -- End function
	.section	.text._generate_bishop_captures_at,"ax",@progbits
	.type	_generate_bishop_captures_at,@function ; -- Begin function generate_bishop_captures_at
_generate_bishop_captures_at:           ; @generate_bishop_captures_at
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	hl, (ix + 12)
	ld	(ix - 3), hl
	ld	b, -15
	ld	h, -120
	ld	c, (ix + 9)
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
	ld	hl, (ix + 6)
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
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB1_6
; %bb.4:
	ld	b, (ix + 9)
	jr	.LBB1_7
	.local	.LBB1_5
.LBB1_5:
	ld	b, (ix + 9)
	jr	.LBB1_8
	.local	.LBB1_6
.LBB1_6:
	ld	iy, (ix + 12)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	b, (ix + 9)
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB1_7
.LBB1_7:                                ; %generate_sliding_captures_at.exit44
	ld	h, -120
	.local	.LBB1_8
.LBB1_8:                                ; %generate_sliding_captures_at.exit44
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
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_9
; %bb.11:
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB1_13
; %bb.12:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB1_13
.LBB1_13:                               ; %generate_sliding_captures_at.exit33
	ld	h, -120
	.local	.LBB1_14
.LBB1_14:                               ; %generate_sliding_captures_at.exit33
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
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_15
; %bb.17:
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB1_19
; %bb.18:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB1_19
.LBB1_19:                               ; %generate_sliding_captures_at.exit22
	ld	h, -120
	.local	.LBB1_20
.LBB1_20:                               ; %generate_sliding_captures_at.exit22
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
	jr	nz, .LBB1_24
; %bb.22:                               ;   in Loop: Header=BB1_21 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB1_21
; %bb.23:
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
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB1_26
	.local	.LBB1_24
.LBB1_24:
	ld	iy, (ix - 3)
	.local	.LBB1_25
.LBB1_25:                               ; %generate_sliding_captures_at.exit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB1_26
.LBB1_26:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	jr	.LBB1_25
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
	ld	hl, (ix + 12)
	ld	(ix - 3), hl
	ld	b, -16
	ld	h, -120
	ld	c, (ix + 9)
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
	ld	hl, (ix + 6)
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
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB2_6
; %bb.4:
	ld	b, (ix + 9)
	jr	.LBB2_7
	.local	.LBB2_5
.LBB2_5:
	ld	b, (ix + 9)
	jr	.LBB2_8
	.local	.LBB2_6
.LBB2_6:
	ld	iy, (ix + 12)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	b, (ix + 9)
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB2_7
.LBB2_7:                                ; %generate_sliding_captures_at.exit44
	ld	h, -120
	.local	.LBB2_8
.LBB2_8:                                ; %generate_sliding_captures_at.exit44
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
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_9
; %bb.11:
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB2_13
; %bb.12:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB2_13
.LBB2_13:                               ; %generate_sliding_captures_at.exit33
	ld	h, -120
	.local	.LBB2_14
.LBB2_14:                               ; %generate_sliding_captures_at.exit33
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
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_15
; %bb.17:
	push	de
	pop	iy
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	e, 1
	ld	a, l
	and	a, e
	ld	l, a
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB2_19
; %bb.18:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB2_19
.LBB2_19:                               ; %generate_sliding_captures_at.exit22
	ld	h, -120
	.local	.LBB2_20
.LBB2_20:                               ; %generate_sliding_captures_at.exit22
	ld	c, b
	.local	.LBB2_21
.LBB2_21:                               ; =>This Inner Loop Header: Depth=1
	dec	c
	ld	a, c
	and	a, h
	ld	l, a
	or	a, a
	jr	nz, .LBB2_24
; %bb.22:                               ;   in Loop: Header=BB2_21 Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, 0
	ld	l, (hl)
	ld	h, -120
	ld	a, l
	or	a, a
	jr	z, .LBB2_21
; %bb.23:
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
	ld	de, 194
	ld	hl, (ix + 6)
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	nz, .LBB2_26
	.local	.LBB2_24
.LBB2_24:
	ld	iy, (ix - 3)
	.local	.LBB2_25
.LBB2_25:                               ; %generate_sliding_captures_at.exit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB2_26
.LBB2_26:
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), b
	lea	iy, iy + 3
	jr	.LBB2_25
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_generate_rook_captures_at, .Lfunc_end2-_generate_rook_captures_at
                                        ; -- End function
	.section	.text._generate_bishop_moves_at,"ax",@progbits
	.type	_generate_bishop_moves_at,@function ; -- Begin function generate_bishop_moves_at
_generate_bishop_moves_at:              ; @generate_bishop_moves_at
; %bb.0:
	call	__frameset0
	ld	c, (ix + 9)
	ld	iy, (ix + 12)
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
	ld	hl, (ix + 6)
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
.LBB3_4:                                ; %generate_sliding_moves_at.exit38
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
; %bb.5:                                ; %.lr.ph68.preheader
	ld	l, 34
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_6
.LBB3_6:                                ; %.lr.ph68
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
.LBB3_8:                                ; %generate_sliding_moves_at.exit29
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
; %bb.9:                                ; %.lr.ph76.preheader
	ld	l, 30
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_10
.LBB3_10:                               ; %.lr.ph76
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
.LBB3_12:                               ; %generate_sliding_moves_at.exit20
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
; %bb.13:                               ; %.lr.ph84.preheader
	ld	l, -34
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB3_14
.LBB3_14:                               ; %.lr.ph84
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
	ld	c, (ix + 9)
	ld	iy, (ix + 12)
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
	ld	hl, (ix + 6)
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
.LBB4_4:                                ; %generate_sliding_moves_at.exit38
	ld	h, c
	inc	h
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_8
; %bb.5:                                ; %.lr.ph68.preheader
	ld	l, 2
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_6
.LBB4_6:                                ; %.lr.ph68
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
.LBB4_8:                                ; %generate_sliding_moves_at.exit29
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
; %bb.9:                                ; %.lr.ph76.preheader
	ld	l, 32
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_10
.LBB4_10:                               ; %.lr.ph76
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
.LBB4_12:                               ; %generate_sliding_moves_at.exit20
	ld	h, c
	dec	h
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB4_16
; %bb.13:                               ; %.lr.ph84.preheader
	ld	l, -2
	ld	de, 0
	ld	e, h
	ld	a, c
	add	a, l
	ld	b, a
	.local	.LBB4_14
.LBB4_14:                               ; %.lr.ph84
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix + 6)
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
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	iy, _state
	ld	de, _piece_list
	ld	bc, 0
	ld	hl, _move_pool
	push	hl
	push	bc
	push	de
	push	iy
	call	_generate_moves
	pop	de
	pop	de
	pop	de
	pop	de
	ret
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_main, .Lfunc_end5-_main
                                        ; -- End function
	.section	.bss._move_pool,"aw",@nobits
	.balign	1
	.globl	_move_pool
_move_pool:
	.zero	6144

	.section	.bss._state,"aw",@nobits
	.balign	1
	.globl	_state
_state:
	.zero	203

	.section	.bss._piece_list,"aw",@nobits
	.balign	1
	.globl	_piece_list
_piece_list:
	.zero	66

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
	.extern	__Unwind_SjLj_Unregister
	.extern	__frameset
	.extern	__ior
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stacksave.p0
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.frameaddress.p0
	.extern	_llvm.stackrestore.p0
