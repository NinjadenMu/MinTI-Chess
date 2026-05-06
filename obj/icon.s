	.assume adl=1

	.section .header.icon

	.local ___icon
___icon_jump:
	jp	__start
	.db	$02

	.global ___description
___description:
	.db	"MinTI-Chess is a strong chess engine written for the TI-84 Plus CE", 0
	.extern __start
