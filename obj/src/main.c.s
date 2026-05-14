	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"main.c"
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, 1
	ld	de, _move_pool
	push	de
	push	hl
	call	_generate_moves
	pop	hl
	pop	hl
	ld	hl, _move_pool
	push	hl
	ld	hl, 2
	push	hl
	call	_generate_moves
	pop	de
	pop	de
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_main, .Lfunc_end0-_main
                                        ; -- End function
	.section	.bss._move_pool,"aw",@nobits
	.balign	1
	.globl	_move_pool
_move_pool:
	.zero	6144

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	__Unwind_SjLj_Unregister
	.extern	_llvm.stackrestore.p0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_generate_moves
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.stacksave.p0
	.extern	_llvm.eh.sjlj.lsda
	.extern	_llvm.frameaddress.p0
	.extern	__Unwind_SjLj_Register
