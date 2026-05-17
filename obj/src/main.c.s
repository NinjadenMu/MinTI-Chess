	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"main.c"
	.file	0 "/Users/jaden/dev/calculator/MinTI-Chess" "main.c" md5 0x56f79c3a3cea9ca9ec4f8509d954a618
	.file	1 "src" "main.c"
	.file	2 "/Users/jaden" "CEdev/include/stdint.h"
	.file	3 "src" "types.h"
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
	.local	.Lfunc_begin0
.Lfunc_begin0:
	.loc	1 15 0                          ; src/main.c:15:0
; %bb.0:
	push	ix
	ld	ix, 0
	add	ix, sp
	ld	hl, -6
	add	hl, sp
	ld	sp, hl
	or	a, a
	sbc	hl, hl
	ld	bc, -327680
	ld	de, _.str
	ld	(ix - 3), hl
	.local	.Ltmp0
.Ltmp0:
	.loc	1 17 3 prologue_end             ; src/main.c:17:3
	push	de
	push	bc
	call	_sprintf
	ld	hl, 6
	add	hl, sp
	ld	sp, hl
	.loc	1 18 3                          ; src/main.c:18:3
	call	_reset_board
	.loc	1 19 3                          ; src/main.c:19:3
	ld	hl, _.str.1
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 6
	add	hl, sp
	ld	sp, hl
	.loc	1 20 9                          ; src/main.c:20:9
	ld	hl, _move_pool
	ld	(ix - 6), hl
	.loc	1 21 48                         ; src/main.c:21:48
	ld	hl, (ix - 6)
	.loc	1 21 3 is_stmt 0                ; src/main.c:21:3
	push	hl
	ld	hl, _.str.2
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	1 22 40 is_stmt 1               ; src/main.c:22:40
	ld	hl, (ix - 6)
	.loc	1 22 15 is_stmt 0               ; src/main.c:22:15
	push	hl
	ld	hl, 1
	push	hl
	call	_generate_moves
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	1 22 13                         ; src/main.c:22:13
	ld	(ix - 6), hl
	.loc	1 23 48 is_stmt 1               ; src/main.c:23:48
	ld	hl, (ix - 6)
	.loc	1 23 3 is_stmt 0                ; src/main.c:23:3
	push	hl
	ld	hl, _.str.2
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	1 24 38 is_stmt 1               ; src/main.c:24:38
	ld	hl, (ix - 6)
	.loc	1 24 15 is_stmt 0               ; src/main.c:24:15
	push	hl
	ld	hl, 2
	push	hl
	call	_generate_moves
	ld	iy, 6
	add	iy, sp
	ld	sp, iy
	.loc	1 24 13                         ; src/main.c:24:13
	ld	(ix - 6), hl
	.loc	1 25 48 is_stmt 1               ; src/main.c:25:48
	ld	hl, (ix - 6)
	.loc	1 25 3 is_stmt 0                ; src/main.c:25:3
	push	hl
	ld	hl, _.str.2
	push	hl
	ld	hl, -327680
	push	hl
	call	_sprintf
	ld	hl, 9
	add	hl, sp
	ld	sp, hl
	.loc	1 27 15 is_stmt 1               ; src/main.c:27:15
	ld	hl, (ix - 6)
	.loc	1 27 3 epilogue_begin is_stmt 0 ; src/main.c:27:3
	ld	iy, 6
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
	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"Entered program\n"

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"Board set\n"

	.section	.bss._move_pool,"aw",@nobits
	.balign	1
	.globl	_move_pool
_move_pool:
	.zero	4608

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"move_list: %p\n"

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
	db	27                              ; DW_FORM_addrx
	db	18                              ; DW_AT_high_pc
	db	6                               ; DW_FORM_data4
	db	115                             ; DW_AT_addr_base
	db	23                              ; DW_FORM_sec_offset
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	2                               ; Abbreviation Code
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
	db	6                               ; Abbreviation Code
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
	db	7                               ; Abbreviation Code
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
	db	8                               ; Abbreviation Code
	db	33                              ; DW_TAG_subrange_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	55                              ; DW_AT_count
	db	5                               ; DW_FORM_data2
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	9                               ; Abbreviation Code
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
	db	15                              ; DW_TAG_pointer_type
	db	0                               ; DW_CHILDREN_no
	db	73                              ; DW_AT_type
	db	19                              ; DW_FORM_ref4
	db	0                               ; EOM(1)
	db	0                               ; EOM(2)
	db	13                              ; Abbreviation Code
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
	db	14                              ; Abbreviation Code
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
	db	1                               ; Abbrev [1] 0xc:0xc9 DW_TAG_compile_unit
	db	0                               ; DW_AT_producer
	dw	29                              ; DW_AT_language
	db	1                               ; DW_AT_name
	d32	.Lstr_offsets_base0             ; DW_AT_str_offsets_base
	d32	.Lline_table_start0             ; DW_AT_stmt_list
	db	2                               ; DW_AT_comp_dir
	db	4                               ; DW_AT_low_pc
	d32	.Lfunc_end0-.Lfunc_begin0       ; DW_AT_high_pc
	d32	.Laddr_table_base0              ; DW_AT_addr_base
	db	2                               ; Abbrev [2] 0x23:0xa DW_TAG_variable
	d32	45                              ; DW_AT_type
	db	1                               ; DW_AT_decl_file
	db	17                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	0
	db	3                               ; Abbrev [3] 0x2d:0xc DW_TAG_array_type
	d32	57                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x32:0x6 DW_TAG_subrange_type
	d32	61                              ; DW_AT_type
	db	17                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	5                               ; Abbrev [5] 0x39:0x4 DW_TAG_base_type
	db	3                               ; DW_AT_name
	db	6                               ; DW_AT_encoding
	db	1                               ; DW_AT_byte_size
	db	6                               ; Abbrev [6] 0x3d:0x4 DW_TAG_base_type
	db	4                               ; DW_AT_name
	db	8                               ; DW_AT_byte_size
	db	7                               ; DW_AT_encoding
	db	2                               ; Abbrev [2] 0x41:0xa DW_TAG_variable
	d32	75                              ; DW_AT_type
	db	1                               ; DW_AT_decl_file
	db	19                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	1
	db	3                               ; Abbrev [3] 0x4b:0xc DW_TAG_array_type
	d32	57                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x50:0x6 DW_TAG_subrange_type
	d32	61                              ; DW_AT_type
	db	11                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	2                               ; Abbrev [2] 0x57:0xa DW_TAG_variable
	d32	97                              ; DW_AT_type
	db	1                               ; DW_AT_decl_file
	db	21                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	2
	db	3                               ; Abbrev [3] 0x61:0xc DW_TAG_array_type
	d32	57                              ; DW_AT_type
	db	4                               ; Abbrev [4] 0x66:0x6 DW_TAG_subrange_type
	d32	61                              ; DW_AT_type
	db	15                              ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	7                               ; Abbrev [7] 0x6d:0xb DW_TAG_variable
	db	5                               ; DW_AT_name
	d32	120                             ; DW_AT_type
                                        ; DW_AT_external
	db	1                               ; DW_AT_decl_file
	db	13                              ; DW_AT_decl_line
	db	2                               ; DW_AT_location
	db	161
	db	3
	db	3                               ; Abbrev [3] 0x78:0xd DW_TAG_array_type
	d32	133                             ; DW_AT_type
	db	8                               ; Abbrev [8] 0x7d:0x7 DW_TAG_subrange_type
	d32	61                              ; DW_AT_type
	dw	1536                            ; DW_AT_count
	db	0                               ; End Of Children Mark
	db	9                               ; Abbrev [9] 0x85:0x8 DW_TAG_typedef
	d32	141                             ; DW_AT_type
	db	8                               ; DW_AT_name
	db	3                               ; DW_AT_decl_file
	db	12                              ; DW_AT_decl_line
	db	9                               ; Abbrev [9] 0x8d:0x8 DW_TAG_typedef
	d32	149                             ; DW_AT_type
	db	7                               ; DW_AT_name
	db	2                               ; DW_AT_decl_file
	db	60                              ; DW_AT_decl_line
	db	5                               ; Abbrev [5] 0x95:0x4 DW_TAG_base_type
	db	6                               ; DW_AT_name
	db	7                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	10                              ; Abbrev [10] 0x99:0x12 DW_TAG_enumeration_type
	d32	149                             ; DW_AT_type
	db	3                               ; DW_AT_byte_size
	db	3                               ; DW_AT_decl_file
	db	8                               ; DW_AT_decl_line
	db	11                              ; Abbrev [11] 0xa1:0x3 DW_TAG_enumerator
	db	9                               ; DW_AT_name
	db	0                               ; DW_AT_const_value
	db	11                              ; Abbrev [11] 0xa4:0x3 DW_TAG_enumerator
	db	10                              ; DW_AT_name
	db	1                               ; DW_AT_const_value
	db	11                              ; Abbrev [11] 0xa7:0x3 DW_TAG_enumerator
	db	11                              ; DW_AT_name
	db	2                               ; DW_AT_const_value
	db	0                               ; End Of Children Mark
	db	12                              ; Abbrev [12] 0xab:0x5 DW_TAG_pointer_type
	d32	57                              ; DW_AT_type
	db	5                               ; Abbrev [5] 0xb0:0x4 DW_TAG_base_type
	db	12                              ; DW_AT_name
	db	5                               ; DW_AT_encoding
	db	3                               ; DW_AT_byte_size
	db	13                              ; Abbrev [13] 0xb4:0x1b DW_TAG_subprogram
	db	4                               ; DW_AT_low_pc
	d32	.Lfunc_end0-.Lfunc_begin0       ; DW_AT_high_pc
	db	1                               ; DW_AT_frame_base
	db	84
	db	13                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	15                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	d32	176                             ; DW_AT_type
                                        ; DW_AT_external
	db	14                              ; Abbrev [14] 0xc3:0xb DW_TAG_variable
	db	2                               ; DW_AT_location
	db	145
	db	0
	db	14                              ; DW_AT_name
	db	1                               ; DW_AT_decl_file
	db	20                              ; DW_AT_decl_line
	d32	207                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	db	12                              ; Abbrev [12] 0xcf:0x5 DW_TAG_pointer_type
	d32	133                             ; DW_AT_type
	db	0                               ; End Of Children Mark
	.local	.Ldebug_info_end0
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	d32	64                              ; Length of String Offsets Set
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
	.asciz	"main.c"                        ; string offset=111
	.local	.Linfo_string2
.Linfo_string2:
	.asciz	"/Users/jaden/dev/calculator/MinTI-Chess" ; string offset=118
	.local	.Linfo_string3
.Linfo_string3:
	.asciz	"char"                          ; string offset=158
	.local	.Linfo_string4
.Linfo_string4:
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=163
	.local	.Linfo_string5
.Linfo_string5:
	.asciz	"move_pool"                     ; string offset=183
	.local	.Linfo_string6
.Linfo_string6:
	.asciz	"unsigned int"                  ; string offset=193
	.local	.Linfo_string7
.Linfo_string7:
	.asciz	"uint24_t"                      ; string offset=206
	.local	.Linfo_string8
.Linfo_string8:
	.asciz	"Move"                          ; string offset=215
	.local	.Linfo_string9
.Linfo_string9:
	.asciz	"HASH"                          ; string offset=220
	.local	.Linfo_string10
.Linfo_string10:
	.asciz	"CAPTURES"                      ; string offset=225
	.local	.Linfo_string11
.Linfo_string11:
	.asciz	"QUIETS"                        ; string offset=234
	.local	.Linfo_string12
.Linfo_string12:
	.asciz	"int"                           ; string offset=241
	.local	.Linfo_string13
.Linfo_string13:
	.asciz	"main"                          ; string offset=245
	.local	.Linfo_string14
.Linfo_string14:
	.asciz	"move_list"                     ; string offset=250
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
	.section	.debug_addr,"",@progbits
	d32	.Ldebug_addr_end0-.Ldebug_addr_start0 ; Length of contribution
	.local	.Ldebug_addr_start0
.Ldebug_addr_start0:
	dw	5                               ; DWARF version number
	db	3                               ; Address size
	db	0                               ; Segment selector size
	.local	.Laddr_table_base0
.Laddr_table_base0:
	d24	_.str
	d24	_.str.1
	d24	_.str.2
	d24	_move_pool
	d24	.Lfunc_begin0
	.local	.Ldebug_addr_end0
.Ldebug_addr_end0:
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_reset_board
	.extern	.Lline_table_start0
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_llvm.eh.sjlj.callsite
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_llvm.stacksave.p0
	.extern	_llvm.eh.sjlj.lsda
	.extern	__Unwind_SjLj_Register
	.extern	_llvm.frameaddress.p0
	.extern	__Unwind_SjLj_Unregister
	.extern	_llvm.stackrestore.p0
	.extern	_generate_moves
	.extern	_sprintf
	.section	.debug_line,"",@progbits
	.local	.Lline_table_start0
.Lline_table_start0:
