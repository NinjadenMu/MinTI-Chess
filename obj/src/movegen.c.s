	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"movegen.c"
	.file	0 "/Users/jaden/dev/calculator/MinTI-Chess" "movegen.c" md5 0xd99e135b0c23812aff111ec0f25bba01
	.file	1 "/Users/jaden" "CEdev/include/stdint.h"
	.file	2 "src" "movegen.c"
	.file	3 "src" "types.h"
	.section	.text._generate_moves,"ax",@progbits
	.globl	_generate_moves                 ; -- Begin function generate_moves
	.type	_generate_moves,@function
_generate_moves:                        ; @generate_moves
	.local	.Lfunc_begin0
.Lfunc_begin0:
	.loc	2 310 0                         ; src/movegen.c:310:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -14
	add	hl, sp
	ld	sp, hl
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, -327680
	ld	iy, _.str
	ld	(ix - 3), hl
	ld	(ix - 6), de
	.local	.Ltmp0
.Ltmp0:
	.loc	2 311 3 prologue_end            ; src/movegen.c:311:3
	push	iy
	push	bc
	call	_sprintf
	ld	hl, 6
	add	hl, sp
	ld	sp, hl
	.local	.Ltmp1
.Ltmp1:
	.loc	2 314 14                        ; src/movegen.c:314:14
	ld	hl, (_state+194)
	.local	.Ltmp2
.Ltmp2:
	.loc	2 314 7 is_stmt 0               ; src/movegen.c:314:7
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB0_2
	jr	.LBB0_1
	.local	.LBB0_1
.LBB0_1:
	.local	.Ltmp3
.Ltmp3:
	.loc	2 315 12 is_stmt 1              ; src/movegen.c:315:12
	ld	hl, _state+128
	ld	(ix - 10), hl
	.loc	2 316 29                        ; src/movegen.c:316:29
	ld	a, (_state+192)
	.loc	2 316 9 is_stmt 0               ; src/movegen.c:316:9
	ld	(ix - 7), a
	.loc	2 317 3 is_stmt 1               ; src/movegen.c:317:3
	jr	.LBB0_3
	.local	.Ltmp4
.Ltmp4:
	.local	.LBB0_2
.LBB0_2:
	.loc	2 319 12                        ; src/movegen.c:319:12
	ld	hl, _state+160
	ld	(ix - 10), hl
	.loc	2 320 29                        ; src/movegen.c:320:29
	ld	a, (_state+193)
	.loc	2 320 9 is_stmt 0               ; src/movegen.c:320:9
	ld	(ix - 7), a
	jr	.LBB0_3
	.local	.Ltmp5
.Ltmp5:
	.local	.LBB0_3
.LBB0_3:
	.loc	2 323 7 is_stmt 1               ; src/movegen.c:323:7
	ld	hl, (ix - 3)
	.local	.Ltmp6
.Ltmp6:
	.loc	2 323 7 is_stmt 0               ; src/movegen.c:323:7
	ld	de, 1
	or	a, a
	sbc	hl, de
	jp	nz, .LBB0_17
	jr	.LBB0_4
	.local	.LBB0_4
.LBB0_4:
	.local	.Ltmp7
.Ltmp7:
	.loc	2 324 18 is_stmt 1              ; src/movegen.c:324:18
	ld	(ix - 11), 0
	.loc	2 324 10 is_stmt 0              ; src/movegen.c:324:10
	jr	.LBB0_5
	.local	.LBB0_5
.LBB0_5:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp8
.Ltmp8:
	.loc	2 324 25                        ; src/movegen.c:324:25
	ld	a, (ix - 11)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 324 29                        ; src/movegen.c:324:29
	ld	a, (ix - 7)
	ld	iy, 0
	ld	iyl, a
	.local	.Ltmp9
.Ltmp9:
	.loc	2 324 5                         ; src/movegen.c:324:5
	ld	de, -8388608
	add	iy, de
	add	hl, de
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jp	nc, .LBB0_16
	jr	.LBB0_6
	.local	.LBB0_6
.LBB0_6:                                ;   in Loop: Header=BB0_5 Depth=1
	.local	.Ltmp10
.Ltmp10:
	.loc	2 325 66 is_stmt 1              ; src/movegen.c:325:66
	ld	a, (ix - 11)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 325 7 is_stmt 0               ; src/movegen.c:325:7
	push	hl
	ld	hl, _.str.1
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	2 326 52 is_stmt 1              ; src/movegen.c:326:52
	ld	hl, (ix - 6)
	.loc	2 326 7 is_stmt 0               ; src/movegen.c:326:7
	push	hl
	ld	hl, _.str.2
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	2 327 23 is_stmt 1              ; src/movegen.c:327:23
	ld	iy, (ix - 10)
	.loc	2 327 30 is_stmt 0              ; src/movegen.c:327:30
	ld	a, (ix - 11)
	.loc	2 327 23                        ; src/movegen.c:327:23
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	add	iy, de
	.loc	2 327 33                        ; src/movegen.c:327:33
	ld	a, (iy + 1)
	.loc	2 327 14                        ; src/movegen.c:327:14
	ld	(ix - 12), a
	.loc	2 328 15 is_stmt 1              ; src/movegen.c:328:15
	ld	iy, (ix - 10)
	.loc	2 328 22 is_stmt 0              ; src/movegen.c:328:22
	ld	a, (ix - 11)
	.loc	2 328 15                        ; src/movegen.c:328:15
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	add	iy, de
	.loc	2 328 25                        ; src/movegen.c:328:25
	ld	a, (iy)
	.loc	2 328 15                        ; src/movegen.c:328:15
	ld	de, 0
	ld	e, a
	.loc	2 328 7                         ; src/movegen.c:328:7
	dec	de
	ld	bc, 12
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	nc, .LBB0_14
; %bb.7:                                ;   in Loop: Header=BB0_5 Depth=1
	ld	hl, JTI0_1
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB0_8
.LBB0_8:                                ;   in Loop: Header=BB0_5 Depth=1
	.local	.Ltmp11
.Ltmp11:
	.loc	2 331 49 is_stmt 1              ; src/movegen.c:331:49
	ld	a, (ix - 12)
	.loc	2 331 57 is_stmt 0              ; src/movegen.c:331:57
	ld	hl, (ix - 6)
	.loc	2 331 23                        ; src/movegen.c:331:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_pawn_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 331 21                        ; src/movegen.c:331:21
	ld	(ix - 6), hl
	.loc	2 332 11 is_stmt 1              ; src/movegen.c:332:11
	jp	.LBB0_14
	.local	.LBB0_9
.LBB0_9:                                ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 336 51                        ; src/movegen.c:336:51
	ld	a, (ix - 12)
	.loc	2 336 59 is_stmt 0              ; src/movegen.c:336:59
	ld	hl, (ix - 6)
	.loc	2 336 23                        ; src/movegen.c:336:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_knight_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 336 21                        ; src/movegen.c:336:21
	ld	(ix - 6), hl
	.loc	2 337 11 is_stmt 1              ; src/movegen.c:337:11
	jr	.LBB0_14
	.local	.LBB0_10
.LBB0_10:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 341 51                        ; src/movegen.c:341:51
	ld	a, (ix - 12)
	.loc	2 341 59 is_stmt 0              ; src/movegen.c:341:59
	ld	hl, (ix - 6)
	.loc	2 341 23                        ; src/movegen.c:341:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_bishop_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 341 21                        ; src/movegen.c:341:21
	ld	(ix - 6), hl
	.loc	2 342 11 is_stmt 1              ; src/movegen.c:342:11
	jr	.LBB0_14
	.local	.LBB0_11
.LBB0_11:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 346 49                        ; src/movegen.c:346:49
	ld	a, (ix - 12)
	.loc	2 346 57 is_stmt 0              ; src/movegen.c:346:57
	ld	hl, (ix - 6)
	.loc	2 346 23                        ; src/movegen.c:346:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_rook_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 346 21                        ; src/movegen.c:346:21
	ld	(ix - 6), hl
	.loc	2 347 11 is_stmt 1              ; src/movegen.c:347:11
	jr	.LBB0_14
	.local	.LBB0_12
.LBB0_12:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 351 50                        ; src/movegen.c:351:50
	ld	a, (ix - 12)
	.loc	2 351 58 is_stmt 0              ; src/movegen.c:351:58
	ld	hl, (ix - 6)
	.loc	2 351 23                        ; src/movegen.c:351:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_queen_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 351 21                        ; src/movegen.c:351:21
	ld	(ix - 6), hl
	.loc	2 352 11 is_stmt 1              ; src/movegen.c:352:11
	jr	.LBB0_14
	.local	.LBB0_13
.LBB0_13:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 356 49                        ; src/movegen.c:356:49
	ld	a, (ix - 12)
	.loc	2 356 57 is_stmt 0              ; src/movegen.c:356:57
	ld	hl, (ix - 6)
	.loc	2 356 23                        ; src/movegen.c:356:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_king_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 356 21                        ; src/movegen.c:356:21
	ld	(ix - 6), hl
	.loc	2 357 11 is_stmt 1              ; src/movegen.c:357:11
	jr	.LBB0_14
	.local	.Ltmp12
.Ltmp12:
	.local	.LBB0_14
.LBB0_14:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 359 5                         ; src/movegen.c:359:5
	jr	.LBB0_15
	.local	.Ltmp13
.Ltmp13:
	.local	.LBB0_15
.LBB0_15:                               ;   in Loop: Header=BB0_5 Depth=1
	.loc	2 324 35                        ; src/movegen.c:324:35
	inc	(ix - 11)
	.loc	2 324 5 is_stmt 0               ; src/movegen.c:324:5
	jp	.LBB0_5
	.local	.Ltmp14
.Ltmp14:
	.local	.LBB0_16
.LBB0_16:
	.loc	2 360 3 is_stmt 1               ; src/movegen.c:360:3
	jp	.LBB0_30
	.local	.Ltmp15
.Ltmp15:
	.local	.LBB0_17
.LBB0_17:
	.loc	2 362 18                        ; src/movegen.c:362:18
	ld	(ix - 13), 0
	.loc	2 362 10 is_stmt 0              ; src/movegen.c:362:10
	jr	.LBB0_18
	.local	.LBB0_18
.LBB0_18:                               ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp16
.Ltmp16:
	.loc	2 362 25                        ; src/movegen.c:362:25
	ld	a, (ix - 13)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 362 29                        ; src/movegen.c:362:29
	ld	a, (ix - 7)
	ld	iy, 0
	ld	iyl, a
	.local	.Ltmp17
.Ltmp17:
	.loc	2 362 5                         ; src/movegen.c:362:5
	ld	de, -8388608
	add	iy, de
	add	hl, de
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jp	nc, .LBB0_29
	jr	.LBB0_19
	.local	.LBB0_19
.LBB0_19:                               ;   in Loop: Header=BB0_18 Depth=1
	.local	.Ltmp18
.Ltmp18:
	.loc	2 363 66 is_stmt 1              ; src/movegen.c:363:66
	ld	a, (ix - 13)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 363 7 is_stmt 0               ; src/movegen.c:363:7
	push	hl
	ld	hl, _.str.1
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	2 364 52 is_stmt 1              ; src/movegen.c:364:52
	ld	hl, (ix - 6)
	.loc	2 364 7 is_stmt 0               ; src/movegen.c:364:7
	push	hl
	ld	hl, _.str.2
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	2 365 23 is_stmt 1              ; src/movegen.c:365:23
	ld	iy, (ix - 10)
	.loc	2 365 30 is_stmt 0              ; src/movegen.c:365:30
	ld	a, (ix - 13)
	.loc	2 365 23                        ; src/movegen.c:365:23
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	add	iy, de
	.loc	2 365 33                        ; src/movegen.c:365:33
	ld	a, (iy + 1)
	.loc	2 365 14                        ; src/movegen.c:365:14
	ld	(ix - 14), a
	.loc	2 366 15 is_stmt 1              ; src/movegen.c:366:15
	ld	iy, (ix - 10)
	.loc	2 366 22 is_stmt 0              ; src/movegen.c:366:22
	ld	a, (ix - 13)
	.loc	2 366 15                        ; src/movegen.c:366:15
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	add	iy, de
	.loc	2 366 25                        ; src/movegen.c:366:25
	ld	a, (iy)
	.loc	2 366 15                        ; src/movegen.c:366:15
	ld	de, 0
	ld	e, a
	.loc	2 366 7                         ; src/movegen.c:366:7
	dec	de
	ld	bc, 12
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	nc, .LBB0_27
; %bb.20:                               ;   in Loop: Header=BB0_18 Depth=1
	ld	hl, JTI0_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB0_21
.LBB0_21:                               ;   in Loop: Header=BB0_18 Depth=1
	.local	.Ltmp19
.Ltmp19:
	.loc	2 369 46 is_stmt 1              ; src/movegen.c:369:46
	ld	a, (ix - 14)
	.loc	2 369 54 is_stmt 0              ; src/movegen.c:369:54
	ld	hl, (ix - 6)
	.loc	2 369 23                        ; src/movegen.c:369:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_pawn_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 369 21                        ; src/movegen.c:369:21
	ld	(ix - 6), hl
	.loc	2 370 11 is_stmt 1              ; src/movegen.c:370:11
	jp	.LBB0_27
	.local	.LBB0_22
.LBB0_22:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 374 48                        ; src/movegen.c:374:48
	ld	a, (ix - 14)
	.loc	2 374 56 is_stmt 0              ; src/movegen.c:374:56
	ld	hl, (ix - 6)
	.loc	2 374 23                        ; src/movegen.c:374:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_knight_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 374 21                        ; src/movegen.c:374:21
	ld	(ix - 6), hl
	.loc	2 375 11 is_stmt 1              ; src/movegen.c:375:11
	jr	.LBB0_27
	.local	.LBB0_23
.LBB0_23:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 379 48                        ; src/movegen.c:379:48
	ld	a, (ix - 14)
	.loc	2 379 56 is_stmt 0              ; src/movegen.c:379:56
	ld	hl, (ix - 6)
	.loc	2 379 23                        ; src/movegen.c:379:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_bishop_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 379 21                        ; src/movegen.c:379:21
	ld	(ix - 6), hl
	.loc	2 380 11 is_stmt 1              ; src/movegen.c:380:11
	jr	.LBB0_27
	.local	.LBB0_24
.LBB0_24:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 384 46                        ; src/movegen.c:384:46
	ld	a, (ix - 14)
	.loc	2 384 54 is_stmt 0              ; src/movegen.c:384:54
	ld	hl, (ix - 6)
	.loc	2 384 23                        ; src/movegen.c:384:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_rook_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 384 21                        ; src/movegen.c:384:21
	ld	(ix - 6), hl
	.loc	2 385 11 is_stmt 1              ; src/movegen.c:385:11
	jr	.LBB0_27
	.local	.LBB0_25
.LBB0_25:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 389 47                        ; src/movegen.c:389:47
	ld	a, (ix - 14)
	.loc	2 389 55 is_stmt 0              ; src/movegen.c:389:55
	ld	hl, (ix - 6)
	.loc	2 389 23                        ; src/movegen.c:389:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_queen_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 389 21                        ; src/movegen.c:389:21
	ld	(ix - 6), hl
	.loc	2 390 11 is_stmt 1              ; src/movegen.c:390:11
	jr	.LBB0_27
	.local	.LBB0_26
.LBB0_26:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 394 46                        ; src/movegen.c:394:46
	ld	a, (ix - 14)
	.loc	2 394 54 is_stmt 0              ; src/movegen.c:394:54
	ld	hl, (ix - 6)
	.loc	2 394 23                        ; src/movegen.c:394:23
	push	hl
	ld	l, a
	push	hl
	call	_generate_king_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 394 21                        ; src/movegen.c:394:21
	ld	(ix - 6), hl
	.loc	2 395 11 is_stmt 1              ; src/movegen.c:395:11
	jr	.LBB0_27
	.local	.Ltmp20
.Ltmp20:
	.local	.LBB0_27
.LBB0_27:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 397 5                         ; src/movegen.c:397:5
	jr	.LBB0_28
	.local	.Ltmp21
.Ltmp21:
	.local	.LBB0_28
.LBB0_28:                               ;   in Loop: Header=BB0_18 Depth=1
	.loc	2 362 35                        ; src/movegen.c:362:35
	inc	(ix - 13)
	.loc	2 362 5 is_stmt 0               ; src/movegen.c:362:5
	jp	.LBB0_18
	.local	.Ltmp22
.Ltmp22:
	.local	.LBB0_29
.LBB0_29:
	.loc	2 0 5                           ; src/movegen.c:0:5
	jr	.LBB0_30
	.local	.LBB0_30
.LBB0_30:
	.loc	2 400 10 is_stmt 1              ; src/movegen.c:400:10
	ld	hl, (ix - 6)
	.loc	2 400 3 epilogue_begin is_stmt 0 ; src/movegen.c:400:3
	ld	iy, 14
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp23
.Ltmp23:
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_generate_moves, .Lfunc_end0-_generate_moves
	.section	.rodata._generate_moves,"a",@progbits
JTI0_0:
	d24	.LBB0_21
	d24	.LBB0_21
	d24	.LBB0_22
	d24	.LBB0_22
	d24	.LBB0_23
	d24	.LBB0_23
	d24	.LBB0_24
	d24	.LBB0_24
	d24	.LBB0_25
	d24	.LBB0_25
	d24	.LBB0_26
	d24	.LBB0_26
JTI0_1:
	d24	.LBB0_8
	d24	.LBB0_8
	d24	.LBB0_9
	d24	.LBB0_9
	d24	.LBB0_10
	d24	.LBB0_10
	d24	.LBB0_11
	d24	.LBB0_11
	d24	.LBB0_12
	d24	.LBB0_12
	d24	.LBB0_13
	d24	.LBB0_13
                                        ; -- End function
	.section	.text._generate_pawn_captures_at,"ax",@progbits
	.type	_generate_pawn_captures_at,@function ; -- Begin function generate_pawn_captures_at
_generate_pawn_captures_at:             ; @generate_pawn_captures_at
	.local	.Lfunc_begin1
.Lfunc_begin1:
	.loc	2 65 0 is_stmt 1                ; src/movegen.c:65:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -12
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	de, (ix + 9)
	ld	iy, _state
	or	a, a
	sbc	hl, hl
	ld	(ix - 1), a
	ld	(ix - 4), de
	.local	.Ltmp24
.Ltmp24:
	.loc	2 66 27 prologue_end            ; src/movegen.c:66:27
	ld	de, (_state+194)
	.loc	2 66 9 is_stmt 0                ; src/movegen.c:66:9
	ld	(ix - 7), de
	.local	.Ltmp25
.Ltmp25:
	.loc	2 68 12 is_stmt 1               ; src/movegen.c:68:12
	ld	(ix - 11), hl
	.loc	2 68 8 is_stmt 0                ; src/movegen.c:68:8
	jr	.LBB1_1
	.local	.LBB1_1
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp26
.Ltmp26:
	.loc	2 68 19                         ; src/movegen.c:68:19
	ld	hl, (ix - 11)
	.local	.Ltmp27
.Ltmp27:
	.loc	2 68 3                          ; src/movegen.c:68:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388606
	or	a, a
	sbc	hl, de
	jp	nc, .LBB1_23
	jr	.LBB1_2
	.local	.LBB1_2
.LBB1_2:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp28
.Ltmp28:
	.loc	2 69 9 is_stmt 1                ; src/movegen.c:69:9
	ld	hl, (ix - 7)
	.local	.Ltmp29
.Ltmp29:
	.loc	2 69 9 is_stmt 0                ; src/movegen.c:69:9
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB1_4
	jr	.LBB1_3
	.local	.LBB1_3
.LBB1_3:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp30
.Ltmp30:
	.loc	2 69 37                         ; src/movegen.c:69:37
	ld	a, (ix - 1)
	.loc	2 69 69                         ; src/movegen.c:69:69
	ld	de, (ix - 11)
	.loc	2 69 46                         ; src/movegen.c:69:46
	ld	hl, _w_pawn_capture_offsets
	add	hl, de
	ld	l, (hl)
	.loc	2 69 44                         ; src/movegen.c:69:44
	add	a, l
	ld	l, a
	.loc	2 69 35                         ; src/movegen.c:69:35
	ld	(ix - 8), l
	.loc	2 69 28                         ; src/movegen.c:69:28
	jr	.LBB1_5
	.local	.LBB1_4
.LBB1_4:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 70 19 is_stmt 1               ; src/movegen.c:70:19
	ld	a, (ix - 1)
	.loc	2 70 51 is_stmt 0               ; src/movegen.c:70:51
	ld	de, (ix - 11)
	.loc	2 70 28                         ; src/movegen.c:70:28
	ld	hl, _b_pawn_capture_offsets
	add	hl, de
	ld	l, (hl)
	.loc	2 70 26                         ; src/movegen.c:70:26
	add	a, l
	ld	l, a
	.loc	2 70 17                         ; src/movegen.c:70:17
	ld	(ix - 8), l
	jr	.LBB1_5
	.local	.Ltmp31
.Ltmp31:
	.local	.LBB1_5
.LBB1_5:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 72 12 is_stmt 1               ; src/movegen.c:72:12
	ld	a, (ix - 8)
	ld	l, -120
	.loc	2 72 20 is_stmt 0               ; src/movegen.c:72:20
	and	a, l
	ld	l, a
	.local	.Ltmp32
.Ltmp32:
	.loc	2 72 9                          ; src/movegen.c:72:9
	ld	a, l
	or	a, a
	jp	nz, .LBB1_21
	jr	.LBB1_6
	.local	.LBB1_6
.LBB1_6:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp33
.Ltmp33:
	.loc	2 73 11 is_stmt 1               ; src/movegen.c:73:11
	ld	l, (ix - 8)
	.loc	2 73 28 is_stmt 0               ; src/movegen.c:73:28
	ld	a, (_state+197)
	ld	e, a
	.loc	2 73 47                         ; src/movegen.c:73:47
	ld	a, l
	cp	a, e
	jp	nz, .LBB1_9
	jr	.LBB1_7
	.local	.LBB1_7
.LBB1_7:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 73 57                         ; src/movegen.c:73:57
	ld	a, (_state+198)
	.local	.Ltmp34
.Ltmp34:
	.loc	2 73 11                         ; src/movegen.c:73:11
	bit	0, a
	jp	z, .LBB1_9
	jr	.LBB1_8
	.local	.LBB1_8
.LBB1_8:                                ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp35
.Ltmp35:
	.loc	2 74 30 is_stmt 1               ; src/movegen.c:74:30
	ld	a, (ix - 1)
	.loc	2 74 38 is_stmt 0               ; src/movegen.c:74:38
	ld	l, (ix - 8)
	.loc	2 74 80                         ; src/movegen.c:74:80
	ld	de, (ix - 4)
	.loc	2 74 21                         ; src/movegen.c:74:21
	push	de
	ld	de, 8
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 74 19                         ; src/movegen.c:74:19
	ld	(ix - 4), hl
	.loc	2 75 7 is_stmt 1                ; src/movegen.c:75:7
	jp	.LBB1_20
	.local	.Ltmp36
.Ltmp36:
	.local	.LBB1_9
.LBB1_9:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 78 44                         ; src/movegen.c:78:44
	ld	a, (ix - 8)
	.loc	2 78 31 is_stmt 0               ; src/movegen.c:78:31
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 78 15                         ; src/movegen.c:78:15
	ld	(ix - 12), a
	.local	.Ltmp37
.Ltmp37:
	.loc	2 79 13 is_stmt 1               ; src/movegen.c:79:13
	ld	a, (ix - 12)
	.local	.Ltmp38
.Ltmp38:
	.loc	2 79 13 is_stmt 0               ; src/movegen.c:79:13
	or	a, a
	jp	z, .LBB1_19
	jr	.LBB1_10
	.local	.LBB1_10
.LBB1_10:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp39
.Ltmp39:
	.loc	2 80 18 is_stmt 1               ; src/movegen.c:80:18
	ld	a, (ix - 12)
	ld	l, 1
	.loc	2 80 32 is_stmt 0               ; src/movegen.c:80:32
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 80 16                         ; src/movegen.c:80:16
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 80 64                         ; src/movegen.c:80:64
	ld	de, (_state+194)
	.local	.Ltmp40
.Ltmp40:
	.loc	2 80 15                         ; src/movegen.c:80:15
	or	a, a
	sbc	hl, de
	jp	z, .LBB1_18
	jr	.LBB1_11
	.local	.LBB1_11
.LBB1_11:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp41
.Ltmp41:
	.loc	2 81 17 is_stmt 1               ; src/movegen.c:81:17
	ld	a, (ix - 8)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp42
.Ltmp42:
	.loc	2 81 17 is_stmt 0               ; src/movegen.c:81:17
	ld	de, -8388608
	add	hl, de
	ld	de, -8388592
	or	a, a
	sbc	hl, de
	jp	nc, .LBB1_13
	jr	.LBB1_12
	.local	.LBB1_12
.LBB1_12:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp43
.Ltmp43:
	.loc	2 82 36 is_stmt 1               ; src/movegen.c:82:36
	ld	a, (ix - 1)
	.loc	2 82 44 is_stmt 0               ; src/movegen.c:82:44
	ld	l, (ix - 8)
	.loc	2 82 86                         ; src/movegen.c:82:86
	ld	de, (ix - 4)
	.loc	2 82 27                         ; src/movegen.c:82:27
	push	de
	ld	de, 144
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 82 25                         ; src/movegen.c:82:25
	ld	(ix - 4), hl
	.loc	2 83 36 is_stmt 1               ; src/movegen.c:83:36
	ld	a, (ix - 1)
	.loc	2 83 44 is_stmt 0               ; src/movegen.c:83:44
	ld	l, (ix - 8)
	.loc	2 83 86                         ; src/movegen.c:83:86
	ld	de, (ix - 4)
	.loc	2 83 27                         ; src/movegen.c:83:27
	push	de
	ld	de, 112
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 83 25                         ; src/movegen.c:83:25
	ld	(ix - 4), hl
	.loc	2 84 36 is_stmt 1               ; src/movegen.c:84:36
	ld	a, (ix - 1)
	.loc	2 84 44 is_stmt 0               ; src/movegen.c:84:44
	ld	l, (ix - 8)
	.loc	2 84 86                         ; src/movegen.c:84:86
	ld	de, (ix - 4)
	.loc	2 84 27                         ; src/movegen.c:84:27
	push	de
	ld	de, 80
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 84 25                         ; src/movegen.c:84:25
	ld	(ix - 4), hl
	.loc	2 85 36 is_stmt 1               ; src/movegen.c:85:36
	ld	a, (ix - 1)
	.loc	2 85 44 is_stmt 0               ; src/movegen.c:85:44
	ld	l, (ix - 8)
	.loc	2 85 86                         ; src/movegen.c:85:86
	ld	de, (ix - 4)
	.loc	2 85 27                         ; src/movegen.c:85:27
	push	de
	ld	de, 48
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 85 25                         ; src/movegen.c:85:25
	ld	(ix - 4), hl
	.loc	2 86 13 is_stmt 1               ; src/movegen.c:86:13
	jp	.LBB1_17
	.local	.Ltmp44
.Ltmp44:
	.local	.LBB1_13
.LBB1_13:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 88 22                         ; src/movegen.c:88:22
	ld	a, (ix - 8)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp45
.Ltmp45:
	.loc	2 88 22 is_stmt 0               ; src/movegen.c:88:22
	ld	de, -8388608
	add	hl, de
	ld	de, -8388496
	or	a, a
	sbc	hl, de
	jp	c, .LBB1_15
	jr	.LBB1_14
	.local	.LBB1_14
.LBB1_14:                               ;   in Loop: Header=BB1_1 Depth=1
	.local	.Ltmp46
.Ltmp46:
	.loc	2 89 36 is_stmt 1               ; src/movegen.c:89:36
	ld	a, (ix - 1)
	.loc	2 89 44 is_stmt 0               ; src/movegen.c:89:44
	ld	l, (ix - 8)
	.loc	2 89 87                         ; src/movegen.c:89:87
	ld	de, (ix - 4)
	.loc	2 89 27                         ; src/movegen.c:89:27
	push	de
	ld	de, 160
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 89 25                         ; src/movegen.c:89:25
	ld	(ix - 4), hl
	.loc	2 90 36 is_stmt 1               ; src/movegen.c:90:36
	ld	a, (ix - 1)
	.loc	2 90 44 is_stmt 0               ; src/movegen.c:90:44
	ld	l, (ix - 8)
	.loc	2 90 86                         ; src/movegen.c:90:86
	ld	de, (ix - 4)
	.loc	2 90 27                         ; src/movegen.c:90:27
	push	de
	ld	de, 128
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 90 25                         ; src/movegen.c:90:25
	ld	(ix - 4), hl
	.loc	2 91 36 is_stmt 1               ; src/movegen.c:91:36
	ld	a, (ix - 1)
	.loc	2 91 44 is_stmt 0               ; src/movegen.c:91:44
	ld	l, (ix - 8)
	.loc	2 91 86                         ; src/movegen.c:91:86
	ld	de, (ix - 4)
	.loc	2 91 27                         ; src/movegen.c:91:27
	push	de
	ld	de, 96
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 91 25                         ; src/movegen.c:91:25
	ld	(ix - 4), hl
	.loc	2 92 36 is_stmt 1               ; src/movegen.c:92:36
	ld	a, (ix - 1)
	.loc	2 92 44 is_stmt 0               ; src/movegen.c:92:44
	ld	l, (ix - 8)
	.loc	2 92 86                         ; src/movegen.c:92:86
	ld	de, (ix - 4)
	.loc	2 92 27                         ; src/movegen.c:92:27
	push	de
	ld	de, 64
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 92 25                         ; src/movegen.c:92:25
	ld	(ix - 4), hl
	.loc	2 93 13 is_stmt 1               ; src/movegen.c:93:13
	jp	.LBB1_16
	.local	.Ltmp47
.Ltmp47:
	.local	.LBB1_15
.LBB1_15:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 96 36                         ; src/movegen.c:96:36
	ld	a, (ix - 1)
	.loc	2 96 44 is_stmt 0               ; src/movegen.c:96:44
	ld	l, (ix - 8)
	.loc	2 96 55                         ; src/movegen.c:96:55
	ld	de, (ix - 4)
	.loc	2 96 27                         ; src/movegen.c:96:27
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 96 25                         ; src/movegen.c:96:25
	ld	(ix - 4), hl
	jr	.LBB1_16
	.local	.Ltmp48
.Ltmp48:
	.local	.LBB1_16
.LBB1_16:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 0 25                          ; src/movegen.c:0:25
	ld	iy, _state
	jr	.LBB1_17
	.local	.LBB1_17
.LBB1_17:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 98 11 is_stmt 1               ; src/movegen.c:98:11
	jr	.LBB1_18
	.local	.Ltmp49
.Ltmp49:
	.local	.LBB1_18
.LBB1_18:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 99 9                          ; src/movegen.c:99:9
	jr	.LBB1_19
	.local	.Ltmp50
.Ltmp50:
	.local	.LBB1_19
.LBB1_19:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 0 9 is_stmt 0                 ; src/movegen.c:0:9
	jr	.LBB1_20
	.local	.LBB1_20
.LBB1_20:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 101 5 is_stmt 1               ; src/movegen.c:101:5
	jr	.LBB1_21
	.local	.Ltmp51
.Ltmp51:
	.local	.LBB1_21
.LBB1_21:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 102 3                         ; src/movegen.c:102:3
	jr	.LBB1_22
	.local	.Ltmp52
.Ltmp52:
	.local	.LBB1_22
.LBB1_22:                               ;   in Loop: Header=BB1_1 Depth=1
	.loc	2 68 27                         ; src/movegen.c:68:27
	ld	hl, (ix - 11)
	inc	hl
	ld	(ix - 11), hl
	.loc	2 68 3 is_stmt 0                ; src/movegen.c:68:3
	jp	.LBB1_1
	.local	.Ltmp53
.Ltmp53:
	.local	.LBB1_23
.LBB1_23:
	.loc	2 104 10 is_stmt 1              ; src/movegen.c:104:10
	ld	hl, (ix - 4)
	.loc	2 104 3 epilogue_begin is_stmt 0 ; src/movegen.c:104:3
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp54
.Ltmp54:
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_generate_pawn_captures_at, .Lfunc_end1-_generate_pawn_captures_at
                                        ; -- End function
	.section	.text._generate_knight_captures_at,"ax",@progbits
	.type	_generate_knight_captures_at,@function ; -- Begin function generate_knight_captures_at
_generate_knight_captures_at:           ; @generate_knight_captures_at
	.local	.Lfunc_begin2
.Lfunc_begin2:
	.loc	2 107 0 is_stmt 1               ; src/movegen.c:107:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -12
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _knight_offsets
	ld	(ix - 8), a
	ld	(ix - 11), hl
	.local	.Ltmp55
.Ltmp55:
	.loc	2 109 16 prologue_end           ; src/movegen.c:109:16
	ld	(ix - 12), 0
	.loc	2 109 8 is_stmt 0               ; src/movegen.c:109:8
	jr	.LBB2_1
	.local	.LBB2_1
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp56
.Ltmp56:
	.loc	2 109 23                        ; src/movegen.c:109:23
	ld	a, (ix - 12)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp57
.Ltmp57:
	.loc	2 109 3                         ; src/movegen.c:109:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB2_10
	jr	.LBB2_2
	.local	.LBB2_2
.LBB2_2:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp58
.Ltmp58:
	.loc	2 110 47 is_stmt 1              ; src/movegen.c:110:47
	ld	a, (ix - 8)
	.loc	2 110 70 is_stmt 0              ; src/movegen.c:110:70
	ld	l, (ix - 12)
	.loc	2 110 55                        ; src/movegen.c:110:55
	ld	de, 0
	ld	e, l
	lea	hl, iy + 0
	add	hl, de
	ld	l, (hl)
	.loc	2 110 74                        ; src/movegen.c:110:74
	ld	de, (ix - 11)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 5), de
	.local	.Ltmp59
.Ltmp59:
	.loc	2 31 19 is_stmt 1               ; src/movegen.c:31:19
	ld	a, (ix - 1)
	.loc	2 31 28 is_stmt 0               ; src/movegen.c:31:28
	ld	l, (ix - 2)
	.loc	2 31 26                         ; src/movegen.c:31:26
	add	a, l
	ld	l, a
	.loc	2 31 10                         ; src/movegen.c:31:10
	ld	(ix - 6), l
	.local	.Ltmp60
.Ltmp60:
	.loc	2 32 10 is_stmt 1               ; src/movegen.c:32:10
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 32 18 is_stmt 0               ; src/movegen.c:32:18
	and	a, l
	ld	l, a
	.local	.Ltmp61
.Ltmp61:
	.loc	2 32 7                          ; src/movegen.c:32:7
	ld	a, l
	or	a, a
	jp	nz, .LBB2_8
	jr	.LBB2_3
	.local	.LBB2_3
.LBB2_3:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp62
.Ltmp62:
	.loc	2 33 40 is_stmt 1               ; src/movegen.c:33:40
	ld	a, (ix - 6)
	.loc	2 33 27 is_stmt 0               ; src/movegen.c:33:27
	ld	de, 0
	ld	e, a
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	.loc	2 33 11                         ; src/movegen.c:33:11
	ld	(ix - 7), a
	.local	.Ltmp63
.Ltmp63:
	.loc	2 34 9 is_stmt 1                ; src/movegen.c:34:9
	ld	a, (ix - 7)
	.local	.Ltmp64
.Ltmp64:
	.loc	2 34 9 is_stmt 0                ; src/movegen.c:34:9
	or	a, a
	jp	z, .LBB2_7
	jr	.LBB2_4
	.local	.LBB2_4
.LBB2_4:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp65
.Ltmp65:
	.loc	2 35 14 is_stmt 1               ; src/movegen.c:35:14
	ld	a, (ix - 7)
	ld	l, 1
	.loc	2 35 28 is_stmt 0               ; src/movegen.c:35:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 35 12                         ; src/movegen.c:35:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 35 60                         ; src/movegen.c:35:60
	ld	de, (_state+194)
	.local	.Ltmp66
.Ltmp66:
	.loc	2 35 11                         ; src/movegen.c:35:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB2_6
	jr	.LBB2_5
	.local	.LBB2_5
.LBB2_5:                                ;   in Loop: Header=BB2_1 Depth=1
	.local	.Ltmp67
.Ltmp67:
	.loc	2 36 30 is_stmt 1               ; src/movegen.c:36:30
	ld	a, (ix - 1)
	.loc	2 36 38 is_stmt 0               ; src/movegen.c:36:38
	ld	l, (ix - 6)
	.loc	2 36 49                         ; src/movegen.c:36:49
	ld	de, (ix - 5)
	.loc	2 36 21                         ; src/movegen.c:36:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _knight_offsets
	.loc	2 36 19                         ; src/movegen.c:36:19
	ld	(ix - 5), hl
	.loc	2 37 7 is_stmt 1                ; src/movegen.c:37:7
	jr	.LBB2_6
	.local	.Ltmp68
.Ltmp68:
	.local	.LBB2_6
.LBB2_6:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	2 38 5                          ; src/movegen.c:38:5
	jr	.LBB2_7
	.local	.Ltmp69
.Ltmp69:
	.local	.LBB2_7
.LBB2_7:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	2 39 3                          ; src/movegen.c:39:3
	jr	.LBB2_8
	.local	.Ltmp70
.Ltmp70:
	.local	.LBB2_8
.LBB2_8:                                ; %generate_stepping_captures_at.exit
                                        ;   in Loop: Header=BB2_1 Depth=1
	.loc	2 41 10                         ; src/movegen.c:41:10
	ld	hl, (ix - 5)
	.local	.Ltmp71
.Ltmp71:
	.loc	2 110 15                        ; src/movegen.c:110:15
	ld	(ix - 11), hl
	.loc	2 111 3                         ; src/movegen.c:111:3
	jr	.LBB2_9
	.local	.Ltmp72
.Ltmp72:
	.local	.LBB2_9
.LBB2_9:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	2 109 31                        ; src/movegen.c:109:31
	inc	(ix - 12)
	.loc	2 109 3 is_stmt 0               ; src/movegen.c:109:3
	jp	.LBB2_1
	.local	.Ltmp73
.Ltmp73:
	.local	.LBB2_10
.LBB2_10:
	.loc	2 113 10 is_stmt 1              ; src/movegen.c:113:10
	ld	hl, (ix - 11)
	.loc	2 113 3 epilogue_begin is_stmt 0 ; src/movegen.c:113:3
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp74
.Ltmp74:
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_generate_knight_captures_at, .Lfunc_end2-_generate_knight_captures_at
                                        ; -- End function
	.section	.text._generate_bishop_captures_at,"ax",@progbits
	.type	_generate_bishop_captures_at,@function ; -- Begin function generate_bishop_captures_at
_generate_bishop_captures_at:           ; @generate_bishop_captures_at
	.local	.Lfunc_begin3
.Lfunc_begin3:
	.loc	2 116 0 is_stmt 1               ; src/movegen.c:116:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -32
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _state
	ld	(ix - 29), a
	ld	(ix - 32), hl
	.local	.Ltmp75
.Ltmp75:
	.loc	2 117 44 prologue_end           ; src/movegen.c:117:44
	ld	a, (ix - 29)
	.loc	2 117 59 is_stmt 0              ; src/movegen.c:117:59
	ld	hl, (ix - 32)
	ld	(ix - 1), a
	ld	(ix - 2), -15
	ld	(ix - 5), hl
	.local	.Ltmp76
.Ltmp76:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 1)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 2)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 6), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB3_1
	.local	.LBB3_1
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_7
	jr	.LBB3_2
	.local	.LBB3_2
.LBB3_2:                                ;   in Loop: Header=BB3_1 Depth=1
	.local	.Ltmp77
.Ltmp77:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 6)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 7), a
	.local	.Ltmp78
.Ltmp78:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 7)
	.local	.Ltmp79
.Ltmp79:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB3_4
	jr	.LBB3_3
	.local	.LBB3_3
.LBB3_3:                                ;   in Loop: Header=BB3_1 Depth=1
	.local	.Ltmp80
.Ltmp80:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 2)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 6)
	add	a, l
	ld	l, a
	ld	(ix - 6), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB3_1
	.local	.Ltmp81
.Ltmp81:
	.local	.LBB3_4
.LBB3_4:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 7)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp82
.Ltmp82:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_6
	jr	.LBB3_5
	.local	.LBB3_5
.LBB3_5:
	.local	.Ltmp83
.Ltmp83:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 1)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 6)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 5)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 5), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB3_6
	.local	.Ltmp84
.Ltmp84:
	.local	.LBB3_6
.LBB3_6:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB3_7
	.local	.Ltmp85
.Ltmp85:
	.local	.LBB3_7
.LBB3_7:                                ; %generate_sliding_captures_at.exit3
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 5)
	.local	.Ltmp86
.Ltmp86:
	.loc	2 117 13                        ; src/movegen.c:117:13
	ld	(ix - 32), hl
	.loc	2 118 44                        ; src/movegen.c:118:44
	ld	a, (ix - 29)
	.loc	2 118 58 is_stmt 0              ; src/movegen.c:118:58
	ld	hl, (ix - 32)
	ld	(ix - 8), a
	ld	(ix - 9), 17
	ld	(ix - 12), hl
	.local	.Ltmp87
.Ltmp87:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 8)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 9)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 13), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB3_8
	.local	.LBB3_8
.LBB3_8:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 13)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_14
	jr	.LBB3_9
	.local	.LBB3_9
.LBB3_9:                                ;   in Loop: Header=BB3_8 Depth=1
	.local	.Ltmp88
.Ltmp88:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 13)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 14), a
	.local	.Ltmp89
.Ltmp89:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 14)
	.local	.Ltmp90
.Ltmp90:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB3_11
	jr	.LBB3_10
	.local	.LBB3_10
.LBB3_10:                               ;   in Loop: Header=BB3_8 Depth=1
	.local	.Ltmp91
.Ltmp91:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 9)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 13)
	add	a, l
	ld	l, a
	ld	(ix - 13), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB3_8
	.local	.Ltmp92
.Ltmp92:
	.local	.LBB3_11
.LBB3_11:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 14)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp93
.Ltmp93:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_13
	jr	.LBB3_12
	.local	.LBB3_12
.LBB3_12:
	.local	.Ltmp94
.Ltmp94:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 8)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 13)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 12)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 12), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB3_13
	.local	.Ltmp95
.Ltmp95:
	.local	.LBB3_13
.LBB3_13:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB3_14
	.local	.Ltmp96
.Ltmp96:
	.local	.LBB3_14
.LBB3_14:                               ; %generate_sliding_captures_at.exit2
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 12)
	.local	.Ltmp97
.Ltmp97:
	.loc	2 118 13                        ; src/movegen.c:118:13
	ld	(ix - 32), hl
	.loc	2 119 44                        ; src/movegen.c:119:44
	ld	a, (ix - 29)
	.loc	2 119 58 is_stmt 0              ; src/movegen.c:119:58
	ld	hl, (ix - 32)
	ld	(ix - 15), a
	ld	(ix - 16), 15
	ld	(ix - 19), hl
	.local	.Ltmp98
.Ltmp98:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 15)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 16)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 20), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB3_15
	.local	.LBB3_15
.LBB3_15:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 20)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_21
	jr	.LBB3_16
	.local	.LBB3_16
.LBB3_16:                               ;   in Loop: Header=BB3_15 Depth=1
	.local	.Ltmp99
.Ltmp99:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 20)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 21), a
	.local	.Ltmp100
.Ltmp100:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 21)
	.local	.Ltmp101
.Ltmp101:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB3_18
	jr	.LBB3_17
	.local	.LBB3_17
.LBB3_17:                               ;   in Loop: Header=BB3_15 Depth=1
	.local	.Ltmp102
.Ltmp102:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 16)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 20)
	add	a, l
	ld	l, a
	ld	(ix - 20), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB3_15
	.local	.Ltmp103
.Ltmp103:
	.local	.LBB3_18
.LBB3_18:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 21)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp104
.Ltmp104:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_20
	jr	.LBB3_19
	.local	.LBB3_19
.LBB3_19:
	.local	.Ltmp105
.Ltmp105:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 15)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 20)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 19)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 19), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB3_20
	.local	.Ltmp106
.Ltmp106:
	.local	.LBB3_20
.LBB3_20:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB3_21
	.local	.Ltmp107
.Ltmp107:
	.local	.LBB3_21
.LBB3_21:                               ; %generate_sliding_captures_at.exit1
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 19)
	.local	.Ltmp108
.Ltmp108:
	.loc	2 119 13                        ; src/movegen.c:119:13
	ld	(ix - 32), hl
	.loc	2 120 44                        ; src/movegen.c:120:44
	ld	a, (ix - 29)
	.loc	2 120 59 is_stmt 0              ; src/movegen.c:120:59
	ld	hl, (ix - 32)
	ld	(ix - 22), a
	ld	(ix - 23), -17
	ld	(ix - 26), hl
	.local	.Ltmp109
.Ltmp109:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 22)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 23)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 27), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB3_22
	.local	.LBB3_22
.LBB3_22:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 27)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB3_28
	jr	.LBB3_23
	.local	.LBB3_23
.LBB3_23:                               ;   in Loop: Header=BB3_22 Depth=1
	.local	.Ltmp110
.Ltmp110:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 27)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 28), a
	.local	.Ltmp111
.Ltmp111:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 28)
	.local	.Ltmp112
.Ltmp112:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB3_25
	jr	.LBB3_24
	.local	.LBB3_24
.LBB3_24:                               ;   in Loop: Header=BB3_22 Depth=1
	.local	.Ltmp113
.Ltmp113:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 23)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 27)
	add	a, l
	ld	l, a
	ld	(ix - 27), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB3_22
	.local	.Ltmp114
.Ltmp114:
	.local	.LBB3_25
.LBB3_25:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 28)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp115
.Ltmp115:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB3_27
	jr	.LBB3_26
	.local	.LBB3_26
.LBB3_26:
	.local	.Ltmp116
.Ltmp116:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 22)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 27)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 26)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 26), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB3_27
	.local	.Ltmp117
.Ltmp117:
	.local	.LBB3_27
.LBB3_27:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB3_28
	.local	.Ltmp118
.Ltmp118:
	.local	.LBB3_28
.LBB3_28:                               ; %generate_sliding_captures_at.exit
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 26)
	.local	.Ltmp119
.Ltmp119:
	.loc	2 120 13                        ; src/movegen.c:120:13
	ld	(ix - 32), hl
	.loc	2 122 10                        ; src/movegen.c:122:10
	ld	hl, (ix - 32)
	.loc	2 122 3 epilogue_begin is_stmt 0 ; src/movegen.c:122:3
	ld	iy, 32
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp120
.Ltmp120:
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_generate_bishop_captures_at, .Lfunc_end3-_generate_bishop_captures_at
                                        ; -- End function
	.section	.text._generate_rook_captures_at,"ax",@progbits
	.type	_generate_rook_captures_at,@function ; -- Begin function generate_rook_captures_at
_generate_rook_captures_at:             ; @generate_rook_captures_at
	.local	.Lfunc_begin4
.Lfunc_begin4:
	.loc	2 125 0 is_stmt 1               ; src/movegen.c:125:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -32
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _state
	ld	(ix - 29), a
	ld	(ix - 32), hl
	.local	.Ltmp121
.Ltmp121:
	.loc	2 126 44 prologue_end           ; src/movegen.c:126:44
	ld	a, (ix - 29)
	.loc	2 126 59 is_stmt 0              ; src/movegen.c:126:59
	ld	hl, (ix - 32)
	ld	(ix - 1), a
	ld	(ix - 2), -16
	ld	(ix - 5), hl
	.local	.Ltmp122
.Ltmp122:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 1)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 2)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 6), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB4_1
	.local	.LBB4_1
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_7
	jr	.LBB4_2
	.local	.LBB4_2
.LBB4_2:                                ;   in Loop: Header=BB4_1 Depth=1
	.local	.Ltmp123
.Ltmp123:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 6)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 7), a
	.local	.Ltmp124
.Ltmp124:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 7)
	.local	.Ltmp125
.Ltmp125:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB4_4
	jr	.LBB4_3
	.local	.LBB4_3
.LBB4_3:                                ;   in Loop: Header=BB4_1 Depth=1
	.local	.Ltmp126
.Ltmp126:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 2)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 6)
	add	a, l
	ld	l, a
	ld	(ix - 6), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB4_1
	.local	.Ltmp127
.Ltmp127:
	.local	.LBB4_4
.LBB4_4:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 7)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp128
.Ltmp128:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_6
	jr	.LBB4_5
	.local	.LBB4_5
.LBB4_5:
	.local	.Ltmp129
.Ltmp129:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 1)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 6)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 5)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 5), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB4_6
	.local	.Ltmp130
.Ltmp130:
	.local	.LBB4_6
.LBB4_6:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB4_7
	.local	.Ltmp131
.Ltmp131:
	.local	.LBB4_7
.LBB4_7:                                ; %generate_sliding_captures_at.exit3
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 5)
	.local	.Ltmp132
.Ltmp132:
	.loc	2 126 13                        ; src/movegen.c:126:13
	ld	(ix - 32), hl
	.loc	2 127 44                        ; src/movegen.c:127:44
	ld	a, (ix - 29)
	.loc	2 127 57 is_stmt 0              ; src/movegen.c:127:57
	ld	hl, (ix - 32)
	ld	(ix - 8), a
	ld	(ix - 9), 1
	ld	(ix - 12), hl
	.local	.Ltmp133
.Ltmp133:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 8)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 9)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 13), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB4_8
	.local	.LBB4_8
.LBB4_8:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 13)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_14
	jr	.LBB4_9
	.local	.LBB4_9
.LBB4_9:                                ;   in Loop: Header=BB4_8 Depth=1
	.local	.Ltmp134
.Ltmp134:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 13)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 14), a
	.local	.Ltmp135
.Ltmp135:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 14)
	.local	.Ltmp136
.Ltmp136:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB4_11
	jr	.LBB4_10
	.local	.LBB4_10
.LBB4_10:                               ;   in Loop: Header=BB4_8 Depth=1
	.local	.Ltmp137
.Ltmp137:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 9)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 13)
	add	a, l
	ld	l, a
	ld	(ix - 13), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB4_8
	.local	.Ltmp138
.Ltmp138:
	.local	.LBB4_11
.LBB4_11:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 14)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp139
.Ltmp139:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_13
	jr	.LBB4_12
	.local	.LBB4_12
.LBB4_12:
	.local	.Ltmp140
.Ltmp140:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 8)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 13)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 12)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 12), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB4_13
	.local	.Ltmp141
.Ltmp141:
	.local	.LBB4_13
.LBB4_13:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB4_14
	.local	.Ltmp142
.Ltmp142:
	.local	.LBB4_14
.LBB4_14:                               ; %generate_sliding_captures_at.exit2
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 12)
	.local	.Ltmp143
.Ltmp143:
	.loc	2 127 13                        ; src/movegen.c:127:13
	ld	(ix - 32), hl
	.loc	2 128 44                        ; src/movegen.c:128:44
	ld	a, (ix - 29)
	.loc	2 128 58 is_stmt 0              ; src/movegen.c:128:58
	ld	hl, (ix - 32)
	ld	(ix - 15), a
	ld	(ix - 16), 16
	ld	(ix - 19), hl
	.local	.Ltmp144
.Ltmp144:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 15)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 16)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 20), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB4_15
	.local	.LBB4_15
.LBB4_15:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 20)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_21
	jr	.LBB4_16
	.local	.LBB4_16
.LBB4_16:                               ;   in Loop: Header=BB4_15 Depth=1
	.local	.Ltmp145
.Ltmp145:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 20)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 21), a
	.local	.Ltmp146
.Ltmp146:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 21)
	.local	.Ltmp147
.Ltmp147:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB4_18
	jr	.LBB4_17
	.local	.LBB4_17
.LBB4_17:                               ;   in Loop: Header=BB4_15 Depth=1
	.local	.Ltmp148
.Ltmp148:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 16)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 20)
	add	a, l
	ld	l, a
	ld	(ix - 20), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB4_15
	.local	.Ltmp149
.Ltmp149:
	.local	.LBB4_18
.LBB4_18:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 21)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp150
.Ltmp150:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_20
	jr	.LBB4_19
	.local	.LBB4_19
.LBB4_19:
	.local	.Ltmp151
.Ltmp151:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 15)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 20)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 19)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 19), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB4_20
	.local	.Ltmp152
.Ltmp152:
	.local	.LBB4_20
.LBB4_20:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB4_21
	.local	.Ltmp153
.Ltmp153:
	.local	.LBB4_21
.LBB4_21:                               ; %generate_sliding_captures_at.exit1
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 19)
	.local	.Ltmp154
.Ltmp154:
	.loc	2 128 13                        ; src/movegen.c:128:13
	ld	(ix - 32), hl
	.loc	2 129 44                        ; src/movegen.c:129:44
	ld	a, (ix - 29)
	.loc	2 129 58 is_stmt 0              ; src/movegen.c:129:58
	ld	hl, (ix - 32)
	ld	(ix - 22), a
	ld	(ix - 23), -1
	ld	(ix - 26), hl
	.local	.Ltmp155
.Ltmp155:
	.loc	2 45 19 is_stmt 1               ; src/movegen.c:45:19
	ld	a, (ix - 22)
	.loc	2 45 28 is_stmt 0               ; src/movegen.c:45:28
	ld	l, (ix - 23)
	.loc	2 45 26                         ; src/movegen.c:45:26
	add	a, l
	ld	l, a
	.loc	2 45 10                         ; src/movegen.c:45:10
	ld	(ix - 27), l
	.loc	2 46 3 is_stmt 1                ; src/movegen.c:46:3
	jr	.LBB4_22
	.local	.LBB4_22
.LBB4_22:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 46 13 is_stmt 0               ; src/movegen.c:46:13
	ld	a, (ix - 27)
	ld	l, -120
	.loc	2 46 21                         ; src/movegen.c:46:21
	and	a, l
	ld	l, a
	.loc	2 46 3                          ; src/movegen.c:46:3
	ld	a, l
	or	a, a
	jp	nz, .LBB4_28
	jr	.LBB4_23
	.local	.LBB4_23
.LBB4_23:                               ;   in Loop: Header=BB4_22 Depth=1
	.local	.Ltmp156
.Ltmp156:
	.loc	2 47 40 is_stmt 1               ; src/movegen.c:47:40
	ld	a, (ix - 27)
	.loc	2 47 27 is_stmt 0               ; src/movegen.c:47:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 47 11                         ; src/movegen.c:47:11
	ld	(ix - 28), a
	.local	.Ltmp157
.Ltmp157:
	.loc	2 48 9 is_stmt 1                ; src/movegen.c:48:9
	ld	a, (ix - 28)
	.local	.Ltmp158
.Ltmp158:
	.loc	2 48 9 is_stmt 0                ; src/movegen.c:48:9
	or	a, a
	jr	nz, .LBB4_25
	jr	.LBB4_24
	.local	.LBB4_24
.LBB4_24:                               ;   in Loop: Header=BB4_22 Depth=1
	.local	.Ltmp159
.Ltmp159:
	.loc	2 49 17 is_stmt 1               ; src/movegen.c:49:17
	ld	l, (ix - 23)
	.loc	2 49 14 is_stmt 0               ; src/movegen.c:49:14
	ld	a, (ix - 27)
	add	a, l
	ld	l, a
	ld	(ix - 27), l
	.loc	2 50 7 is_stmt 1                ; src/movegen.c:50:7
	jr	.LBB4_22
	.local	.Ltmp160
.Ltmp160:
	.local	.LBB4_25
.LBB4_25:
	.loc	2 54 14                         ; src/movegen.c:54:14
	ld	a, (ix - 28)
	ld	l, 1
	.loc	2 54 28 is_stmt 0               ; src/movegen.c:54:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 54 12                         ; src/movegen.c:54:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 54 60                         ; src/movegen.c:54:60
	ld	de, (_state+194)
	.local	.Ltmp161
.Ltmp161:
	.loc	2 54 11                         ; src/movegen.c:54:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB4_27
	jr	.LBB4_26
	.local	.LBB4_26
.LBB4_26:
	.local	.Ltmp162
.Ltmp162:
	.loc	2 55 30 is_stmt 1               ; src/movegen.c:55:30
	ld	a, (ix - 22)
	.loc	2 55 38 is_stmt 0               ; src/movegen.c:55:38
	ld	l, (ix - 27)
	.loc	2 55 49                         ; src/movegen.c:55:49
	ld	de, (ix - 26)
	.loc	2 55 21                         ; src/movegen.c:55:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 55 19                         ; src/movegen.c:55:19
	ld	(ix - 26), hl
	.loc	2 56 7 is_stmt 1                ; src/movegen.c:56:7
	jr	.LBB4_27
	.local	.Ltmp163
.Ltmp163:
	.local	.LBB4_27
.LBB4_27:
	.loc	2 58 7                          ; src/movegen.c:58:7
	jr	.LBB4_28
	.local	.Ltmp164
.Ltmp164:
	.local	.LBB4_28
.LBB4_28:                               ; %generate_sliding_captures_at.exit
	.loc	2 62 10                         ; src/movegen.c:62:10
	ld	hl, (ix - 26)
	.local	.Ltmp165
.Ltmp165:
	.loc	2 129 13                        ; src/movegen.c:129:13
	ld	(ix - 32), hl
	.loc	2 131 10                        ; src/movegen.c:131:10
	ld	hl, (ix - 32)
	.loc	2 131 3 epilogue_begin is_stmt 0 ; src/movegen.c:131:3
	ld	iy, 32
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp166
.Ltmp166:
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_generate_rook_captures_at, .Lfunc_end4-_generate_rook_captures_at
                                        ; -- End function
	.section	.text._generate_queen_captures_at,"ax",@progbits
	.type	_generate_queen_captures_at,@function ; -- Begin function generate_queen_captures_at
_generate_queen_captures_at:            ; @generate_queen_captures_at
	.local	.Lfunc_begin5
.Lfunc_begin5:
	.loc	2 134 0 is_stmt 1               ; src/movegen.c:134:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -4
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	(ix - 1), a
	ld	(ix - 4), hl
	.local	.Ltmp167
.Ltmp167:
	.loc	2 135 43 prologue_end           ; src/movegen.c:135:43
	ld	a, (ix - 1)
	.loc	2 135 51 is_stmt 0              ; src/movegen.c:135:51
	ld	hl, (ix - 4)
	.loc	2 135 15                        ; src/movegen.c:135:15
	push	hl
	ld	l, a
	push	hl
	call	_generate_bishop_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 135 13                        ; src/movegen.c:135:13
	ld	(ix - 4), hl
	.loc	2 136 41 is_stmt 1              ; src/movegen.c:136:41
	ld	a, (ix - 1)
	.loc	2 136 49 is_stmt 0              ; src/movegen.c:136:49
	ld	hl, (ix - 4)
	.loc	2 136 15                        ; src/movegen.c:136:15
	push	hl
	ld	l, a
	push	hl
	call	_generate_rook_captures_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 136 13                        ; src/movegen.c:136:13
	ld	(ix - 4), hl
	.loc	2 138 10 is_stmt 1              ; src/movegen.c:138:10
	ld	hl, (ix - 4)
	.loc	2 138 3 epilogue_begin is_stmt 0 ; src/movegen.c:138:3
	ld	iy, 4
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp168
.Ltmp168:
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_generate_queen_captures_at, .Lfunc_end5-_generate_queen_captures_at
                                        ; -- End function
	.section	.text._generate_king_captures_at,"ax",@progbits
	.type	_generate_king_captures_at,@function ; -- Begin function generate_king_captures_at
_generate_king_captures_at:             ; @generate_king_captures_at
	.local	.Lfunc_begin6
.Lfunc_begin6:
	.loc	2 141 0 is_stmt 1               ; src/movegen.c:141:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -12
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _king_offsets
	ld	(ix - 8), a
	ld	(ix - 11), hl
	.local	.Ltmp169
.Ltmp169:
	.loc	2 143 16 prologue_end           ; src/movegen.c:143:16
	ld	(ix - 12), 0
	.loc	2 143 8 is_stmt 0               ; src/movegen.c:143:8
	jr	.LBB6_1
	.local	.LBB6_1
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp170
.Ltmp170:
	.loc	2 143 23                        ; src/movegen.c:143:23
	ld	a, (ix - 12)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp171
.Ltmp171:
	.loc	2 143 3                         ; src/movegen.c:143:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB6_10
	jr	.LBB6_2
	.local	.LBB6_2
.LBB6_2:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp172
.Ltmp172:
	.loc	2 144 47 is_stmt 1              ; src/movegen.c:144:47
	ld	a, (ix - 8)
	.loc	2 144 68 is_stmt 0              ; src/movegen.c:144:68
	ld	l, (ix - 12)
	.loc	2 144 55                        ; src/movegen.c:144:55
	ld	de, 0
	ld	e, l
	lea	hl, iy + 0
	add	hl, de
	ld	l, (hl)
	.loc	2 144 72                        ; src/movegen.c:144:72
	ld	de, (ix - 11)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 5), de
	.local	.Ltmp173
.Ltmp173:
	.loc	2 31 19 is_stmt 1               ; src/movegen.c:31:19
	ld	a, (ix - 1)
	.loc	2 31 28 is_stmt 0               ; src/movegen.c:31:28
	ld	l, (ix - 2)
	.loc	2 31 26                         ; src/movegen.c:31:26
	add	a, l
	ld	l, a
	.loc	2 31 10                         ; src/movegen.c:31:10
	ld	(ix - 6), l
	.local	.Ltmp174
.Ltmp174:
	.loc	2 32 10 is_stmt 1               ; src/movegen.c:32:10
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 32 18 is_stmt 0               ; src/movegen.c:32:18
	and	a, l
	ld	l, a
	.local	.Ltmp175
.Ltmp175:
	.loc	2 32 7                          ; src/movegen.c:32:7
	ld	a, l
	or	a, a
	jp	nz, .LBB6_8
	jr	.LBB6_3
	.local	.LBB6_3
.LBB6_3:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp176
.Ltmp176:
	.loc	2 33 40 is_stmt 1               ; src/movegen.c:33:40
	ld	a, (ix - 6)
	.loc	2 33 27 is_stmt 0               ; src/movegen.c:33:27
	ld	de, 0
	ld	e, a
	ld	hl, _state
	add	hl, de
	ld	a, (hl)
	.loc	2 33 11                         ; src/movegen.c:33:11
	ld	(ix - 7), a
	.local	.Ltmp177
.Ltmp177:
	.loc	2 34 9 is_stmt 1                ; src/movegen.c:34:9
	ld	a, (ix - 7)
	.local	.Ltmp178
.Ltmp178:
	.loc	2 34 9 is_stmt 0                ; src/movegen.c:34:9
	or	a, a
	jp	z, .LBB6_7
	jr	.LBB6_4
	.local	.LBB6_4
.LBB6_4:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp179
.Ltmp179:
	.loc	2 35 14 is_stmt 1               ; src/movegen.c:35:14
	ld	a, (ix - 7)
	ld	l, 1
	.loc	2 35 28 is_stmt 0               ; src/movegen.c:35:28
	and	a, l
	ld	l, a
	ld	e, 1
	.loc	2 35 12                         ; src/movegen.c:35:12
	ld	a, l
	xor	a, e
	ld	l, a
	ld	bc, 1
	call	__iand
	.loc	2 35 60                         ; src/movegen.c:35:60
	ld	de, (_state+194)
	.local	.Ltmp180
.Ltmp180:
	.loc	2 35 11                         ; src/movegen.c:35:11
	or	a, a
	sbc	hl, de
	jp	z, .LBB6_6
	jr	.LBB6_5
	.local	.LBB6_5
.LBB6_5:                                ;   in Loop: Header=BB6_1 Depth=1
	.local	.Ltmp181
.Ltmp181:
	.loc	2 36 30 is_stmt 1               ; src/movegen.c:36:30
	ld	a, (ix - 1)
	.loc	2 36 38 is_stmt 0               ; src/movegen.c:36:38
	ld	l, (ix - 6)
	.loc	2 36 49                         ; src/movegen.c:36:49
	ld	de, (ix - 5)
	.loc	2 36 21                         ; src/movegen.c:36:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _king_offsets
	.loc	2 36 19                         ; src/movegen.c:36:19
	ld	(ix - 5), hl
	.loc	2 37 7 is_stmt 1                ; src/movegen.c:37:7
	jr	.LBB6_6
	.local	.Ltmp182
.Ltmp182:
	.local	.LBB6_6
.LBB6_6:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	2 38 5                          ; src/movegen.c:38:5
	jr	.LBB6_7
	.local	.Ltmp183
.Ltmp183:
	.local	.LBB6_7
.LBB6_7:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	2 39 3                          ; src/movegen.c:39:3
	jr	.LBB6_8
	.local	.Ltmp184
.Ltmp184:
	.local	.LBB6_8
.LBB6_8:                                ; %generate_stepping_captures_at.exit
                                        ;   in Loop: Header=BB6_1 Depth=1
	.loc	2 41 10                         ; src/movegen.c:41:10
	ld	hl, (ix - 5)
	.local	.Ltmp185
.Ltmp185:
	.loc	2 144 15                        ; src/movegen.c:144:15
	ld	(ix - 11), hl
	.loc	2 145 3                         ; src/movegen.c:145:3
	jr	.LBB6_9
	.local	.Ltmp186
.Ltmp186:
	.local	.LBB6_9
.LBB6_9:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	2 143 31                        ; src/movegen.c:143:31
	inc	(ix - 12)
	.loc	2 143 3 is_stmt 0               ; src/movegen.c:143:3
	jp	.LBB6_1
	.local	.Ltmp187
.Ltmp187:
	.local	.LBB6_10
.LBB6_10:
	.loc	2 147 10 is_stmt 1              ; src/movegen.c:147:10
	ld	hl, (ix - 11)
	.loc	2 147 3 epilogue_begin is_stmt 0 ; src/movegen.c:147:3
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp188
.Ltmp188:
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_generate_king_captures_at, .Lfunc_end6-_generate_king_captures_at
                                        ; -- End function
	.section	.text._generate_pawn_moves_at,"ax",@progbits
	.type	_generate_pawn_moves_at,@function ; -- Begin function generate_pawn_moves_at
_generate_pawn_moves_at:                ; @generate_pawn_moves_at
	.local	.Lfunc_begin7
.Lfunc_begin7:
	.loc	2 179 0 is_stmt 1               ; src/movegen.c:179:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -6
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	bc, _state
	ld	(ix - 1), a
	ld	(ix - 4), hl
	.local	.Ltmp189
.Ltmp189:
	.loc	2 180 14 prologue_end           ; src/movegen.c:180:14
	ld	hl, (_state+194)
	.local	.Ltmp190
.Ltmp190:
	.loc	2 180 7 is_stmt 0               ; src/movegen.c:180:7
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB7_12
	jr	.LBB7_1
	.local	.LBB7_1
.LBB7_1:
	.local	.Ltmp191
.Ltmp191:
	.loc	2 181 21 is_stmt 1              ; src/movegen.c:181:21
	ld	a, (ix - 1)
	ld	l, -16
	.loc	2 181 28 is_stmt 0              ; src/movegen.c:181:28
	add	a, l
	ld	l, a
	.loc	2 181 12                        ; src/movegen.c:181:12
	ld	(ix - 5), l
	.local	.Ltmp192
.Ltmp192:
	.loc	2 182 23 is_stmt 1              ; src/movegen.c:182:23
	ld	a, (ix - 5)
	.loc	2 182 10 is_stmt 0              ; src/movegen.c:182:10
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.local	.Ltmp193
.Ltmp193:
	.loc	2 182 9                         ; src/movegen.c:182:9
	or	a, a
	jp	nz, .LBB7_11
	jr	.LBB7_2
	.local	.LBB7_2
.LBB7_2:
	.local	.Ltmp194
.Ltmp194:
	.loc	2 184 11 is_stmt 1              ; src/movegen.c:184:11
	ld	a, (ix - 5)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp195
.Ltmp195:
	.loc	2 184 11 is_stmt 0              ; src/movegen.c:184:11
	ld	de, -8388608
	add	hl, de
	ld	de, -8388592
	or	a, a
	sbc	hl, de
	jp	c, .LBB7_9
	jr	.LBB7_3
	.local	.LBB7_3
.LBB7_3:
	.local	.Ltmp196
.Ltmp196:
	.loc	2 185 30 is_stmt 1              ; src/movegen.c:185:30
	ld	a, (ix - 1)
	.loc	2 185 38 is_stmt 0              ; src/movegen.c:185:38
	ld	l, (ix - 5)
	.loc	2 185 49                        ; src/movegen.c:185:49
	ld	de, (ix - 4)
	.loc	2 185 21                        ; src/movegen.c:185:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 185 19                        ; src/movegen.c:185:19
	ld	(ix - 4), hl
	.local	.Ltmp197
.Ltmp197:
	.loc	2 188 19 is_stmt 1              ; src/movegen.c:188:19
	ld	a, (ix - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 188 26 is_stmt 0              ; src/movegen.c:188:26
	ld	de, -8388608
	ld	iy, 96
	add	iy, de
	add	hl, de
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jp	c, .LBB7_8
	jr	.LBB7_4
	.local	.LBB7_4
.LBB7_4:
	.loc	2 188 29                        ; src/movegen.c:188:29
	ld	a, (ix - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp198
.Ltmp198:
	.loc	2 188 13                        ; src/movegen.c:188:13
	ld	de, -8388608
	add	hl, de
	ld	de, -8388496
	or	a, a
	sbc	hl, de
	jp	nc, .LBB7_8
	jr	.LBB7_5
	.local	.LBB7_5
.LBB7_5:
	.local	.Ltmp199
.Ltmp199:
	.loc	2 189 29 is_stmt 1              ; src/movegen.c:189:29
	ld	a, (ix - 5)
	ld	de, 0
	ld	e, a
	ld	hl, _state
	push	hl
	pop	iy
	.loc	2 189 16 is_stmt 0              ; src/movegen.c:189:16
	add	iy, de
	ld	a, (iy - 16)
	.local	.Ltmp200
.Ltmp200:
	.loc	2 189 15                        ; src/movegen.c:189:15
	or	a, a
	jp	nz, .LBB7_7
	jr	.LBB7_6
	.local	.LBB7_6
.LBB7_6:
	.local	.Ltmp201
.Ltmp201:
	.loc	2 190 34 is_stmt 1              ; src/movegen.c:190:34
	ld	l, (ix - 1)
	.loc	2 190 42 is_stmt 0              ; src/movegen.c:190:42
	ld	a, (ix - 5)
	ld	e, -16
	.loc	2 190 49                        ; src/movegen.c:190:49
	add	a, e
	ld	e, a
	.loc	2 190 61                        ; src/movegen.c:190:61
	ld	bc, (ix - 4)
	.loc	2 190 25                        ; src/movegen.c:190:25
	push	bc
	ld	bc, 0
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 190 23                        ; src/movegen.c:190:23
	ld	(ix - 4), hl
	.loc	2 190 13                        ; src/movegen.c:190:13
	jr	.LBB7_7
	.local	.Ltmp202
.Ltmp202:
	.local	.LBB7_7
.LBB7_7:
	.loc	2 191 9 is_stmt 1               ; src/movegen.c:191:9
	jr	.LBB7_8
	.local	.Ltmp203
.Ltmp203:
	.local	.LBB7_8
.LBB7_8:
	.loc	2 192 7                         ; src/movegen.c:192:7
	jp	.LBB7_10
	.local	.Ltmp204
.Ltmp204:
	.local	.LBB7_9
.LBB7_9:
	.loc	2 196 30                        ; src/movegen.c:196:30
	ld	a, (ix - 1)
	.loc	2 196 38 is_stmt 0              ; src/movegen.c:196:38
	ld	l, (ix - 5)
	.loc	2 196 80                        ; src/movegen.c:196:80
	ld	de, (ix - 4)
	.loc	2 196 21                        ; src/movegen.c:196:21
	push	de
	ld	de, 144
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 196 19                        ; src/movegen.c:196:19
	ld	(ix - 4), hl
	.loc	2 197 30 is_stmt 1              ; src/movegen.c:197:30
	ld	a, (ix - 1)
	.loc	2 197 38 is_stmt 0              ; src/movegen.c:197:38
	ld	l, (ix - 5)
	.loc	2 197 80                        ; src/movegen.c:197:80
	ld	de, (ix - 4)
	.loc	2 197 21                        ; src/movegen.c:197:21
	push	de
	ld	de, 112
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 197 19                        ; src/movegen.c:197:19
	ld	(ix - 4), hl
	.loc	2 198 30 is_stmt 1              ; src/movegen.c:198:30
	ld	a, (ix - 1)
	.loc	2 198 38 is_stmt 0              ; src/movegen.c:198:38
	ld	l, (ix - 5)
	.loc	2 198 80                        ; src/movegen.c:198:80
	ld	de, (ix - 4)
	.loc	2 198 21                        ; src/movegen.c:198:21
	push	de
	ld	de, 80
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 198 19                        ; src/movegen.c:198:19
	ld	(ix - 4), hl
	.loc	2 199 30 is_stmt 1              ; src/movegen.c:199:30
	ld	a, (ix - 1)
	.loc	2 199 38 is_stmt 0              ; src/movegen.c:199:38
	ld	l, (ix - 5)
	.loc	2 199 80                        ; src/movegen.c:199:80
	ld	de, (ix - 4)
	.loc	2 199 21                        ; src/movegen.c:199:21
	push	de
	ld	de, 48
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 199 19                        ; src/movegen.c:199:19
	ld	(ix - 4), hl
	jr	.LBB7_10
	.local	.Ltmp205
.Ltmp205:
	.local	.LBB7_10
.LBB7_10:
	.loc	2 201 5 is_stmt 1               ; src/movegen.c:201:5
	jr	.LBB7_11
	.local	.Ltmp206
.Ltmp206:
	.local	.LBB7_11
.LBB7_11:
	.loc	2 202 3                         ; src/movegen.c:202:3
	jp	.LBB7_23
	.local	.Ltmp207
.Ltmp207:
	.local	.LBB7_12
.LBB7_12:
	.loc	2 205 21                        ; src/movegen.c:205:21
	ld	a, (ix - 1)
	ld	l, 16
	.loc	2 205 28 is_stmt 0              ; src/movegen.c:205:28
	add	a, l
	ld	l, a
	.loc	2 205 12                        ; src/movegen.c:205:12
	ld	(ix - 6), l
	.local	.Ltmp208
.Ltmp208:
	.loc	2 206 23 is_stmt 1              ; src/movegen.c:206:23
	ld	a, (ix - 6)
	.loc	2 206 10 is_stmt 0              ; src/movegen.c:206:10
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.local	.Ltmp209
.Ltmp209:
	.loc	2 206 9                         ; src/movegen.c:206:9
	or	a, a
	jp	nz, .LBB7_22
	jr	.LBB7_13
	.local	.LBB7_13
.LBB7_13:
	.local	.Ltmp210
.Ltmp210:
	.loc	2 208 11 is_stmt 1              ; src/movegen.c:208:11
	ld	a, (ix - 6)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp211
.Ltmp211:
	.loc	2 208 11 is_stmt 0              ; src/movegen.c:208:11
	ld	de, -8388608
	add	hl, de
	ld	de, -8388496
	or	a, a
	sbc	hl, de
	jp	nc, .LBB7_20
	jr	.LBB7_14
	.local	.LBB7_14
.LBB7_14:
	.local	.Ltmp212
.Ltmp212:
	.loc	2 209 30 is_stmt 1              ; src/movegen.c:209:30
	ld	a, (ix - 1)
	.loc	2 209 38 is_stmt 0              ; src/movegen.c:209:38
	ld	l, (ix - 6)
	.loc	2 209 49                        ; src/movegen.c:209:49
	ld	de, (ix - 4)
	.loc	2 209 21                        ; src/movegen.c:209:21
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 209 19                        ; src/movegen.c:209:19
	ld	(ix - 4), hl
	.local	.Ltmp213
.Ltmp213:
	.loc	2 212 19 is_stmt 1              ; src/movegen.c:212:19
	ld	a, (ix - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 212 26 is_stmt 0              ; src/movegen.c:212:26
	ld	de, -8388608
	ld	iy, 16
	add	iy, de
	add	hl, de
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jp	c, .LBB7_19
	jr	.LBB7_15
	.local	.LBB7_15
.LBB7_15:
	.loc	2 212 29                        ; src/movegen.c:212:29
	ld	a, (ix - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp214
.Ltmp214:
	.loc	2 212 13                        ; src/movegen.c:212:13
	ld	de, -8388608
	add	hl, de
	ld	de, -8388576
	or	a, a
	sbc	hl, de
	jp	nc, .LBB7_19
	jr	.LBB7_16
	.local	.LBB7_16
.LBB7_16:
	.local	.Ltmp215
.Ltmp215:
	.loc	2 213 29 is_stmt 1              ; src/movegen.c:213:29
	ld	a, (ix - 6)
	ld	de, 0
	ld	e, a
	ld	hl, _state
	push	hl
	pop	iy
	.loc	2 213 16 is_stmt 0              ; src/movegen.c:213:16
	add	iy, de
	ld	a, (iy + 16)
	.local	.Ltmp216
.Ltmp216:
	.loc	2 213 15                        ; src/movegen.c:213:15
	or	a, a
	jp	nz, .LBB7_18
	jr	.LBB7_17
	.local	.LBB7_17
.LBB7_17:
	.local	.Ltmp217
.Ltmp217:
	.loc	2 214 34 is_stmt 1              ; src/movegen.c:214:34
	ld	l, (ix - 1)
	.loc	2 214 42 is_stmt 0              ; src/movegen.c:214:42
	ld	a, (ix - 6)
	ld	e, 16
	.loc	2 214 49                        ; src/movegen.c:214:49
	add	a, e
	ld	e, a
	.loc	2 214 60                        ; src/movegen.c:214:60
	ld	bc, (ix - 4)
	.loc	2 214 25                        ; src/movegen.c:214:25
	push	bc
	ld	bc, 0
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 214 23                        ; src/movegen.c:214:23
	ld	(ix - 4), hl
	.loc	2 214 13                        ; src/movegen.c:214:13
	jr	.LBB7_18
	.local	.Ltmp218
.Ltmp218:
	.local	.LBB7_18
.LBB7_18:
	.loc	2 215 9 is_stmt 1               ; src/movegen.c:215:9
	jr	.LBB7_19
	.local	.Ltmp219
.Ltmp219:
	.local	.LBB7_19
.LBB7_19:
	.loc	2 216 7                         ; src/movegen.c:216:7
	jp	.LBB7_21
	.local	.Ltmp220
.Ltmp220:
	.local	.LBB7_20
.LBB7_20:
	.loc	2 220 30                        ; src/movegen.c:220:30
	ld	a, (ix - 1)
	.loc	2 220 38 is_stmt 0              ; src/movegen.c:220:38
	ld	l, (ix - 6)
	.loc	2 220 81                        ; src/movegen.c:220:81
	ld	de, (ix - 4)
	.loc	2 220 21                        ; src/movegen.c:220:21
	push	de
	ld	de, 160
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 220 19                        ; src/movegen.c:220:19
	ld	(ix - 4), hl
	.loc	2 221 30 is_stmt 1              ; src/movegen.c:221:30
	ld	a, (ix - 1)
	.loc	2 221 38 is_stmt 0              ; src/movegen.c:221:38
	ld	l, (ix - 6)
	.loc	2 221 80                        ; src/movegen.c:221:80
	ld	de, (ix - 4)
	.loc	2 221 21                        ; src/movegen.c:221:21
	push	de
	ld	de, 128
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 221 19                        ; src/movegen.c:221:19
	ld	(ix - 4), hl
	.loc	2 222 30 is_stmt 1              ; src/movegen.c:222:30
	ld	a, (ix - 1)
	.loc	2 222 38 is_stmt 0              ; src/movegen.c:222:38
	ld	l, (ix - 6)
	.loc	2 222 80                        ; src/movegen.c:222:80
	ld	de, (ix - 4)
	.loc	2 222 21                        ; src/movegen.c:222:21
	push	de
	ld	de, 96
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 222 19                        ; src/movegen.c:222:19
	ld	(ix - 4), hl
	.loc	2 223 30 is_stmt 1              ; src/movegen.c:223:30
	ld	a, (ix - 1)
	.loc	2 223 38 is_stmt 0              ; src/movegen.c:223:38
	ld	l, (ix - 6)
	.loc	2 223 80                        ; src/movegen.c:223:80
	ld	de, (ix - 4)
	.loc	2 223 21                        ; src/movegen.c:223:21
	push	de
	ld	de, 64
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 223 19                        ; src/movegen.c:223:19
	ld	(ix - 4), hl
	jr	.LBB7_21
	.local	.Ltmp221
.Ltmp221:
	.local	.LBB7_21
.LBB7_21:
	.loc	2 225 5 is_stmt 1               ; src/movegen.c:225:5
	jr	.LBB7_22
	.local	.Ltmp222
.Ltmp222:
	.local	.LBB7_22
.LBB7_22:
	.loc	2 0 5 is_stmt 0                 ; src/movegen.c:0:5
	jr	.LBB7_23
	.local	.LBB7_23
.LBB7_23:
	.loc	2 228 10 is_stmt 1              ; src/movegen.c:228:10
	ld	hl, (ix - 4)
	.loc	2 228 3 epilogue_begin is_stmt 0 ; src/movegen.c:228:3
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp223
.Ltmp223:
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_generate_pawn_moves_at, .Lfunc_end7-_generate_pawn_moves_at
                                        ; -- End function
	.section	.text._generate_knight_moves_at,"ax",@progbits
	.type	_generate_knight_moves_at,@function ; -- Begin function generate_knight_moves_at
_generate_knight_moves_at:              ; @generate_knight_moves_at
	.local	.Lfunc_begin8
.Lfunc_begin8:
	.loc	2 231 0 is_stmt 1               ; src/movegen.c:231:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -12
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	bc, _knight_offsets
	ld	iy, _state
	ld	(ix - 8), a
	ld	(ix - 11), hl
	.local	.Ltmp224
.Ltmp224:
	.loc	2 233 16 prologue_end           ; src/movegen.c:233:16
	ld	(ix - 12), 0
	.loc	2 233 8 is_stmt 0               ; src/movegen.c:233:8
	jr	.LBB8_1
	.local	.LBB8_1
.LBB8_1:                                ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp225
.Ltmp225:
	.loc	2 233 23                        ; src/movegen.c:233:23
	ld	a, (ix - 12)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp226
.Ltmp226:
	.loc	2 233 3                         ; src/movegen.c:233:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB8_8
	jr	.LBB8_2
	.local	.LBB8_2
.LBB8_2:                                ;   in Loop: Header=BB8_1 Depth=1
	.local	.Ltmp227
.Ltmp227:
	.loc	2 234 44 is_stmt 1              ; src/movegen.c:234:44
	ld	a, (ix - 8)
	.loc	2 234 67 is_stmt 0              ; src/movegen.c:234:67
	ld	l, (ix - 12)
	.loc	2 234 52                        ; src/movegen.c:234:52
	ld	de, 0
	ld	e, l
	push	bc
	pop	hl
	add	hl, de
	ld	l, (hl)
	.loc	2 234 71                        ; src/movegen.c:234:71
	ld	de, (ix - 11)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 5), de
	.local	.Ltmp228
.Ltmp228:
	.loc	2 151 19 is_stmt 1              ; src/movegen.c:151:19
	ld	a, (ix - 1)
	.loc	2 151 28 is_stmt 0              ; src/movegen.c:151:28
	ld	l, (ix - 2)
	.loc	2 151 26                        ; src/movegen.c:151:26
	add	a, l
	ld	l, a
	.loc	2 151 10                        ; src/movegen.c:151:10
	ld	(ix - 6), l
	.local	.Ltmp229
.Ltmp229:
	.loc	2 152 10 is_stmt 1              ; src/movegen.c:152:10
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 152 18 is_stmt 0              ; src/movegen.c:152:18
	and	a, l
	ld	l, a
	.local	.Ltmp230
.Ltmp230:
	.loc	2 152 7                         ; src/movegen.c:152:7
	ld	a, l
	or	a, a
	jp	nz, .LBB8_6
	jr	.LBB8_3
	.local	.LBB8_3
.LBB8_3:                                ;   in Loop: Header=BB8_1 Depth=1
	.local	.Ltmp231
.Ltmp231:
	.loc	2 153 40 is_stmt 1              ; src/movegen.c:153:40
	ld	a, (ix - 6)
	.loc	2 153 27 is_stmt 0              ; src/movegen.c:153:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 153 11                        ; src/movegen.c:153:11
	ld	(ix - 7), a
	.local	.Ltmp232
.Ltmp232:
	.loc	2 154 9 is_stmt 1               ; src/movegen.c:154:9
	ld	a, (ix - 7)
	.local	.Ltmp233
.Ltmp233:
	.loc	2 154 9 is_stmt 0               ; src/movegen.c:154:9
	or	a, a
	jp	nz, .LBB8_5
	jr	.LBB8_4
	.local	.LBB8_4
.LBB8_4:                                ;   in Loop: Header=BB8_1 Depth=1
	.local	.Ltmp234
.Ltmp234:
	.loc	2 155 28 is_stmt 1              ; src/movegen.c:155:28
	ld	a, (ix - 1)
	.loc	2 155 36 is_stmt 0              ; src/movegen.c:155:36
	ld	l, (ix - 6)
	.loc	2 155 47                        ; src/movegen.c:155:47
	ld	de, (ix - 5)
	.loc	2 155 19                        ; src/movegen.c:155:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	ld	bc, _knight_offsets
	.loc	2 155 17                        ; src/movegen.c:155:17
	ld	(ix - 5), hl
	.loc	2 156 5 is_stmt 1               ; src/movegen.c:156:5
	jr	.LBB8_5
	.local	.Ltmp235
.Ltmp235:
	.local	.LBB8_5
.LBB8_5:                                ;   in Loop: Header=BB8_1 Depth=1
	.loc	2 157 3                         ; src/movegen.c:157:3
	jr	.LBB8_6
	.local	.Ltmp236
.Ltmp236:
	.local	.LBB8_6
.LBB8_6:                                ; %generate_stepping_moves_at.exit
                                        ;   in Loop: Header=BB8_1 Depth=1
	.loc	2 159 10                        ; src/movegen.c:159:10
	ld	hl, (ix - 5)
	.local	.Ltmp237
.Ltmp237:
	.loc	2 234 15                        ; src/movegen.c:234:15
	ld	(ix - 11), hl
	.loc	2 235 3                         ; src/movegen.c:235:3
	jr	.LBB8_7
	.local	.Ltmp238
.Ltmp238:
	.local	.LBB8_7
.LBB8_7:                                ;   in Loop: Header=BB8_1 Depth=1
	.loc	2 233 31                        ; src/movegen.c:233:31
	inc	(ix - 12)
	.loc	2 233 3 is_stmt 0               ; src/movegen.c:233:3
	jp	.LBB8_1
	.local	.Ltmp239
.Ltmp239:
	.local	.LBB8_8
.LBB8_8:
	.loc	2 237 10 is_stmt 1              ; src/movegen.c:237:10
	ld	hl, (ix - 11)
	.loc	2 237 3 epilogue_begin is_stmt 0 ; src/movegen.c:237:3
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp240
.Ltmp240:
	.local	.Lfunc_end8
.Lfunc_end8:
	.size	_generate_knight_moves_at, .Lfunc_end8-_generate_knight_moves_at
                                        ; -- End function
	.section	.text._generate_bishop_moves_at,"ax",@progbits
	.type	_generate_bishop_moves_at,@function ; -- Begin function generate_bishop_moves_at
_generate_bishop_moves_at:              ; @generate_bishop_moves_at
	.local	.Lfunc_begin9
.Lfunc_begin9:
	.loc	2 240 0 is_stmt 1               ; src/movegen.c:240:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -32
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	bc, _state
	ld	(ix - 29), a
	ld	(ix - 32), hl
	.local	.Ltmp241
.Ltmp241:
	.loc	2 241 41 prologue_end           ; src/movegen.c:241:41
	ld	a, (ix - 29)
	.loc	2 241 56 is_stmt 0              ; src/movegen.c:241:56
	ld	hl, (ix - 32)
	ld	(ix - 1), a
	ld	(ix - 2), -15
	ld	(ix - 5), hl
	.local	.Ltmp242
.Ltmp242:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 1)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 2)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 6), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB9_1
	.local	.LBB9_1
.LBB9_1:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB9_5
	jr	.LBB9_2
	.local	.LBB9_2
.LBB9_2:                                ;   in Loop: Header=BB9_1 Depth=1
	.local	.Ltmp243
.Ltmp243:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 6)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 7), a
	.local	.Ltmp244
.Ltmp244:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 7)
	.local	.Ltmp245
.Ltmp245:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB9_4
	jr	.LBB9_3
	.local	.LBB9_3
.LBB9_3:                                ;   in Loop: Header=BB9_1 Depth=1
	.local	.Ltmp246
.Ltmp246:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 1)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 6)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 5)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 5), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 2)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 6)
	add	a, l
	ld	l, a
	ld	(ix - 6), l
	.local	.Ltmp247
.Ltmp247:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB9_1
	.local	.LBB9_4
.LBB9_4:
	.local	.Ltmp248
.Ltmp248:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB9_5
	.local	.Ltmp249
.Ltmp249:
	.local	.LBB9_5
.LBB9_5:                                ; %generate_sliding_moves_at.exit3
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 5)
	.local	.Ltmp250
.Ltmp250:
	.loc	2 241 13                        ; src/movegen.c:241:13
	ld	(ix - 32), hl
	.loc	2 242 41                        ; src/movegen.c:242:41
	ld	a, (ix - 29)
	.loc	2 242 55 is_stmt 0              ; src/movegen.c:242:55
	ld	hl, (ix - 32)
	ld	(ix - 8), a
	ld	(ix - 9), 17
	ld	(ix - 12), hl
	.local	.Ltmp251
.Ltmp251:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 8)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 9)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 13), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB9_6
	.local	.LBB9_6
.LBB9_6:                                ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 13)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB9_10
	jr	.LBB9_7
	.local	.LBB9_7
.LBB9_7:                                ;   in Loop: Header=BB9_6 Depth=1
	.local	.Ltmp252
.Ltmp252:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 13)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 14), a
	.local	.Ltmp253
.Ltmp253:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 14)
	.local	.Ltmp254
.Ltmp254:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB9_9
	jr	.LBB9_8
	.local	.LBB9_8
.LBB9_8:                                ;   in Loop: Header=BB9_6 Depth=1
	.local	.Ltmp255
.Ltmp255:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 8)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 13)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 12)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 12), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 9)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 13)
	add	a, l
	ld	l, a
	ld	(ix - 13), l
	.local	.Ltmp256
.Ltmp256:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB9_6
	.local	.LBB9_9
.LBB9_9:
	.local	.Ltmp257
.Ltmp257:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB9_10
	.local	.Ltmp258
.Ltmp258:
	.local	.LBB9_10
.LBB9_10:                               ; %generate_sliding_moves_at.exit2
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 12)
	.local	.Ltmp259
.Ltmp259:
	.loc	2 242 13                        ; src/movegen.c:242:13
	ld	(ix - 32), hl
	.loc	2 243 41                        ; src/movegen.c:243:41
	ld	a, (ix - 29)
	.loc	2 243 55 is_stmt 0              ; src/movegen.c:243:55
	ld	hl, (ix - 32)
	ld	(ix - 15), a
	ld	(ix - 16), 15
	ld	(ix - 19), hl
	.local	.Ltmp260
.Ltmp260:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 15)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 16)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 20), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB9_11
	.local	.LBB9_11
.LBB9_11:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 20)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB9_15
	jr	.LBB9_12
	.local	.LBB9_12
.LBB9_12:                               ;   in Loop: Header=BB9_11 Depth=1
	.local	.Ltmp261
.Ltmp261:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 20)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 21), a
	.local	.Ltmp262
.Ltmp262:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 21)
	.local	.Ltmp263
.Ltmp263:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB9_14
	jr	.LBB9_13
	.local	.LBB9_13
.LBB9_13:                               ;   in Loop: Header=BB9_11 Depth=1
	.local	.Ltmp264
.Ltmp264:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 15)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 20)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 19)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 19), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 16)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 20)
	add	a, l
	ld	l, a
	ld	(ix - 20), l
	.local	.Ltmp265
.Ltmp265:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB9_11
	.local	.LBB9_14
.LBB9_14:
	.local	.Ltmp266
.Ltmp266:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB9_15
	.local	.Ltmp267
.Ltmp267:
	.local	.LBB9_15
.LBB9_15:                               ; %generate_sliding_moves_at.exit1
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 19)
	.local	.Ltmp268
.Ltmp268:
	.loc	2 243 13                        ; src/movegen.c:243:13
	ld	(ix - 32), hl
	.loc	2 244 41                        ; src/movegen.c:244:41
	ld	a, (ix - 29)
	.loc	2 244 56 is_stmt 0              ; src/movegen.c:244:56
	ld	hl, (ix - 32)
	ld	(ix - 22), a
	ld	(ix - 23), -17
	ld	(ix - 26), hl
	.local	.Ltmp269
.Ltmp269:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 22)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 23)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 27), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB9_16
	.local	.LBB9_16
.LBB9_16:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 27)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB9_20
	jr	.LBB9_17
	.local	.LBB9_17
.LBB9_17:                               ;   in Loop: Header=BB9_16 Depth=1
	.local	.Ltmp270
.Ltmp270:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 27)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 28), a
	.local	.Ltmp271
.Ltmp271:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 28)
	.local	.Ltmp272
.Ltmp272:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB9_19
	jr	.LBB9_18
	.local	.LBB9_18
.LBB9_18:                               ;   in Loop: Header=BB9_16 Depth=1
	.local	.Ltmp273
.Ltmp273:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 22)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 27)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 26)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 26), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 23)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 27)
	add	a, l
	ld	l, a
	ld	(ix - 27), l
	.local	.Ltmp274
.Ltmp274:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB9_16
	.local	.LBB9_19
.LBB9_19:
	.local	.Ltmp275
.Ltmp275:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB9_20
	.local	.Ltmp276
.Ltmp276:
	.local	.LBB9_20
.LBB9_20:                               ; %generate_sliding_moves_at.exit
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 26)
	.local	.Ltmp277
.Ltmp277:
	.loc	2 244 13                        ; src/movegen.c:244:13
	ld	(ix - 32), hl
	.loc	2 246 10                        ; src/movegen.c:246:10
	ld	hl, (ix - 32)
	.loc	2 246 3 epilogue_begin is_stmt 0 ; src/movegen.c:246:3
	ld	iy, 32
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp278
.Ltmp278:
	.local	.Lfunc_end9
.Lfunc_end9:
	.size	_generate_bishop_moves_at, .Lfunc_end9-_generate_bishop_moves_at
                                        ; -- End function
	.section	.text._generate_rook_moves_at,"ax",@progbits
	.type	_generate_rook_moves_at,@function ; -- Begin function generate_rook_moves_at
_generate_rook_moves_at:                ; @generate_rook_moves_at
	.local	.Lfunc_begin10
.Lfunc_begin10:
	.loc	2 249 0 is_stmt 1               ; src/movegen.c:249:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -32
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	bc, _state
	ld	(ix - 29), a
	ld	(ix - 32), hl
	.local	.Ltmp279
.Ltmp279:
	.loc	2 250 41 prologue_end           ; src/movegen.c:250:41
	ld	a, (ix - 29)
	.loc	2 250 56 is_stmt 0              ; src/movegen.c:250:56
	ld	hl, (ix - 32)
	ld	(ix - 1), a
	ld	(ix - 2), -16
	ld	(ix - 5), hl
	.local	.Ltmp280
.Ltmp280:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 1)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 2)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 6), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB10_1
	.local	.LBB10_1
.LBB10_1:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB10_5
	jr	.LBB10_2
	.local	.LBB10_2
.LBB10_2:                               ;   in Loop: Header=BB10_1 Depth=1
	.local	.Ltmp281
.Ltmp281:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 6)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 7), a
	.local	.Ltmp282
.Ltmp282:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 7)
	.local	.Ltmp283
.Ltmp283:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB10_4
	jr	.LBB10_3
	.local	.LBB10_3
.LBB10_3:                               ;   in Loop: Header=BB10_1 Depth=1
	.local	.Ltmp284
.Ltmp284:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 1)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 6)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 5)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 5), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 2)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 6)
	add	a, l
	ld	l, a
	ld	(ix - 6), l
	.local	.Ltmp285
.Ltmp285:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB10_1
	.local	.LBB10_4
.LBB10_4:
	.local	.Ltmp286
.Ltmp286:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB10_5
	.local	.Ltmp287
.Ltmp287:
	.local	.LBB10_5
.LBB10_5:                               ; %generate_sliding_moves_at.exit3
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 5)
	.local	.Ltmp288
.Ltmp288:
	.loc	2 250 13                        ; src/movegen.c:250:13
	ld	(ix - 32), hl
	.loc	2 251 41                        ; src/movegen.c:251:41
	ld	a, (ix - 29)
	.loc	2 251 54 is_stmt 0              ; src/movegen.c:251:54
	ld	hl, (ix - 32)
	ld	(ix - 8), a
	ld	(ix - 9), 1
	ld	(ix - 12), hl
	.local	.Ltmp289
.Ltmp289:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 8)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 9)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 13), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB10_6
	.local	.LBB10_6
.LBB10_6:                               ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 13)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB10_10
	jr	.LBB10_7
	.local	.LBB10_7
.LBB10_7:                               ;   in Loop: Header=BB10_6 Depth=1
	.local	.Ltmp290
.Ltmp290:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 13)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 14), a
	.local	.Ltmp291
.Ltmp291:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 14)
	.local	.Ltmp292
.Ltmp292:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB10_9
	jr	.LBB10_8
	.local	.LBB10_8
.LBB10_8:                               ;   in Loop: Header=BB10_6 Depth=1
	.local	.Ltmp293
.Ltmp293:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 8)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 13)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 12)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 12), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 9)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 13)
	add	a, l
	ld	l, a
	ld	(ix - 13), l
	.local	.Ltmp294
.Ltmp294:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB10_6
	.local	.LBB10_9
.LBB10_9:
	.local	.Ltmp295
.Ltmp295:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB10_10
	.local	.Ltmp296
.Ltmp296:
	.local	.LBB10_10
.LBB10_10:                              ; %generate_sliding_moves_at.exit2
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 12)
	.local	.Ltmp297
.Ltmp297:
	.loc	2 251 13                        ; src/movegen.c:251:13
	ld	(ix - 32), hl
	.loc	2 252 41                        ; src/movegen.c:252:41
	ld	a, (ix - 29)
	.loc	2 252 55 is_stmt 0              ; src/movegen.c:252:55
	ld	hl, (ix - 32)
	ld	(ix - 15), a
	ld	(ix - 16), 16
	ld	(ix - 19), hl
	.local	.Ltmp298
.Ltmp298:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 15)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 16)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 20), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB10_11
	.local	.LBB10_11
.LBB10_11:                              ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 20)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB10_15
	jr	.LBB10_12
	.local	.LBB10_12
.LBB10_12:                              ;   in Loop: Header=BB10_11 Depth=1
	.local	.Ltmp299
.Ltmp299:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 20)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 21), a
	.local	.Ltmp300
.Ltmp300:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 21)
	.local	.Ltmp301
.Ltmp301:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB10_14
	jr	.LBB10_13
	.local	.LBB10_13
.LBB10_13:                              ;   in Loop: Header=BB10_11 Depth=1
	.local	.Ltmp302
.Ltmp302:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 15)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 20)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 19)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 19), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 16)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 20)
	add	a, l
	ld	l, a
	ld	(ix - 20), l
	.local	.Ltmp303
.Ltmp303:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB10_11
	.local	.LBB10_14
.LBB10_14:
	.local	.Ltmp304
.Ltmp304:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB10_15
	.local	.Ltmp305
.Ltmp305:
	.local	.LBB10_15
.LBB10_15:                              ; %generate_sliding_moves_at.exit1
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 19)
	.local	.Ltmp306
.Ltmp306:
	.loc	2 252 13                        ; src/movegen.c:252:13
	ld	(ix - 32), hl
	.loc	2 253 41                        ; src/movegen.c:253:41
	ld	a, (ix - 29)
	.loc	2 253 55 is_stmt 0              ; src/movegen.c:253:55
	ld	hl, (ix - 32)
	ld	(ix - 22), a
	ld	(ix - 23), -1
	ld	(ix - 26), hl
	.local	.Ltmp307
.Ltmp307:
	.loc	2 163 19 is_stmt 1              ; src/movegen.c:163:19
	ld	a, (ix - 22)
	.loc	2 163 28 is_stmt 0              ; src/movegen.c:163:28
	ld	l, (ix - 23)
	.loc	2 163 26                        ; src/movegen.c:163:26
	add	a, l
	ld	l, a
	.loc	2 163 10                        ; src/movegen.c:163:10
	ld	(ix - 27), l
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jr	.LBB10_16
	.local	.LBB10_16
.LBB10_16:                              ; =>This Inner Loop Header: Depth=1
	.loc	2 164 13 is_stmt 0              ; src/movegen.c:164:13
	ld	a, (ix - 27)
	ld	l, -120
	.loc	2 164 21                        ; src/movegen.c:164:21
	and	a, l
	ld	l, a
	.loc	2 164 3                         ; src/movegen.c:164:3
	ld	a, l
	or	a, a
	jp	nz, .LBB10_20
	jr	.LBB10_17
	.local	.LBB10_17
.LBB10_17:                              ;   in Loop: Header=BB10_16 Depth=1
	.local	.Ltmp308
.Ltmp308:
	.loc	2 165 40 is_stmt 1              ; src/movegen.c:165:40
	ld	a, (ix - 27)
	.loc	2 165 27 is_stmt 0              ; src/movegen.c:165:27
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	a, (hl)
	.loc	2 165 11                        ; src/movegen.c:165:11
	ld	(ix - 28), a
	.local	.Ltmp309
.Ltmp309:
	.loc	2 166 9 is_stmt 1               ; src/movegen.c:166:9
	ld	a, (ix - 28)
	.local	.Ltmp310
.Ltmp310:
	.loc	2 166 9 is_stmt 0               ; src/movegen.c:166:9
	or	a, a
	jp	nz, .LBB10_19
	jr	.LBB10_18
	.local	.LBB10_18
.LBB10_18:                              ;   in Loop: Header=BB10_16 Depth=1
	.local	.Ltmp311
.Ltmp311:
	.loc	2 167 28 is_stmt 1              ; src/movegen.c:167:28
	ld	a, (ix - 22)
	.loc	2 167 36 is_stmt 0              ; src/movegen.c:167:36
	ld	l, (ix - 27)
	.loc	2 167 47                        ; src/movegen.c:167:47
	ld	de, (ix - 26)
	.loc	2 167 19                        ; src/movegen.c:167:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	bc, _state
	.loc	2 167 17                        ; src/movegen.c:167:17
	ld	(ix - 26), hl
	.loc	2 168 17 is_stmt 1              ; src/movegen.c:168:17
	ld	l, (ix - 23)
	.loc	2 168 14 is_stmt 0              ; src/movegen.c:168:14
	ld	a, (ix - 27)
	add	a, l
	ld	l, a
	ld	(ix - 27), l
	.local	.Ltmp312
.Ltmp312:
	.loc	2 164 3 is_stmt 1               ; src/movegen.c:164:3
	jp	.LBB10_16
	.local	.LBB10_19
.LBB10_19:
	.local	.Ltmp313
.Ltmp313:
	.loc	2 172 7                         ; src/movegen.c:172:7
	jr	.LBB10_20
	.local	.Ltmp314
.Ltmp314:
	.local	.LBB10_20
.LBB10_20:                              ; %generate_sliding_moves_at.exit
	.loc	2 176 10                        ; src/movegen.c:176:10
	ld	hl, (ix - 26)
	.local	.Ltmp315
.Ltmp315:
	.loc	2 253 13                        ; src/movegen.c:253:13
	ld	(ix - 32), hl
	.loc	2 255 10                        ; src/movegen.c:255:10
	ld	hl, (ix - 32)
	.loc	2 255 3 epilogue_begin is_stmt 0 ; src/movegen.c:255:3
	ld	iy, 32
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp316
.Ltmp316:
	.local	.Lfunc_end10
.Lfunc_end10:
	.size	_generate_rook_moves_at, .Lfunc_end10-_generate_rook_moves_at
                                        ; -- End function
	.section	.text._generate_queen_moves_at,"ax",@progbits
	.type	_generate_queen_moves_at,@function ; -- Begin function generate_queen_moves_at
_generate_queen_moves_at:               ; @generate_queen_moves_at
	.local	.Lfunc_begin11
.Lfunc_begin11:
	.loc	2 258 0 is_stmt 1               ; src/movegen.c:258:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -4
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	(ix - 1), a
	ld	(ix - 4), hl
	.local	.Ltmp317
.Ltmp317:
	.loc	2 259 40 prologue_end           ; src/movegen.c:259:40
	ld	a, (ix - 1)
	.loc	2 259 48 is_stmt 0              ; src/movegen.c:259:48
	ld	hl, (ix - 4)
	.loc	2 259 15                        ; src/movegen.c:259:15
	push	hl
	ld	l, a
	push	hl
	call	_generate_bishop_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 259 13                        ; src/movegen.c:259:13
	ld	(ix - 4), hl
	.loc	2 260 38 is_stmt 1              ; src/movegen.c:260:38
	ld	a, (ix - 1)
	.loc	2 260 46 is_stmt 0              ; src/movegen.c:260:46
	ld	hl, (ix - 4)
	.loc	2 260 15                        ; src/movegen.c:260:15
	push	hl
	ld	l, a
	push	hl
	call	_generate_rook_moves_at
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	2 260 13                        ; src/movegen.c:260:13
	ld	(ix - 4), hl
	.loc	2 262 10 is_stmt 1              ; src/movegen.c:262:10
	ld	hl, (ix - 4)
	.loc	2 262 3 epilogue_begin is_stmt 0 ; src/movegen.c:262:3
	ld	iy, 4
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp318
.Ltmp318:
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_generate_queen_moves_at, .Lfunc_end11-_generate_queen_moves_at
                                        ; -- End function
	.section	.text._generate_king_moves_at,"ax",@progbits
	.type	_generate_king_moves_at,@function ; -- Begin function generate_king_moves_at
_generate_king_moves_at:                ; @generate_king_moves_at
	.local	.Lfunc_begin12
.Lfunc_begin12:
	.loc	2 265 0 is_stmt 1               ; src/movegen.c:265:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -15
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _state
	ld	(ix - 8), a
	ld	(ix - 11), hl
	.local	.Ltmp319
.Ltmp319:
	.loc	2 266 27 prologue_end           ; src/movegen.c:266:27
	ld	hl, (_state+194)
	.loc	2 266 9 is_stmt 0               ; src/movegen.c:266:9
	ld	(ix - 14), hl
	.local	.Ltmp320
.Ltmp320:
	.loc	2 269 16 is_stmt 1              ; src/movegen.c:269:16
	ld	(ix - 15), 0
	.loc	2 269 8 is_stmt 0               ; src/movegen.c:269:8
	jr	.LBB12_1
	.local	.LBB12_1
.LBB12_1:                               ; =>This Inner Loop Header: Depth=1
	.local	.Ltmp321
.Ltmp321:
	.loc	2 269 23                        ; src/movegen.c:269:23
	ld	a, (ix - 15)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.local	.Ltmp322
.Ltmp322:
	.loc	2 269 3                         ; src/movegen.c:269:3
	ld	de, -8388608
	add	hl, de
	ld	de, -8388600
	or	a, a
	sbc	hl, de
	jp	nc, .LBB12_8
	jr	.LBB12_2
	.local	.LBB12_2
.LBB12_2:                               ;   in Loop: Header=BB12_1 Depth=1
	.local	.Ltmp323
.Ltmp323:
	.loc	2 270 44 is_stmt 1              ; src/movegen.c:270:44
	ld	a, (ix - 8)
	.loc	2 270 65 is_stmt 0              ; src/movegen.c:270:65
	ld	l, (ix - 15)
	.loc	2 270 52                        ; src/movegen.c:270:52
	ld	de, 0
	ld	e, l
	ld	hl, _king_offsets
	add	hl, de
	ld	l, (hl)
	.loc	2 270 69                        ; src/movegen.c:270:69
	ld	de, (ix - 11)
	ld	(ix - 1), a
	ld	(ix - 2), l
	ld	(ix - 5), de
	.local	.Ltmp324
.Ltmp324:
	.loc	2 151 19 is_stmt 1              ; src/movegen.c:151:19
	ld	a, (ix - 1)
	.loc	2 151 28 is_stmt 0              ; src/movegen.c:151:28
	ld	l, (ix - 2)
	.loc	2 151 26                        ; src/movegen.c:151:26
	add	a, l
	ld	l, a
	.loc	2 151 10                        ; src/movegen.c:151:10
	ld	(ix - 6), l
	.local	.Ltmp325
.Ltmp325:
	.loc	2 152 10 is_stmt 1              ; src/movegen.c:152:10
	ld	a, (ix - 6)
	ld	l, -120
	.loc	2 152 18 is_stmt 0              ; src/movegen.c:152:18
	and	a, l
	ld	l, a
	.local	.Ltmp326
.Ltmp326:
	.loc	2 152 7                         ; src/movegen.c:152:7
	ld	a, l
	or	a, a
	jp	nz, .LBB12_6
	jr	.LBB12_3
	.local	.LBB12_3
.LBB12_3:                               ;   in Loop: Header=BB12_1 Depth=1
	.local	.Ltmp327
.Ltmp327:
	.loc	2 153 40 is_stmt 1              ; src/movegen.c:153:40
	ld	a, (ix - 6)
	.loc	2 153 27 is_stmt 0              ; src/movegen.c:153:27
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	add	hl, de
	ld	a, (hl)
	.loc	2 153 11                        ; src/movegen.c:153:11
	ld	(ix - 7), a
	.local	.Ltmp328
.Ltmp328:
	.loc	2 154 9 is_stmt 1               ; src/movegen.c:154:9
	ld	a, (ix - 7)
	.local	.Ltmp329
.Ltmp329:
	.loc	2 154 9 is_stmt 0               ; src/movegen.c:154:9
	or	a, a
	jp	nz, .LBB12_5
	jr	.LBB12_4
	.local	.LBB12_4
.LBB12_4:                               ;   in Loop: Header=BB12_1 Depth=1
	.local	.Ltmp330
.Ltmp330:
	.loc	2 155 28 is_stmt 1              ; src/movegen.c:155:28
	ld	a, (ix - 1)
	.loc	2 155 36 is_stmt 0              ; src/movegen.c:155:36
	ld	l, (ix - 6)
	.loc	2 155 47                        ; src/movegen.c:155:47
	ld	de, (ix - 5)
	.loc	2 155 19                        ; src/movegen.c:155:19
	push	de
	ld	de, 0
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	l, a
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	ld	iy, _state
	.loc	2 155 17                        ; src/movegen.c:155:17
	ld	(ix - 5), hl
	.loc	2 156 5 is_stmt 1               ; src/movegen.c:156:5
	jr	.LBB12_5
	.local	.Ltmp331
.Ltmp331:
	.local	.LBB12_5
.LBB12_5:                               ;   in Loop: Header=BB12_1 Depth=1
	.loc	2 157 3                         ; src/movegen.c:157:3
	jr	.LBB12_6
	.local	.Ltmp332
.Ltmp332:
	.local	.LBB12_6
.LBB12_6:                               ; %generate_stepping_moves_at.exit
                                        ;   in Loop: Header=BB12_1 Depth=1
	.loc	2 159 10                        ; src/movegen.c:159:10
	ld	hl, (ix - 5)
	.local	.Ltmp333
.Ltmp333:
	.loc	2 270 15                        ; src/movegen.c:270:15
	ld	(ix - 11), hl
	.loc	2 271 3                         ; src/movegen.c:271:3
	jr	.LBB12_7
	.local	.Ltmp334
.Ltmp334:
	.local	.LBB12_7
.LBB12_7:                               ;   in Loop: Header=BB12_1 Depth=1
	.loc	2 269 31                        ; src/movegen.c:269:31
	inc	(ix - 15)
	.loc	2 269 3 is_stmt 0               ; src/movegen.c:269:3
	jp	.LBB12_1
	.local	.Ltmp335
.Ltmp335:
	.local	.LBB12_8
.LBB12_8:
	.loc	2 273 7 is_stmt 1               ; src/movegen.c:273:7
	ld	hl, (ix - 14)
	.local	.Ltmp336
.Ltmp336:
	.loc	2 273 7 is_stmt 0               ; src/movegen.c:273:7
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB12_21
	jr	.LBB12_9
	.local	.LBB12_9
.LBB12_9:
	.local	.Ltmp337
.Ltmp337:
	.loc	2 274 16 is_stmt 1              ; src/movegen.c:274:16
	ld	a, (_state+199)
	.local	.Ltmp338
.Ltmp338:
	.loc	2 274 9 is_stmt 0               ; src/movegen.c:274:9
	bit	0, a
	jp	z, .LBB12_14
	jr	.LBB12_10
	.local	.LBB12_10
.LBB12_10:
	.local	.Ltmp339
.Ltmp339:
	.loc	2 275 25 is_stmt 1              ; src/movegen.c:275:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	.loc	2 275 12 is_stmt 0              ; src/movegen.c:275:12
	add	iy, de
	ld	a, (iy + 1)
	.loc	2 275 46                        ; src/movegen.c:275:46
	or	a, a
	jp	nz, .LBB12_13
	jr	.LBB12_11
	.local	.LBB12_11
.LBB12_11:
	.loc	2 276 25 is_stmt 1              ; src/movegen.c:276:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	.loc	2 276 12 is_stmt 0              ; src/movegen.c:276:12
	ld	iy, _state
	add	iy, de
	ld	a, (iy + 2)
	.local	.Ltmp340
.Ltmp340:
	.loc	2 275 11 is_stmt 1              ; src/movegen.c:275:11
	or	a, a
	jp	nz, .LBB12_13
	jr	.LBB12_12
	.local	.LBB12_12
.LBB12_12:
	.local	.Ltmp341
.Ltmp341:
	.loc	2 277 32                        ; src/movegen.c:277:32
	ld	l, (ix - 8)
	.loc	2 277 40 is_stmt 0              ; src/movegen.c:277:40
	ld	a, (ix - 8)
	ld	e, 2
	.loc	2 277 53                        ; src/movegen.c:277:53
	add	a, e
	ld	e, a
	.loc	2 277 94                        ; src/movegen.c:277:94
	ld	bc, (ix - 11)
	.loc	2 277 23                        ; src/movegen.c:277:23
	push	bc
	ld	bc, 4
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 277 21                        ; src/movegen.c:277:21
	ld	(ix - 11), hl
	.loc	2 278 9 is_stmt 1               ; src/movegen.c:278:9
	jr	.LBB12_13
	.local	.Ltmp342
.Ltmp342:
	.local	.LBB12_13
.LBB12_13:
	.loc	2 0 9 is_stmt 0                 ; src/movegen.c:0:9
	ld	iy, _state
	.loc	2 279 5 is_stmt 1               ; src/movegen.c:279:5
	jr	.LBB12_14
	.local	.Ltmp343
.Ltmp343:
	.local	.LBB12_14
.LBB12_14:
	.loc	2 281 16                        ; src/movegen.c:281:16
	ld	a, (_state+200)
	.local	.Ltmp344
.Ltmp344:
	.loc	2 281 9 is_stmt 0               ; src/movegen.c:281:9
	bit	0, a
	jp	z, .LBB12_20
	jr	.LBB12_15
	.local	.LBB12_15
.LBB12_15:
	.local	.Ltmp345
.Ltmp345:
	.loc	2 282 25 is_stmt 1              ; src/movegen.c:282:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	.loc	2 282 12 is_stmt 0              ; src/movegen.c:282:12
	add	iy, de
	ld	a, (iy - 1)
	.loc	2 282 47                        ; src/movegen.c:282:47
	or	a, a
	jp	nz, .LBB12_19
	jr	.LBB12_16
	.local	.LBB12_16
.LBB12_16:
	.loc	2 283 25 is_stmt 1              ; src/movegen.c:283:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	push	hl
	pop	iy
	.loc	2 283 12 is_stmt 0              ; src/movegen.c:283:12
	add	iy, de
	ld	a, (iy - 2)
	.loc	2 283 54                        ; src/movegen.c:283:54
	or	a, a
	jp	nz, .LBB12_19
	jr	.LBB12_17
	.local	.LBB12_17
.LBB12_17:
	.loc	2 284 25 is_stmt 1              ; src/movegen.c:284:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	push	hl
	pop	iy
	.loc	2 284 12 is_stmt 0              ; src/movegen.c:284:12
	add	iy, de
	ld	a, (iy - 3)
	.local	.Ltmp346
.Ltmp346:
	.loc	2 282 11 is_stmt 1              ; src/movegen.c:282:11
	or	a, a
	jp	nz, .LBB12_19
	jr	.LBB12_18
	.local	.LBB12_18
.LBB12_18:
	.local	.Ltmp347
.Ltmp347:
	.loc	2 285 32                        ; src/movegen.c:285:32
	ld	l, (ix - 8)
	.loc	2 285 40 is_stmt 0              ; src/movegen.c:285:40
	ld	a, (ix - 8)
	ld	e, -2
	.loc	2 285 54                        ; src/movegen.c:285:54
	add	a, e
	ld	e, a
	.loc	2 285 96                        ; src/movegen.c:285:96
	ld	bc, (ix - 11)
	.loc	2 285 23                        ; src/movegen.c:285:23
	push	bc
	ld	bc, 4
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 285 21                        ; src/movegen.c:285:21
	ld	(ix - 11), hl
	.loc	2 286 9 is_stmt 1               ; src/movegen.c:286:9
	jr	.LBB12_19
	.local	.Ltmp348
.Ltmp348:
	.local	.LBB12_19
.LBB12_19:
	.loc	2 287 5                         ; src/movegen.c:287:5
	jr	.LBB12_20
	.local	.Ltmp349
.Ltmp349:
	.local	.LBB12_20
.LBB12_20:
	.loc	2 288 3                         ; src/movegen.c:288:3
	jp	.LBB12_33
	.local	.Ltmp350
.Ltmp350:
	.local	.LBB12_21
.LBB12_21:
	.loc	2 291 16                        ; src/movegen.c:291:16
	ld	a, (_state+201)
	.local	.Ltmp351
.Ltmp351:
	.loc	2 291 9 is_stmt 0               ; src/movegen.c:291:9
	bit	0, a
	jp	z, .LBB12_26
	jr	.LBB12_22
	.local	.LBB12_22
.LBB12_22:
	.local	.Ltmp352
.Ltmp352:
	.loc	2 292 25 is_stmt 1              ; src/movegen.c:292:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	.loc	2 292 12 is_stmt 0              ; src/movegen.c:292:12
	add	iy, de
	ld	a, (iy + 1)
	.loc	2 292 46                        ; src/movegen.c:292:46
	or	a, a
	jp	nz, .LBB12_25
	jr	.LBB12_23
	.local	.LBB12_23
.LBB12_23:
	.loc	2 293 25 is_stmt 1              ; src/movegen.c:293:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	.loc	2 293 12 is_stmt 0              ; src/movegen.c:293:12
	ld	iy, _state
	add	iy, de
	ld	a, (iy + 2)
	.local	.Ltmp353
.Ltmp353:
	.loc	2 292 11 is_stmt 1              ; src/movegen.c:292:11
	or	a, a
	jp	nz, .LBB12_25
	jr	.LBB12_24
	.local	.LBB12_24
.LBB12_24:
	.local	.Ltmp354
.Ltmp354:
	.loc	2 294 32                        ; src/movegen.c:294:32
	ld	l, (ix - 8)
	.loc	2 294 40 is_stmt 0              ; src/movegen.c:294:40
	ld	a, (ix - 8)
	ld	e, 2
	.loc	2 294 53                        ; src/movegen.c:294:53
	add	a, e
	ld	e, a
	.loc	2 294 94                        ; src/movegen.c:294:94
	ld	bc, (ix - 11)
	.loc	2 294 23                        ; src/movegen.c:294:23
	push	bc
	ld	bc, 4
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 294 21                        ; src/movegen.c:294:21
	ld	(ix - 11), hl
	.loc	2 295 9 is_stmt 1               ; src/movegen.c:295:9
	jr	.LBB12_25
	.local	.Ltmp355
.Ltmp355:
	.local	.LBB12_25
.LBB12_25:
	.loc	2 0 9 is_stmt 0                 ; src/movegen.c:0:9
	ld	iy, _state
	.loc	2 296 5 is_stmt 1               ; src/movegen.c:296:5
	jr	.LBB12_26
	.local	.Ltmp356
.Ltmp356:
	.local	.LBB12_26
.LBB12_26:
	.loc	2 298 16                        ; src/movegen.c:298:16
	ld	a, (_state+202)
	.local	.Ltmp357
.Ltmp357:
	.loc	2 298 9 is_stmt 0               ; src/movegen.c:298:9
	bit	0, a
	jp	z, .LBB12_32
	jr	.LBB12_27
	.local	.LBB12_27
.LBB12_27:
	.local	.Ltmp358
.Ltmp358:
	.loc	2 299 25 is_stmt 1              ; src/movegen.c:299:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	lea	hl, iy + 0
	.loc	2 299 12 is_stmt 0              ; src/movegen.c:299:12
	add	iy, de
	ld	a, (iy - 1)
	.loc	2 299 47                        ; src/movegen.c:299:47
	or	a, a
	jp	nz, .LBB12_31
	jr	.LBB12_28
	.local	.LBB12_28
.LBB12_28:
	.loc	2 300 25 is_stmt 1              ; src/movegen.c:300:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	push	hl
	pop	iy
	.loc	2 300 12 is_stmt 0              ; src/movegen.c:300:12
	add	iy, de
	ld	a, (iy - 2)
	.loc	2 300 54                        ; src/movegen.c:300:54
	or	a, a
	jp	nz, .LBB12_31
	jr	.LBB12_29
	.local	.LBB12_29
.LBB12_29:
	.loc	2 301 25 is_stmt 1              ; src/movegen.c:301:25
	ld	a, (ix - 8)
	ld	de, 0
	ld	e, a
	push	hl
	pop	iy
	.loc	2 301 12 is_stmt 0              ; src/movegen.c:301:12
	add	iy, de
	ld	a, (iy - 3)
	.local	.Ltmp359
.Ltmp359:
	.loc	2 299 11 is_stmt 1              ; src/movegen.c:299:11
	or	a, a
	jp	nz, .LBB12_31
	jr	.LBB12_30
	.local	.LBB12_30
.LBB12_30:
	.local	.Ltmp360
.Ltmp360:
	.loc	2 302 32                        ; src/movegen.c:302:32
	ld	l, (ix - 8)
	.loc	2 302 40 is_stmt 0              ; src/movegen.c:302:40
	ld	a, (ix - 8)
	ld	e, -2
	.loc	2 302 54                        ; src/movegen.c:302:54
	add	a, e
	ld	e, a
	.loc	2 302 96                        ; src/movegen.c:302:96
	ld	bc, (ix - 11)
	.loc	2 302 23                        ; src/movegen.c:302:23
	push	bc
	ld	bc, 4
	push	bc
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_add_move
	ld	iy, 12
	add	iy, sp
	ld	sp, iy
	.loc	2 302 21                        ; src/movegen.c:302:21
	ld	(ix - 11), hl
	.loc	2 303 9 is_stmt 1               ; src/movegen.c:303:9
	jr	.LBB12_31
	.local	.Ltmp361
.Ltmp361:
	.local	.LBB12_31
.LBB12_31:
	.loc	2 304 5                         ; src/movegen.c:304:5
	jr	.LBB12_32
	.local	.Ltmp362
.Ltmp362:
	.local	.LBB12_32
.LBB12_32:
	.loc	2 0 5 is_stmt 0                 ; src/movegen.c:0:5
	jr	.LBB12_33
	.local	.LBB12_33
.LBB12_33:
	.loc	2 307 10 is_stmt 1              ; src/movegen.c:307:10
	ld	hl, (ix - 11)
	.loc	2 307 3 epilogue_begin is_stmt 0 ; src/movegen.c:307:3
	ld	iy, 15
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp363
.Ltmp363:
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_generate_king_moves_at, .Lfunc_end12-_generate_king_moves_at
                                        ; -- End function
	.section	.text._add_move,"ax",@progbits
	.type	_add_move,@function             ; -- Begin function add_move
_add_move:                              ; @add_move
	.local	.Lfunc_begin13
.Lfunc_begin13:
	.loc	2 17 0 is_stmt 1                ; src/movegen.c:17:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -9
	add	hl, sp
	ld	sp, hl
	ld	a, (ix + 6)
	ld	c, (ix + 9)
	ld	b, (ix + 12)
	ld	hl, (ix + 15)
	ld	iy, -327680
	ld	de, _.str.3
	ld	(ix - 1), a
	ld	(ix - 2), c
	ld	(ix - 3), b
	ld	(ix - 6), hl
	.local	.Ltmp364
.Ltmp364:
	.loc	2 18 54 prologue_end            ; src/movegen.c:18:54
	ld	a, (ix - 1)
	ld	bc, 0
	ld	c, a
	.loc	2 18 67 is_stmt 0               ; src/movegen.c:18:67
	ld	a, (ix - 2)
	or	a, a
	sbc	hl, hl
	ld	l, a
	.loc	2 18 3                          ; src/movegen.c:18:3
	push	hl
	push	bc
	push	de
	push	iy
	call	_sprintf
	ld	hl, 12
	add	hl, sp
	ld	sp, hl
	.loc	2 19 36 is_stmt 1               ; src/movegen.c:19:36
	ld	hl, (ix - 6)
	.loc	2 19 12 is_stmt 0               ; src/movegen.c:19:12
	ld	(ix - 9), hl
	.loc	2 23 19 is_stmt 1               ; src/movegen.c:23:19
	ld	a, (ix - 3)
	.loc	2 23 3 is_stmt 0                ; src/movegen.c:23:3
	ld	hl, (ix - 9)
	.loc	2 23 17                         ; src/movegen.c:23:17
	ld	(hl), a
	.loc	2 24 19 is_stmt 1               ; src/movegen.c:24:19
	ld	a, (ix - 2)
	.loc	2 24 3 is_stmt 0                ; src/movegen.c:24:3
	ld	iy, (ix - 9)
	.loc	2 24 17                         ; src/movegen.c:24:17
	ld	(iy + 1), a
	.loc	2 25 19 is_stmt 1               ; src/movegen.c:25:19
	ld	a, (ix - 1)
	.loc	2 25 3 is_stmt 0                ; src/movegen.c:25:3
	ld	iy, (ix - 9)
	.loc	2 25 17                         ; src/movegen.c:25:17
	ld	(iy + 2), a
	.loc	2 27 10 is_stmt 1               ; src/movegen.c:27:10
	ld	iy, (ix - 6)
	.loc	2 27 20 is_stmt 0               ; src/movegen.c:27:20
	lea	hl, iy + 3
	.loc	2 27 3 epilogue_begin           ; src/movegen.c:27:3
	ld	iy, 9
	add	iy, sp
	ld	sp, iy
	pop	ix
	ret
	.local	.Ltmp365
.Ltmp365:
	.local	.Lfunc_end13
.Lfunc_end13:
	.size	_add_move, .Lfunc_end13-_add_move
                                        ; -- End function
	.section	.rodata._w_pawn_capture_offsets,"a",@progbits
	.balign	1
	.globl	_w_pawn_capture_offsets
_w_pawn_capture_offsets:
	.ascii	"\361\357"

	.section	.rodata._b_pawn_capture_offsets,"a",@progbits
	.balign	1
	.globl	_b_pawn_capture_offsets
_b_pawn_capture_offsets:
	.ascii	"\021\017"

	.section	.rodata._knight_offsets,"a",@progbits
	.balign	1
	.globl	_knight_offsets
_knight_offsets:
	.ascii	"\362\356\341\337\016\022\037!"

	.section	.rodata._bishop_offsets,"a",@progbits
	.balign	1
	.globl	_bishop_offsets
_bishop_offsets:
	.ascii	"\361\021\017\357"

	.section	.rodata._rook_offsets,"a",@progbits
	.balign	1
	.globl	_rook_offsets
_rook_offsets:
	.ascii	"\360\001\020\377"

	.section	.rodata._king_offsets,"a",@progbits
	.balign	1
	.globl	_king_offsets
_king_offsets:
	.ascii	"\360\361\001\021\020\017\377\357"

	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"Entered generate_moves\n"

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"Loop iteration %hhu reached\n"

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"move_list: %p\n"

	.section	.rodata._.str.3,"a",@progbits
	.balign	1
	.local	_.str.3
_.str.3:
	.asciz	"From: %hhu To: %hhu\n"

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
	db	1                               ; DW_TAG_array_type
	db	1                               ; DW_CHILDREN_yes
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	4                               ; Abbreviation Code
	db	33                              ; DW_TAG_subrange_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	55                              ; DW_AT_count
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	5                               ; Abbreviation Code
	db	38                              ; DW_TAG_const_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	6                               ; Abbreviation Code
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
	db	7                               ; Abbreviation Code
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
	db	8                               ; Abbreviation Code
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
	db	9                               ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	5                               ; DW_FORM_data2
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	10                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
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
	db	11                              ; Abbreviation Code
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
	db	12                              ; Abbreviation Code
	db	40                              ; DW_TAG_enumerator
	db	0                               ; DW_CHILDREN_no
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	28                              ; DW_AT_const_value
	db	15                              ; DW_FORM_udata
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	13                              ; Abbreviation Code
	db	15                              ; DW_TAG_pointer_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	14                              ; Abbreviation Code
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
	db	5                               ; DW_FORM_data2
	db	39                              ; DW_AT_prototyped
	db	25                              ; DW_FORM_flag_present
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	63                              ; DW_AT_external
	db	25                              ; DW_FORM_flag_present
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	15                              ; Abbreviation Code
	db	5                               ; DW_TAG_formal_parameter
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	5                               ; DW_FORM_data2
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	16                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	3                               ; DW_AT_name
	db	37                              ; DW_FORM_strx1
	db	58                              ; DW_AT_decl_file
	db	11                              ; DW_FORM_data1
	db	59                              ; DW_AT_decl_line
	db	5                               ; DW_FORM_data2
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	17                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	17                              ; DW_AT_low_pc
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	18                              ; Abbreviation Code
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
	db	19                              ; Abbreviation Code
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
	db	20                              ; Abbreviation Code
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
	db	21                              ; Abbreviation Code
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
	db	22                              ; Abbreviation Code
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
	db	23                              ; Abbreviation Code
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
	db	24                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	25                              ; Abbreviation Code
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
	db	26                              ; Abbreviation Code
	db	5                               ; DW_TAG_formal_parameter
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	49                              ; DW_AT_abstract_origin
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	27                              ; Abbreviation Code
	db	52                              ; DW_TAG_variable
	db	0                               ; DW_CHILDREN_no
	db	2                               ; DW_AT_location
	db	24                              ; DW_FORM_exprloc
	db	49                              ; DW_AT_abstract_origin
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	28                              ; Abbreviation Code
	db	11                              ; DW_TAG_lexical_block
	db	1                               ; DW_CHILDREN_yes
	db	85                              ; DW_AT_ranges
	db	35                              ; DW_FORM_rnglistx
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	29                              ; Abbreviation Code
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
	db	5                               ; DW_FORM_data2
	db	39                              ; DW_AT_prototyped
	db	25                              ; DW_FORM_flag_present
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	30                              ; Abbreviation Code
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
	db	5                               ; DW_FORM_data2
	db	87                              ; DW_AT_call_column
	db	11                              ; DW_FORM_data1
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	31                              ; Abbreviation Code
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
	db	32                              ; Abbreviation Code
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
	db	1                               ; Abbrev [1] 0xc:0xa5b DW_TAG_compile_unit
	db	0                               ; DW_AT_producer
	dw	29                              ; DW_AT_language
	db	1                               ; DW_AT_name
	d32	.Lstr_offsets_base0             ; DW_AT_str_offsets_base
	d32	.Lline_table_start0             ; DW_AT_stmt_list
	db	2                               ; DW_AT_comp_dir
	d24	0                               ; DW_AT_low_pc
	db	8                               ; DW_AT_ranges
	d32	.Laddr_table_base0              ; DW_AT_addr_base
	d32	.Lrnglists_table_base0          ; DW_AT_rnglists_base
	db	2                               ; Abbrev [2] 0x26:0xb DW_TAG_variable
	db	3                               ; DW_AT_name
	d32	49                              ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	9                               ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	0
	db	3                               ; Abbrev [3] 0x31:0xc DW_TAG_array_type
	d32	61                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x36:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	2                               ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	5                               ; Abbrev [5] 0x3d:0x5 DW_TAG_const_type
	d32	66                              ; DW_AT_type
	db	6                               ; Abbrev [6] 0x42:0x8 DW_TAG_typedef
	d32	74                              ; DW_AT_type
	db	5                               ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	6                               ; DW_AT_decl_line
	db	7                               ; Abbrev [7] 0x4a:0x4 DW_TAG_base_type
	db	4                               ; DW_AT_name
	db	6                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	8                               ; Abbrev [8] 0x4e:0x4 DW_TAG_base_type
	db	6                               ; DW_AT_name
	db	8                               ; DW_AT_byte_size
	db	7                               ; DW_AT_encoding
	db	2                               ; Abbrev [2] 0x52:0xb DW_TAG_variable
	db	7                               ; DW_AT_name
	d32	49                              ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	10                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	1
	db	2                               ; Abbrev [2] 0x5d:0xb DW_TAG_variable
	db	8                               ; DW_AT_name
	d32	104                             ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	2
	db	3                               ; Abbrev [3] 0x68:0xc DW_TAG_array_type
	d32	61                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x6d:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	8                               ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	2                               ; Abbrev [2] 0x74:0xb DW_TAG_variable
	db	9                               ; DW_AT_name
	d32	127                             ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	3
	db	3                               ; Abbrev [3] 0x7f:0xc DW_TAG_array_type
	d32	61                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x84:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	4                               ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	2                               ; Abbrev [2] 0x8b:0xb DW_TAG_variable
	db	10                              ; DW_AT_name
	d32	127                             ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	13                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	4
	db	2                               ; Abbrev [2] 0x96:0xb DW_TAG_variable
	db	11                              ; DW_AT_name
	d32	104                             ; DW_AT_type
                                        ; DW_AT_external
	db	2                               ; DW_AT_decl_file
	db	14                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	5
	db	9                               ; Abbrev [9] 0xa1:0xb DW_TAG_variable
	d32	172                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	dw	311                             ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	6
	db	3                               ; Abbrev [3] 0xac:0xc DW_TAG_array_type
	d32	184                             ; DW_AT_type
	db	4                               ; Abbrev [4] 0xb1:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	24                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	7                               ; Abbrev [7] 0xb8:0x4 DW_TAG_base_type
	db	12                              ; DW_AT_name
	db	6                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	9                               ; Abbrev [9] 0xbc:0xb DW_TAG_variable
	d32	199                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	dw	325                             ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	7
	db	3                               ; Abbrev [3] 0xc7:0xc DW_TAG_array_type
	d32	184                             ; DW_AT_type
	db	4                               ; Abbrev [4] 0xcc:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	29                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	9                               ; Abbrev [9] 0xd3:0xb DW_TAG_variable
	d32	222                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	dw	326                             ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	8
	db	3                               ; Abbrev [3] 0xde:0xc DW_TAG_array_type
	d32	184                             ; DW_AT_type
	db	4                               ; Abbrev [4] 0xe3:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	15                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	10                              ; Abbrev [10] 0xea:0xa DW_TAG_variable
	d32	244                             ; DW_AT_type
	db	2                               ; DW_AT_decl_file
	db	18                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	9
	db	3                               ; Abbrev [3] 0xf4:0xc DW_TAG_array_type
	d32	184                             ; DW_AT_type
	db	4                               ; Abbrev [4] 0xf9:0x6 DW_TAG_subrange_type
	d32	78                              ; DW_AT_type
	db	21                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	11                              ; Abbrev [11] 0x100:0x12 DW_TAG_enumeration_type
	d32	274                             ; DW_AT_type
	db	3                               ; DW_AT_byte_size
	db	3                               ; DW_AT_decl_file
	db	8                               ; DW_AT_decl_line
	db	12                              ; Abbrev [12] 0x108:0x3 DW_TAG_enumerator
	db	14                              ; DW_AT_name
	db	0                               ; DW_AT_const_value
	db	12                              ; Abbrev [12] 0x10b:0x3 DW_TAG_enumerator
	db	15                              ; DW_AT_name
	db	1                               ; DW_AT_const_value
	db	12                              ; Abbrev [12] 0x10e:0x3 DW_TAG_enumerator
	db	16                              ; DW_AT_name
	db	2                               ; DW_AT_const_value
	db	0                               ; End Of Children Mark
	db	7                               ; Abbrev [7] 0x112:0x4 DW_TAG_base_type
	db	13                              ; DW_AT_name
	db	7                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	11                              ; Abbrev [11] 0x116:0xf DW_TAG_enumeration_type
	d32	274                             ; DW_AT_type
	db	3                               ; DW_AT_byte_size
	db	3                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	12                              ; Abbrev [12] 0x11e:0x3 DW_TAG_enumerator
	db	17                              ; DW_AT_name
	db	0                               ; DW_AT_const_value
	db	12                              ; Abbrev [12] 0x121:0x3 DW_TAG_enumerator
	db	18                              ; DW_AT_name
	db	1                               ; DW_AT_const_value
	db	0                               ; End Of Children Mark
	db	13                              ; Abbrev [13] 0x125:0x5 DW_TAG_pointer_type
	d32	184                             ; DW_AT_type
	db	13                              ; Abbrev [13] 0x12a:0x5 DW_TAG_pointer_type
	d32	303                             ; DW_AT_type
	db	6                               ; Abbrev [6] 0x12f:0x8 DW_TAG_typedef
	d32	311                             ; DW_AT_type
	db	20                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	7                               ; Abbrev [7] 0x137:0x4 DW_TAG_base_type
	db	19                              ; DW_AT_name
	db	8                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	14                              ; Abbrev [14] 0x13b:0x8d DW_TAG_subprogram
	db	10                              ; DW_AT_low_pc
	d32	.Lfunc_end0-.Lfunc_begin0       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	34                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	310                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
                                        ; DW_AT_external
	db	15                              ; Abbrev [15] 0x14b:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	db	48                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	310                             ; DW_AT_decl_line
	d32	2598                            ; DW_AT_type
	db	15                              ; Abbrev [15] 0x157:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	8
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	310                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	16                              ; Abbrev [16] 0x163:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	7
	db	50                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	312                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	16                              ; Abbrev [16] 0x16f:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	51                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	313                             ; DW_AT_decl_line
	d32	2606                            ; DW_AT_type
	db	17                              ; Abbrev [17] 0x17b:0x26 DW_TAG_lexical_block
	db	11                              ; DW_AT_low_pc
	d32	.Ltmp14-.Ltmp7                  ; DW_AT_high_pc
	db	16                              ; Abbrev [16] 0x181:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	324                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x18d:0x13 DW_TAG_lexical_block
	db	12                              ; DW_AT_low_pc
	d32	.Ltmp13-.Ltmp10                 ; DW_AT_high_pc
	db	16                              ; Abbrev [16] 0x193:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	2
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	327                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	17                              ; Abbrev [17] 0x1a1:0x26 DW_TAG_lexical_block
	db	13                              ; DW_AT_low_pc
	d32	.Ltmp22-.Ltmp15                 ; DW_AT_high_pc
	db	16                              ; Abbrev [16] 0x1a7:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	362                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x1b3:0x13 DW_TAG_lexical_block
	db	14                              ; DW_AT_low_pc
	d32	.Ltmp21-.Ltmp18                 ; DW_AT_high_pc
	db	16                              ; Abbrev [16] 0x1b9:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	365                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x1c8:0x60 DW_TAG_subprogram
	db	15                              ; DW_AT_low_pc
	d32	.Lfunc_end1-.Lfunc_begin1       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	35                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	65                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x1d7:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	65                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x1e2:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	8
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	65                              ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	20                              ; Abbrev [20] 0x1ed:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	55                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	66                              ; DW_AT_decl_line
	d32	2642                            ; DW_AT_type
	db	20                              ; Abbrev [20] 0x1f8:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	67                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x203:0x24 DW_TAG_lexical_block
	db	16                              ; DW_AT_low_pc
	d32	.Ltmp53-.Ltmp25                 ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x209:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	68                              ; DW_AT_decl_line
	d32	2650                            ; DW_AT_type
	db	17                              ; Abbrev [17] 0x214:0x12 DW_TAG_lexical_block
	db	17                              ; DW_AT_low_pc
	d32	.Ltmp50-.Ltmp36                 ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x21a:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	78                              ; DW_AT_decl_line
	d32	632                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	21                              ; Abbrev [21] 0x228:0x33 DW_TAG_subprogram
	db	21                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	30                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
                                        ; DW_AT_inline
	db	22                              ; Abbrev [22] 0x230:0x8 DW_TAG_formal_parameter
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	30                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x238:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	30                              ; DW_AT_decl_line
	d32	66                              ; DW_AT_type
	db	22                              ; Abbrev [22] 0x240:0x8 DW_TAG_formal_parameter
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	30                              ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	23                              ; Abbrev [23] 0x248:0x8 DW_TAG_variable
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	31                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	24                              ; Abbrev [24] 0x250:0xa DW_TAG_lexical_block
	db	23                              ; Abbrev [23] 0x251:0x8 DW_TAG_variable
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	33                              ; DW_AT_decl_line
	d32	632                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	13                              ; Abbrev [13] 0x25b:0x5 DW_TAG_pointer_type
	d32	608                             ; DW_AT_type
	db	6                               ; Abbrev [6] 0x260:0x8 DW_TAG_typedef
	d32	616                             ; DW_AT_type
	db	23                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x268:0x8 DW_TAG_typedef
	d32	274                             ; DW_AT_type
	db	22                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	60                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x270:0x8 DW_TAG_typedef
	d32	303                             ; DW_AT_type
	db	25                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	10                              ; DW_AT_decl_line
	db	6                               ; Abbrev [6] 0x278:0x8 DW_TAG_typedef
	d32	303                             ; DW_AT_type
	db	30                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	11                              ; DW_AT_decl_line
	db	18                              ; Abbrev [18] 0x280:0x75 DW_TAG_subprogram
	db	18                              ; DW_AT_low_pc
	d32	.Lfunc_end2-.Lfunc_begin2       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	36                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	107                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x28f:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	107                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x29a:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	107                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x2a5:0x4f DW_TAG_lexical_block
	db	19                              ; DW_AT_low_pc
	d32	.Ltmp73-.Ltmp55                 ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x2ab:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	109                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x2b6:0x3d DW_TAG_inlined_subroutine
	d32	552                             ; DW_AT_abstract_origin
	db	20                              ; DW_AT_low_pc
	d32	.Ltmp71-.Ltmp59                 ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	110                             ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x2c3:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	560                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x2cb:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	568                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x2d3:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	d32	576                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x2db:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	584                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x2e3:0xf DW_TAG_lexical_block
	db	21                              ; DW_AT_low_pc
	d32	.Ltmp70-.Ltmp62                 ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x2e9:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	593                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	21                              ; Abbrev [21] 0x2f5:0x33 DW_TAG_subprogram
	db	31                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	44                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
                                        ; DW_AT_inline
	db	22                              ; Abbrev [22] 0x2fd:0x8 DW_TAG_formal_parameter
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	44                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x305:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	44                              ; DW_AT_decl_line
	d32	66                              ; DW_AT_type
	db	22                              ; Abbrev [22] 0x30d:0x8 DW_TAG_formal_parameter
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	44                              ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	23                              ; Abbrev [23] 0x315:0x8 DW_TAG_variable
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	45                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	24                              ; Abbrev [24] 0x31d:0xa DW_TAG_lexical_block
	db	23                              ; Abbrev [23] 0x31e:0x8 DW_TAG_variable
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	47                              ; DW_AT_decl_line
	d32	632                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x328:0x11a DW_TAG_subprogram
	db	22                              ; DW_AT_low_pc
	d32	.Lfunc_end3-.Lfunc_begin3       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	37                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	116                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x337:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	116                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x342:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	116                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x34d:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	23                              ; DW_AT_low_pc
	d32	.Ltmp86-.Ltmp76                 ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	117                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x35a:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x362:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x36a:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x372:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x37a:0xf DW_TAG_lexical_block
	db	24                              ; DW_AT_low_pc
	d32	.Ltmp85-.Ltmp77                 ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x380:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x38a:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	25                              ; DW_AT_low_pc
	d32	.Ltmp97-.Ltmp87                 ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	118                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x397:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	24
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x39f:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	23
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x3a7:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x3af:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x3b7:0xf DW_TAG_lexical_block
	db	26                              ; DW_AT_low_pc
	d32	.Ltmp96-.Ltmp88                 ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x3bd:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x3c7:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	27                              ; DW_AT_low_pc
	d32	.Ltmp108-.Ltmp98                ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	119                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x3d4:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x3dc:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	16
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x3e4:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x3ec:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x3f4:0xf DW_TAG_lexical_block
	db	28                              ; DW_AT_low_pc
	d32	.Ltmp107-.Ltmp99                ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x3fa:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x404:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	29                              ; DW_AT_low_pc
	d32	.Ltmp119-.Ltmp109               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	120                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x411:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x419:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x421:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x429:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x431:0xf DW_TAG_lexical_block
	db	30                              ; DW_AT_low_pc
	d32	.Ltmp118-.Ltmp110               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x437:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x442:0x11a DW_TAG_subprogram
	db	31                              ; DW_AT_low_pc
	d32	.Lfunc_end4-.Lfunc_begin4       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	38                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	125                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x451:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	125                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x45c:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	125                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x467:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	32                              ; DW_AT_low_pc
	d32	.Ltmp132-.Ltmp122               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	126                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x474:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x47c:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x484:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x48c:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x494:0xf DW_TAG_lexical_block
	db	33                              ; DW_AT_low_pc
	d32	.Ltmp131-.Ltmp123               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x49a:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x4a4:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	34                              ; DW_AT_low_pc
	d32	.Ltmp143-.Ltmp133               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	127                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x4b1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	24
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x4b9:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	23
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x4c1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x4c9:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x4d1:0xf DW_TAG_lexical_block
	db	35                              ; DW_AT_low_pc
	d32	.Ltmp142-.Ltmp134               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x4d7:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x4e1:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	36                              ; DW_AT_low_pc
	d32	.Ltmp154-.Ltmp144               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	128                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x4ee:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x4f6:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	16
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x4fe:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x506:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x50e:0xf DW_TAG_lexical_block
	db	37                              ; DW_AT_low_pc
	d32	.Ltmp153-.Ltmp145               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x514:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x51e:0x3d DW_TAG_inlined_subroutine
	d32	757                             ; DW_AT_abstract_origin
	db	38                              ; DW_AT_low_pc
	d32	.Ltmp165-.Ltmp155               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	129                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x52b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	765                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x533:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	773                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x53b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	781                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x543:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	789                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x54b:0xf DW_TAG_lexical_block
	db	39                              ; DW_AT_low_pc
	d32	.Ltmp164-.Ltmp156               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x551:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	d32	798                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x55c:0x26 DW_TAG_subprogram
	db	40                              ; DW_AT_low_pc
	d32	.Lfunc_end5-.Lfunc_begin5       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	39                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	134                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x56b:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	134                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x576:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	134                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x582:0x75 DW_TAG_subprogram
	db	41                              ; DW_AT_low_pc
	d32	.Lfunc_end6-.Lfunc_begin6       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	40                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	141                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x591:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	141                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x59c:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	141                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x5a7:0x4f DW_TAG_lexical_block
	db	42                              ; DW_AT_low_pc
	d32	.Ltmp187-.Ltmp169               ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x5ad:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	143                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x5b8:0x3d DW_TAG_inlined_subroutine
	d32	552                             ; DW_AT_abstract_origin
	db	43                              ; DW_AT_low_pc
	d32	.Ltmp185-.Ltmp173               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	144                             ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x5c5:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	560                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x5cd:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	568                             ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x5d5:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	d32	576                             ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x5dd:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	584                             ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x5e5:0xf DW_TAG_lexical_block
	db	44                              ; DW_AT_low_pc
	d32	.Ltmp184-.Ltmp176               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x5eb:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	593                             ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x5f7:0x4a DW_TAG_subprogram
	db	45                              ; DW_AT_low_pc
	d32	.Lfunc_end7-.Lfunc_begin7       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	41                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	179                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x606:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	5
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	179                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x611:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	2
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	179                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x61c:0x12 DW_TAG_lexical_block
	db	46                              ; DW_AT_low_pc
	d32	.Ltmp207-.Ltmp191               ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x622:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	181                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	17                              ; Abbrev [17] 0x62e:0x12 DW_TAG_lexical_block
	db	47                              ; DW_AT_low_pc
	d32	.Ltmp222-.Ltmp207               ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x634:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	205                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	21                              ; Abbrev [21] 0x641:0x33 DW_TAG_subprogram
	db	32                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	150                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
                                        ; DW_AT_inline
	db	22                              ; Abbrev [22] 0x649:0x8 DW_TAG_formal_parameter
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	150                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x651:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	150                             ; DW_AT_decl_line
	d32	66                              ; DW_AT_type
	db	22                              ; Abbrev [22] 0x659:0x8 DW_TAG_formal_parameter
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	150                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	23                              ; Abbrev [23] 0x661:0x8 DW_TAG_variable
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	151                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	24                              ; Abbrev [24] 0x669:0xa DW_TAG_lexical_block
	db	23                              ; Abbrev [23] 0x66a:0x8 DW_TAG_variable
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	153                             ; DW_AT_decl_line
	d32	632                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x674:0x75 DW_TAG_subprogram
	db	48                              ; DW_AT_low_pc
	d32	.Lfunc_end8-.Lfunc_begin8       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	42                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	231                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x683:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	231                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x68e:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	231                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	17                              ; Abbrev [17] 0x699:0x4f DW_TAG_lexical_block
	db	49                              ; DW_AT_low_pc
	d32	.Ltmp239-.Ltmp224               ; DW_AT_high_pc
	db	20                              ; Abbrev [20] 0x69f:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	233                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x6aa:0x3d DW_TAG_inlined_subroutine
	d32	1601                            ; DW_AT_abstract_origin
	db	50                              ; DW_AT_low_pc
	d32	.Ltmp237-.Ltmp228               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	234                             ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x6b7:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	1609                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x6bf:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	1617                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x6c7:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	d32	1625                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x6cf:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	1633                            ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x6d7:0xf DW_TAG_lexical_block
	db	51                              ; DW_AT_low_pc
	d32	.Ltmp236-.Ltmp231               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x6dd:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	1642                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	21                              ; Abbrev [21] 0x6e9:0x33 DW_TAG_subprogram
	db	33                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	162                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
                                        ; DW_AT_inline
	db	22                              ; Abbrev [22] 0x6f1:0x8 DW_TAG_formal_parameter
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	162                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	22                              ; Abbrev [22] 0x6f9:0x8 DW_TAG_formal_parameter
	db	26                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	162                             ; DW_AT_decl_line
	d32	66                              ; DW_AT_type
	db	22                              ; Abbrev [22] 0x701:0x8 DW_TAG_formal_parameter
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	162                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	23                              ; Abbrev [23] 0x709:0x8 DW_TAG_variable
	db	28                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	163                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	24                              ; Abbrev [24] 0x711:0xa DW_TAG_lexical_block
	db	23                              ; Abbrev [23] 0x712:0x8 DW_TAG_variable
	db	29                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	165                             ; DW_AT_decl_line
	d32	632                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x71c:0x10a DW_TAG_subprogram
	db	52                              ; DW_AT_low_pc
	d32	.Lfunc_end9-.Lfunc_begin9       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	43                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	240                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x72b:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	240                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x736:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	240                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x741:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	53                              ; DW_AT_low_pc
	d32	.Ltmp250-.Ltmp242               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	241                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x74e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x756:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x75e:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x766:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x76e:0xb DW_TAG_lexical_block
	db	0                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x770:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x77a:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	54                              ; DW_AT_low_pc
	d32	.Ltmp259-.Ltmp251               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	242                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x787:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	24
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x78f:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	23
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x797:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x79f:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x7a7:0xb DW_TAG_lexical_block
	db	1                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x7a9:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x7b3:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	55                              ; DW_AT_low_pc
	d32	.Ltmp268-.Ltmp260               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	243                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x7c0:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x7c8:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	16
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x7d0:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x7d8:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x7e0:0xb DW_TAG_lexical_block
	db	2                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x7e2:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x7ec:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	56                              ; DW_AT_low_pc
	d32	.Ltmp277-.Ltmp269               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	244                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x7f9:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x801:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x809:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x811:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x819:0xb DW_TAG_lexical_block
	db	3                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x81b:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x826:0x10a DW_TAG_subprogram
	db	57                              ; DW_AT_low_pc
	d32	.Lfunc_end10-.Lfunc_begin10     ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	44                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	249                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x835:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	249                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x840:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	249                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	25                              ; Abbrev [25] 0x84b:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	58                              ; DW_AT_low_pc
	d32	.Ltmp288-.Ltmp280               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	250                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x858:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	31
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x860:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	30
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x868:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	27
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x870:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	26
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x878:0xb DW_TAG_lexical_block
	db	4                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x87a:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	25
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x884:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	59                              ; DW_AT_low_pc
	d32	.Ltmp297-.Ltmp289               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	251                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x891:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	24
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x899:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	23
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x8a1:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	20
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x8a9:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	19
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x8b1:0xb DW_TAG_lexical_block
	db	5                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x8b3:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	18
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x8bd:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	60                              ; DW_AT_low_pc
	d32	.Ltmp306-.Ltmp298               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	252                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x8ca:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	17
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x8d2:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	16
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x8da:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x8e2:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	12
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x8ea:0xb DW_TAG_lexical_block
	db	6                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x8ec:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	11
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	25                              ; Abbrev [25] 0x8f6:0x39 DW_TAG_inlined_subroutine
	d32	1769                            ; DW_AT_abstract_origin
	db	61                              ; DW_AT_low_pc
	d32	.Ltmp315-.Ltmp307               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	db	253                             ; DW_AT_call_line
	db	15                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x903:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	1777                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x90b:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	1785                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x913:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	6
	d32	1793                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x91b:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	5
	d32	1801                            ; DW_AT_abstract_origin
	db	28                              ; Abbrev [28] 0x923:0xb DW_TAG_lexical_block
	db	7                               ; DW_AT_ranges
	db	27                              ; Abbrev [27] 0x925:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	4
	d32	1810                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	29                              ; Abbrev [29] 0x930:0x29 DW_TAG_subprogram
	db	62                              ; DW_AT_low_pc
	d32	.Lfunc_end11-.Lfunc_begin11     ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	45                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	258                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x940:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	258                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x94c:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	258                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	29                              ; Abbrev [29] 0x959:0x86 DW_TAG_subprogram
	db	63                              ; DW_AT_low_pc
	d32	.Lfunc_end12-.Lfunc_begin12     ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	46                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	265                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x969:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	db	24                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	265                             ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	15                              ; Abbrev [15] 0x975:0xc DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	4
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	265                             ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	16                              ; Abbrev [16] 0x981:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	1
	db	55                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	266                             ; DW_AT_decl_line
	d32	2642                            ; DW_AT_type
	db	17                              ; Abbrev [17] 0x98d:0x51 DW_TAG_lexical_block
	db	64                              ; DW_AT_low_pc
	d32	.Ltmp335-.Ltmp320               ; DW_AT_high_pc
	db	16                              ; Abbrev [16] 0x993:0xc DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	54                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	dw	269                             ; DW_AT_decl_line
	d32	303                             ; DW_AT_type
	db	30                              ; Abbrev [30] 0x99f:0x3e DW_TAG_inlined_subroutine
	d32	1601                            ; DW_AT_abstract_origin
	db	65                              ; DW_AT_low_pc
	d32	.Ltmp333-.Ltmp324               ; DW_AT_high_pc
	db	2                               ; DW_AT_call_file
	dw	270                             ; DW_AT_call_line
	db	17                              ; DW_AT_call_column
	db	26                              ; Abbrev [26] 0x9ad:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	14
	d32	1609                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x9b5:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	13
	d32	1617                            ; DW_AT_abstract_origin
	db	26                              ; Abbrev [26] 0x9bd:0x8 DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	10
	d32	1625                            ; DW_AT_abstract_origin
	db	27                              ; Abbrev [27] 0x9c5:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	9
	d32	1633                            ; DW_AT_abstract_origin
	db	17                              ; Abbrev [17] 0x9cd:0xf DW_TAG_lexical_block
	db	66                              ; DW_AT_low_pc
	d32	.Ltmp332-.Ltmp327               ; DW_AT_high_pc
	db	27                              ; Abbrev [27] 0x9d3:0x8 DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	8
	d32	1642                            ; DW_AT_abstract_origin
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	0                               ; End Of Children Mark
	db	18                              ; Abbrev [18] 0x9df:0x47 DW_TAG_subprogram
	db	67                              ; DW_AT_low_pc
	d32	.Lfunc_end13-.Lfunc_begin13     ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	47                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	603                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x9ee:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	8
	db	58                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0x9f9:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	7
	db	59                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	d32	624                             ; DW_AT_type
	db	19                              ; Abbrev [19] 0xa04:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	6
	db	60                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	d32	2654                            ; DW_AT_type
	db	19                              ; Abbrev [19] 0xa0f:0xb DW_TAG_formal_parameter
	db	2                               ; DW_AT_location
	db	145
	db	3
	db	27                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	d32	603                             ; DW_AT_type
	db	20                              ; Abbrev [20] 0xa1a:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	62                              ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	19                              ; DW_AT_decl_line
	d32	298                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	6                               ; Abbrev [6] 0xa26:0x8 DW_TAG_typedef
	d32	256                             ; DW_AT_type
	db	49                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	8                               ; DW_AT_decl_line
	db	13                              ; Abbrev [13] 0xa2e:0x5 DW_TAG_pointer_type
	d32	2611                            ; DW_AT_type
	db	6                               ; Abbrev [6] 0xa33:0x8 DW_TAG_typedef
	d32	2619                            ; DW_AT_type
	db	53                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	21                              ; DW_AT_decl_line
	db	31                              ; Abbrev [31] 0xa3b:0x17 DW_TAG_structure_type
	db	2                               ; DW_AT_byte_size
	db	3                               ; DW_AT_decl_file
	db	18                              ; DW_AT_decl_line
	db	32                              ; Abbrev [32] 0xa3f:0x9 DW_TAG_member
	db	52                              ; DW_AT_name
	d32	632                             ; DW_AT_type
	db	3                               ; DW_AT_decl_file
	db	19                              ; DW_AT_decl_line
	db	0                               ; DW_AT_data_member_location
	db	32                              ; Abbrev [32] 0xa48:0x9 DW_TAG_member
	db	24                              ; DW_AT_name
	d32	624                             ; DW_AT_type
	db	3                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	db	1                               ; DW_AT_data_member_location
	db	0                               ; End Of Children Mark
	db	6                               ; Abbrev [6] 0xa52:0x8 DW_TAG_typedef
	d32	278                             ; DW_AT_type
	db	56                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	7                               ; DW_AT_decl_line
	db	7                               ; Abbrev [7] 0xa5a:0x4 DW_TAG_base_type
	db	57                              ; DW_AT_name
	db	5                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	6                               ; Abbrev [6] 0xa5e:0x8 DW_TAG_typedef
	d32	303                             ; DW_AT_type
	db	61                              ; DW_AT_name
	db	3                               ; DW_AT_decl_file
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
	d32	9                               ; Offset entry count
	.local	.Lrnglists_table_base0
.Lrnglists_table_base0:
	d32	.Ldebug_ranges0-.Lrnglists_table_base0
	d32	.Ldebug_ranges1-.Lrnglists_table_base0
	d32	.Ldebug_ranges2-.Lrnglists_table_base0
	d32	.Ldebug_ranges3-.Lrnglists_table_base0
	d32	.Ldebug_ranges4-.Lrnglists_table_base0
	d32	.Ldebug_ranges5-.Lrnglists_table_base0
	d32	.Ldebug_ranges6-.Lrnglists_table_base0
	d32	.Ldebug_ranges7-.Lrnglists_table_base0
	d32	.Ldebug_ranges8-.Lrnglists_table_base0
	.local	.Ldebug_ranges0
.Ldebug_ranges0:
	db	1                               ; DW_RLE_base_addressx
	db	52                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp243-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp247-.Lfunc_begin9         ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp248-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp249-.Lfunc_begin9         ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges1
.Ldebug_ranges1:
	db	1                               ; DW_RLE_base_addressx
	db	52                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp252-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp256-.Lfunc_begin9         ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp257-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp258-.Lfunc_begin9         ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges2
.Ldebug_ranges2:
	db	1                               ; DW_RLE_base_addressx
	db	52                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp261-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp265-.Lfunc_begin9         ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp266-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp267-.Lfunc_begin9         ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges3
.Ldebug_ranges3:
	db	1                               ; DW_RLE_base_addressx
	db	52                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp270-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp274-.Lfunc_begin9         ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp275-.Lfunc_begin9         ;   starting offset
	.uleb128 .Ltmp276-.Lfunc_begin9         ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges4
.Ldebug_ranges4:
	db	1                               ; DW_RLE_base_addressx
	db	57                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp281-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp285-.Lfunc_begin10        ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp286-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp287-.Lfunc_begin10        ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges5
.Ldebug_ranges5:
	db	1                               ; DW_RLE_base_addressx
	db	57                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp290-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp294-.Lfunc_begin10        ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp295-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp296-.Lfunc_begin10        ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges6
.Ldebug_ranges6:
	db	1                               ; DW_RLE_base_addressx
	db	57                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp299-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp303-.Lfunc_begin10        ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp304-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp305-.Lfunc_begin10        ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges7
.Ldebug_ranges7:
	db	1                               ; DW_RLE_base_addressx
	db	57                              ;   base address index
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp308-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp312-.Lfunc_begin10        ;   ending offset
	db	4                               ; DW_RLE_offset_pair
	.uleb128 .Ltmp313-.Lfunc_begin10        ;   starting offset
	.uleb128 .Ltmp314-.Lfunc_begin10        ;   ending offset
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_ranges8
.Ldebug_ranges8:
	db	3                               ; DW_RLE_startx_length
	db	10                              ;   start index
	.uleb128 .Lfunc_end0-.Lfunc_begin0      ;   length
	db	3                               ; DW_RLE_startx_length
	db	15                              ;   start index
	.uleb128 .Lfunc_end1-.Lfunc_begin1      ;   length
	db	3                               ; DW_RLE_startx_length
	db	18                              ;   start index
	.uleb128 .Lfunc_end2-.Lfunc_begin2      ;   length
	db	3                               ; DW_RLE_startx_length
	db	22                              ;   start index
	.uleb128 .Lfunc_end3-.Lfunc_begin3      ;   length
	db	3                               ; DW_RLE_startx_length
	db	31                              ;   start index
	.uleb128 .Lfunc_end4-.Lfunc_begin4      ;   length
	db	3                               ; DW_RLE_startx_length
	db	40                              ;   start index
	.uleb128 .Lfunc_end5-.Lfunc_begin5      ;   length
	db	3                               ; DW_RLE_startx_length
	db	41                              ;   start index
	.uleb128 .Lfunc_end6-.Lfunc_begin6      ;   length
	db	3                               ; DW_RLE_startx_length
	db	45                              ;   start index
	.uleb128 .Lfunc_end7-.Lfunc_begin7      ;   length
	db	3                               ; DW_RLE_startx_length
	db	48                              ;   start index
	.uleb128 .Lfunc_end8-.Lfunc_begin8      ;   length
	db	3                               ; DW_RLE_startx_length
	db	52                              ;   start index
	.uleb128 .Lfunc_end9-.Lfunc_begin9      ;   length
	db	3                               ; DW_RLE_startx_length
	db	57                              ;   start index
	.uleb128 .Lfunc_end10-.Lfunc_begin10    ;   length
	db	3                               ; DW_RLE_startx_length
	db	62                              ;   start index
	.uleb128 .Lfunc_end11-.Lfunc_begin11    ;   length
	db	3                               ; DW_RLE_startx_length
	db	63                              ;   start index
	.uleb128 .Lfunc_end12-.Lfunc_begin12    ;   length
	db	3                               ; DW_RLE_startx_length
	db	67                              ;   start index
	.uleb128 .Lfunc_end13-.Lfunc_begin13    ;   length
	db	0                               ; DW_RLE_end_of_list
	.local	.Ldebug_list_header_end0
.Ldebug_list_header_end0:
	.section	.debug_str_offsets,"",@progbits
	d32	256                             ; Length of String Offsets Set
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
	.asciz	"movegen.c"                     ; string offset=111
	.local	.Linfo_string2
.Linfo_string2:
	.asciz	"/Users/jaden/dev/calculator/MinTI-Chess" ; string offset=121
	.local	.Linfo_string3
.Linfo_string3:
	.asciz	"w_pawn_capture_offsets"        ; string offset=161
	.local	.Linfo_string4
.Linfo_string4:
	.asciz	"signed char"                   ; string offset=184
	.local	.Linfo_string5
.Linfo_string5:
	.asciz	"int8_t"                        ; string offset=196
	.local	.Linfo_string6
.Linfo_string6:
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=203
	.local	.Linfo_string7
.Linfo_string7:
	.asciz	"b_pawn_capture_offsets"        ; string offset=223
	.local	.Linfo_string8
.Linfo_string8:
	.asciz	"knight_offsets"                ; string offset=246
	.local	.Linfo_string9
.Linfo_string9:
	.asciz	"bishop_offsets"                ; string offset=261
	.local	.Linfo_string10
.Linfo_string10:
	.asciz	"rook_offsets"                  ; string offset=276
	.local	.Linfo_string11
.Linfo_string11:
	.asciz	"king_offsets"                  ; string offset=289
	.local	.Linfo_string12
.Linfo_string12:
	.asciz	"char"                          ; string offset=302
	.local	.Linfo_string13
.Linfo_string13:
	.asciz	"unsigned int"                  ; string offset=307
	.local	.Linfo_string14
.Linfo_string14:
	.asciz	"HASH"                          ; string offset=320
	.local	.Linfo_string15
.Linfo_string15:
	.asciz	"CAPTURES"                      ; string offset=325
	.local	.Linfo_string16
.Linfo_string16:
	.asciz	"QUIETS"                        ; string offset=334
	.local	.Linfo_string17
.Linfo_string17:
	.asciz	"WHITE"                         ; string offset=341
	.local	.Linfo_string18
.Linfo_string18:
	.asciz	"BLACK"                         ; string offset=347
	.local	.Linfo_string19
.Linfo_string19:
	.asciz	"unsigned char"                 ; string offset=353
	.local	.Linfo_string20
.Linfo_string20:
	.asciz	"uint8_t"                       ; string offset=367
	.local	.Linfo_string21
.Linfo_string21:
	.asciz	"generate_stepping_captures_at" ; string offset=375
	.local	.Linfo_string22
.Linfo_string22:
	.asciz	"uint24_t"                      ; string offset=405
	.local	.Linfo_string23
.Linfo_string23:
	.asciz	"Move"                          ; string offset=414
	.local	.Linfo_string24
.Linfo_string24:
	.asciz	"square"                        ; string offset=419
	.local	.Linfo_string25
.Linfo_string25:
	.asciz	"Square"                        ; string offset=426
	.local	.Linfo_string26
.Linfo_string26:
	.asciz	"offset"                        ; string offset=433
	.local	.Linfo_string27
.Linfo_string27:
	.asciz	"move_list"                     ; string offset=440
	.local	.Linfo_string28
.Linfo_string28:
	.asciz	"target"                        ; string offset=450
	.local	.Linfo_string29
.Linfo_string29:
	.asciz	"target_piece"                  ; string offset=457
	.local	.Linfo_string30
.Linfo_string30:
	.asciz	"Piece"                         ; string offset=470
	.local	.Linfo_string31
.Linfo_string31:
	.asciz	"generate_sliding_captures_at"  ; string offset=476
	.local	.Linfo_string32
.Linfo_string32:
	.asciz	"generate_stepping_moves_at"    ; string offset=505
	.local	.Linfo_string33
.Linfo_string33:
	.asciz	"generate_sliding_moves_at"     ; string offset=532
	.local	.Linfo_string34
.Linfo_string34:
	.asciz	"generate_moves"                ; string offset=558
	.local	.Linfo_string35
.Linfo_string35:
	.asciz	"generate_pawn_captures_at"     ; string offset=573
	.local	.Linfo_string36
.Linfo_string36:
	.asciz	"generate_knight_captures_at"   ; string offset=599
	.local	.Linfo_string37
.Linfo_string37:
	.asciz	"generate_bishop_captures_at"   ; string offset=627
	.local	.Linfo_string38
.Linfo_string38:
	.asciz	"generate_rook_captures_at"     ; string offset=655
	.local	.Linfo_string39
.Linfo_string39:
	.asciz	"generate_queen_captures_at"    ; string offset=681
	.local	.Linfo_string40
.Linfo_string40:
	.asciz	"generate_king_captures_at"     ; string offset=708
	.local	.Linfo_string41
.Linfo_string41:
	.asciz	"generate_pawn_moves_at"        ; string offset=734
	.local	.Linfo_string42
.Linfo_string42:
	.asciz	"generate_knight_moves_at"      ; string offset=757
	.local	.Linfo_string43
.Linfo_string43:
	.asciz	"generate_bishop_moves_at"      ; string offset=782
	.local	.Linfo_string44
.Linfo_string44:
	.asciz	"generate_rook_moves_at"        ; string offset=807
	.local	.Linfo_string45
.Linfo_string45:
	.asciz	"generate_queen_moves_at"       ; string offset=830
	.local	.Linfo_string46
.Linfo_string46:
	.asciz	"generate_king_moves_at"        ; string offset=854
	.local	.Linfo_string47
.Linfo_string47:
	.asciz	"add_move"                      ; string offset=877
	.local	.Linfo_string48
.Linfo_string48:
	.asciz	"stage"                         ; string offset=886
	.local	.Linfo_string49
.Linfo_string49:
	.asciz	"Stage"                         ; string offset=892
	.local	.Linfo_string50
.Linfo_string50:
	.asciz	"end"                           ; string offset=898
	.local	.Linfo_string51
.Linfo_string51:
	.asciz	"pieces"                        ; string offset=902
	.local	.Linfo_string52
.Linfo_string52:
	.asciz	"piece"                         ; string offset=909
	.local	.Linfo_string53
.Linfo_string53:
	.asciz	"PieceInfo"                     ; string offset=915
	.local	.Linfo_string54
.Linfo_string54:
	.asciz	"i"                             ; string offset=925
	.local	.Linfo_string55
.Linfo_string55:
	.asciz	"my_color"                      ; string offset=927
	.local	.Linfo_string56
.Linfo_string56:
	.asciz	"Color"                         ; string offset=936
	.local	.Linfo_string57
.Linfo_string57:
	.asciz	"int"                           ; string offset=942
	.local	.Linfo_string58
.Linfo_string58:
	.asciz	"from_square"                   ; string offset=946
	.local	.Linfo_string59
.Linfo_string59:
	.asciz	"to_square"                     ; string offset=958
	.local	.Linfo_string60
.Linfo_string60:
	.asciz	"flags"                         ; string offset=968
	.local	.Linfo_string61
.Linfo_string61:
	.asciz	"Flags"                         ; string offset=974
	.local	.Linfo_string62
.Linfo_string62:
	.asciz	"move_block"                    ; string offset=980
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
	d32	.Linfo_string62
	.section	.debug_addr,"",@progbits
	d32	.Ldebug_addr_end0-.Ldebug_addr_start0 ; Length of contribution
	.local	.Ldebug_addr_start0
.Ldebug_addr_start0:
	dw	5                               ; DWARF version number
	db	3                               ; Address size
	db	0                               ; Segment selector size
	.local	.Laddr_table_base0
.Laddr_table_base0:
	d24	_w_pawn_capture_offsets
	d24	_b_pawn_capture_offsets
	d24	_knight_offsets
	d24	_bishop_offsets
	d24	_rook_offsets
	d24	_king_offsets
	d24	_.str
	d24	_.str.1
	d24	_.str.2
	d24	_.str.3
	d24	.Lfunc_begin0
	d24	.Ltmp7
	d24	.Ltmp10
	d24	.Ltmp15
	d24	.Ltmp18
	d24	.Lfunc_begin1
	d24	.Ltmp25
	d24	.Ltmp36
	d24	.Lfunc_begin2
	d24	.Ltmp55
	d24	.Ltmp59
	d24	.Ltmp62
	d24	.Lfunc_begin3
	d24	.Ltmp76
	d24	.Ltmp77
	d24	.Ltmp87
	d24	.Ltmp88
	d24	.Ltmp98
	d24	.Ltmp99
	d24	.Ltmp109
	d24	.Ltmp110
	d24	.Lfunc_begin4
	d24	.Ltmp122
	d24	.Ltmp123
	d24	.Ltmp133
	d24	.Ltmp134
	d24	.Ltmp144
	d24	.Ltmp145
	d24	.Ltmp155
	d24	.Ltmp156
	d24	.Lfunc_begin5
	d24	.Lfunc_begin6
	d24	.Ltmp169
	d24	.Ltmp173
	d24	.Ltmp176
	d24	.Lfunc_begin7
	d24	.Ltmp191
	d24	.Ltmp207
	d24	.Lfunc_begin8
	d24	.Ltmp224
	d24	.Ltmp228
	d24	.Ltmp231
	d24	.Lfunc_begin9
	d24	.Ltmp242
	d24	.Ltmp251
	d24	.Ltmp260
	d24	.Ltmp269
	d24	.Lfunc_begin10
	d24	.Ltmp280
	d24	.Ltmp289
	d24	.Ltmp298
	d24	.Ltmp307
	d24	.Lfunc_begin11
	d24	.Lfunc_begin12
	d24	.Ltmp320
	d24	.Ltmp324
	d24	.Ltmp327
	d24	.Lfunc_begin13
	.local	.Ldebug_addr_end0
.Ldebug_addr_end0:
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_state
	.extern	__Unwind_SjLj_Unregister
	.extern	_llvm.eh.sjlj.lsda
	.extern	__iand
	.extern	_llvm.stacksave.p0
	.extern	.Lline_table_start0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.frameaddress.p0
	.extern	_llvm.stackrestore.p0
	.extern	_sprintf
	.extern	_llvm.eh.sjlj.callsite
	.extern	__Unwind_SjLj_Register
	.section	.debug_line,"",@progbits
	.local	.Lline_table_start0
.Lline_table_start0:
