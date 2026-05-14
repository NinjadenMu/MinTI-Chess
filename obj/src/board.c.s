	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"board.c"
	.section	.bss._state,"aw",@nobits
	.balign	1
	.globl	_state
_state:
	.zero	203

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
