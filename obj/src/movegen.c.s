	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"movegen.c"
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, -7
	call	__frameset
	ld	bc, 0
	ld	hl, (_state+160)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_2
; %bb.1:
	ld	hl, _b_pawn_capture_offsets
	jr	.LBB0_3
	.local	.LBB0_2
.LBB0_2:
	ld	hl, _w_pawn_capture_offsets
	.local	.LBB0_3
.LBB0_3:
	ld	(ix - 7), hl
	ld	a, 1
	ld	hl, _move_pool
	ld	(ix - 3), hl
	push	bc
	pop	de
	.local	.LBB0_4
.LBB0_4:                                ; =>This Inner Loop Header: Depth=1
	ld	(ix - 4), a
	ld	hl, (ix - 7)
	add	hl, de
	ld	e, (hl)
	ld	l, -120
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB0_17
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	ld	a, (_state+163)
	ld	l, a
	ld	a, e
	cp	a, l
	jr	nz, .LBB0_8
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	ld	a, (_state+164)
	bit	0, a
	jr	z, .LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_4 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 8
	ld	(iy + 1), e
	ld	(iy + 2), 0
	lea	iy, iy + 3
	jp	.LBB0_16
	.local	.LBB0_8
.LBB0_8:                                ;   in Loop: Header=BB0_4 Depth=1
	ld	c, e
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_10
; %bb.9:                                ;   in Loop: Header=BB0_4 Depth=1
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
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_11
	.local	.LBB0_10
.LBB0_10:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	bc, 0
	jp	.LBB0_17
	.local	.LBB0_11
.LBB0_11:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	a, e
	cp	a, 16
	ld	bc, 0
	jr	nc, .LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	hl, (ix - 3)
	ld	(hl), -112
	ld	iy, (ix - 3)
	ld	(iy + 1), e
	ld	iy, (ix - 3)
	ld	(iy + 2), 0
	ld	iy, (ix - 3)
	ld	(iy + 3), 112
	ld	iy, (ix - 3)
	ld	(iy + 4), e
	ld	iy, (ix - 3)
	ld	(iy + 5), 0
	ld	iy, (ix - 3)
	ld	(iy + 6), 80
	ld	iy, (ix - 3)
	ld	(iy + 7), e
	ld	iy, (ix - 3)
	ld	(iy + 8), 0
	ld	iy, (ix - 3)
	ld	(iy + 9), 48
	ld	iy, (ix - 3)
	ld	(iy + 10), e
	ld	iy, (ix - 3)
	ld	(iy + 11), 0
	ld	iy, (ix - 3)
	jr	.LBB0_15
	.local	.LBB0_13
.LBB0_13:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	a, e
	cp	a, 112
	jr	c, .LBB0_18
; %bb.14:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), -96
	ld	(iy + 1), e
	ld	(iy + 2), 0
	ld	(iy + 3), -128
	ld	(iy + 4), e
	ld	(iy + 5), 0
	ld	(iy + 6), 96
	ld	(iy + 7), e
	ld	(iy + 8), 0
	ld	(iy + 9), 64
	ld	(iy + 10), e
	ld	(iy + 11), 0
	.local	.LBB0_15
.LBB0_15:                               ;   in Loop: Header=BB0_4 Depth=1
	lea	iy, iy + 12
	.local	.LBB0_16
.LBB0_16:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	(ix - 3), iy
	.local	.LBB0_17
.LBB0_17:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	bit	0, a
	ld	a, 0
	ld	de, 1
	jp	nz, .LBB0_4
	jr	.LBB0_19
	.local	.LBB0_18
.LBB0_18:                               ;   in Loop: Header=BB0_4 Depth=1
	ld	iy, (ix - 3)
	lea	hl, iy + 3
	ld	(iy), 0
	ld	(iy + 1), e
	ld	(iy + 2), 0
	ld	bc, 0
	ld	(ix - 3), hl
	jr	.LBB0_17
	.local	.LBB0_19
.LBB0_19:                               ; %generate_pawn_captures.exit.preheader
	push	bc
	pop	de
	.local	.LBB0_20
.LBB0_20:                               ; %generate_pawn_captures.exit
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _knight_offsets
	add	hl, de
	ld	h, (hl)
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_25
; %bb.21:                               ;   in Loop: Header=BB0_20 Depth=1
	ld	(ix - 4), h                     ; 1-byte Folded Spill
	ld	c, h
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_24
; %bb.22:                               ;   in Loop: Header=BB0_20 Depth=1
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
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_24
; %bb.23:                               ;   in Loop: Header=BB0_20 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	a, (ix - 4)
	ld	(iy + 1), a
	ld	(iy + 2), 0
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB0_24
.LBB0_24:                               ; %generate_stepping_captures.exit.i
                                        ;   in Loop: Header=BB0_20 Depth=1
	ld	iy, 0
	jr	.LBB0_26
	.local	.LBB0_25
.LBB0_25:                               ;   in Loop: Header=BB0_20 Depth=1
	push	bc
	pop	iy
	.local	.LBB0_26
.LBB0_26:                               ; %generate_stepping_captures.exit.i
                                        ;   in Loop: Header=BB0_20 Depth=1
	inc	de
	push	de
	pop	hl
	ld	bc, 8
	or	a, a
	sbc	hl, bc
	lea	bc, iy + 0
	jr	nz, .LBB0_20
; %bb.27:                               ; %generate_knight_captures.exit.preheader
	ld	a, 17
	ld	c, a
	ld	de, 17
	ld	iy, (ix - 3)
	.local	.LBB0_28
.LBB0_28:                               ; %generate_knight_captures.exit
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_28 Depth=1
	push	de
	pop	hl
	ld	(ix - 3), iy
	ld	iyl, c
	ld	bc, 17
	add	hl, bc
	ld	a, e
	add	a, c
	ld	e, a
	ld	d, -120
	ld	a, e
	and	a, d
	ld	e, a
	ld	a, iyl
	add	a, c
	ld	iyl, a
	ld	c, iyl
	ld	iy, (ix - 3)
	ld	a, e
	or	a, a
	ex	de, hl
	jr	z, .LBB0_28
	jr	.LBB0_32
	.local	.LBB0_30
.LBB0_30:
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
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, de
	jr	z, .LBB0_32
; %bb.31:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), 0
	lea	iy, iy + 3
	.local	.LBB0_32
.LBB0_32:                               ; %generate_bishop_captures.exit
	push	iy
	call	_generate_rook_captures
	push	hl
	pop	iy
	pop	hl
	ld	a, 17
	ld	c, a
	ld	de, 17
	.local	.LBB0_33
.LBB0_33:                               ; =>This Inner Loop Header: Depth=1
	ld	hl, _state
	add	hl, de
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB0_35
; %bb.34:                               ;   in Loop: Header=BB0_33 Depth=1
	push	de
	pop	hl
	ld	(ix - 3), iy
	ld	iyl, c
	ld	bc, 17
	add	hl, bc
	ld	a, e
	add	a, c
	ld	e, a
	ld	d, -120
	ld	a, e
	and	a, d
	ld	e, a
	ld	a, iyl
	add	a, c
	ld	iyl, a
	ld	c, iyl
	ld	iy, (ix - 3)
	ld	a, e
	or	a, a
	ex	de, hl
	jr	z, .LBB0_33
	jr	.LBB0_37
	.local	.LBB0_35
.LBB0_35:
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
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, de
	jr	z, .LBB0_37
; %bb.36:
	ld	(iy), 0
	ld	(iy + 1), c
	ld	(iy + 2), 0
	lea	iy, iy + 3
	.local	.LBB0_37
.LBB0_37:                               ; %generate_queen_captures.exit
	push	iy
	call	_generate_rook_captures
	ld	(ix - 3), hl
	pop	hl
	ld	iy, 0
	lea	de, iy + 0
	.local	.LBB0_38
.LBB0_38:                               ; =>This Inner Loop Header: Depth=1
	ld	hl, _king_offsets
	add	hl, de
	ld	h, (hl)
	ld	l, -120
	ld	a, h
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB0_43
; %bb.39:                               ;   in Loop: Header=BB0_38 Depth=1
	lea	bc, iy + 0
	ld	(ix - 4), h                     ; 1-byte Folded Spill
	ld	c, h
	ld	hl, _state
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB0_42
; %bb.40:                               ;   in Loop: Header=BB0_38 Depth=1
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
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB0_42
; %bb.41:                               ;   in Loop: Header=BB0_38 Depth=1
	ld	iy, (ix - 3)
	ld	(iy), 0
	ld	a, (ix - 4)
	ld	(iy + 1), a
	ld	(iy + 2), 0
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB0_42
.LBB0_42:                               ; %generate_stepping_captures.exit.i11
                                        ;   in Loop: Header=BB0_38 Depth=1
	ld	iy, 0
	.local	.LBB0_43
.LBB0_43:                               ; %generate_stepping_captures.exit.i11
                                        ;   in Loop: Header=BB0_38 Depth=1
	inc	de
	push	de
	pop	hl
	ld	bc, 8
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_38
; %bb.44:                               ; %generate_king_captures.exit
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_main, .Lfunc_end0-_main
                                        ; -- End function
	.section	.text._generate_rook_captures,"ax",@progbits
	.type	_generate_rook_captures,@function ; -- Begin function generate_rook_captures
_generate_rook_captures:                ; @generate_rook_captures
; %bb.0:                                ; %generate_sliding_captures.exit44.loopexit
	ld	hl, -6
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 3), hl
	ld	hl, _state
	ld	d, 1
	ld	bc, 1
	ld	e, d
	.local	.LBB1_1
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB1_3
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	inc	e
	ld	a, c
	inc	a
	inc	bc
	bit	3, a
	ld	hl, _state
	jr	z, .LBB1_1
	jr	.LBB1_6
	.local	.LBB1_3
.LBB1_3:
	ld	c, -1
	ld	a, l
	xor	a, c
	ld	l, a
	ld	a, l
	and	a, d
	ld	l, a
	ld	bc, 0
	ld	c, l
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB1_5
; %bb.4:
	ld	iy, (ix + 6)
	ld	(iy), 0
	ld	(iy + 1), e
	ld	(iy + 2), 0
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB1_5
.LBB1_5:
	ld	hl, _state
	.local	.LBB1_6
.LBB1_6:                                ; %generate_sliding_captures.exit33
	ld	iyl, 16
	ld	bc, 16
	.local	.LBB1_7
.LBB1_7:                                ; =>This Inner Loop Header: Depth=1
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_7 Depth=1
	ld	iyh, d
	push	bc
	pop	hl
	ld	de, 16
	add	hl, de
	ld	(ix - 6), hl
	ld	l, e
	ld	a, c
	add	a, l
	ld	l, a
	ld	e, -128
	ld	a, l
	and	a, e
	ld	l, a
	ld	e, 16
	ld	a, iyl
	add	a, e
	ld	iyl, a
	ld	a, l
	or	a, a
	ld	bc, (ix - 6)
	ld	d, iyh
	ld	hl, _state
	jr	z, .LBB1_7
	jr	.LBB1_11
	.local	.LBB1_9
.LBB1_9:
	ld	e, -1
	ld	a, l
	xor	a, e
	ld	l, a
	ld	a, l
	and	a, d
	ld	l, a
	ld	de, 0
	ld	e, l
	ld	hl, (_state+160)
	or	a, a
	sbc	hl, de
	jr	z, .LBB1_11
; %bb.10:
	ld	hl, (ix - 3)
	ld	(hl), 0
	ld	a, iyl
	push	hl
	pop	iy
	ld	(iy + 1), a
	ld	(iy + 2), 0
	lea	iy, iy + 3
	ld	(ix - 3), iy
	.local	.LBB1_11
.LBB1_11:                               ; %generate_sliding_captures.exit
	ld	hl, (ix - 3)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_generate_rook_captures, .Lfunc_end1-_generate_rook_captures
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
	.zero	169

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

	.section	.rodata._knight_offsets,"a",@progbits
	.balign	1
	.local	_knight_offsets
_knight_offsets:
	.ascii	"\362\356\341\337\016\022\037!"

	.section	.rodata._king_offsets,"a",@progbits
	.balign	1
	.local	_king_offsets
_king_offsets:
	.ascii	"\360\361\001\021\020\017\377\357"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stacksave.p0
	.extern	_llvm.eh.sjlj.lsda
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.frameaddress.p0
	.extern	__Unwind_SjLj_Unregister
	.extern	_llvm.stackrestore.p0
	.extern	__frameset
