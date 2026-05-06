/* generated from: obj/MINTI.o */
#define HAS_INIT_ARRAY 0
#define HAS_FINI_ARRAY 0
#define HAS_CLOCK 0
#define HAS_ABORT 0
#define HAS_EXIT 0
#define HAS_C99__EXIT 0
#define HAS_RUN_PRGM 0
#define HAS_MAIN_ARGC_ARGV 0
#define HAS_ATEXIT 0
#ifdef __ASSEMBLER__
.macro LIBLOAD_LIBS
	.global __libload_library_FILEIOC
	.type __libload_library_FILEIOC, @object
__libload_library_FILEIOC:
	.db 0xC0, "FILEIOC", 0, 8
	.global _ti_PutC
	.type _ti_PutC, @function
_ti_PutC:
	jp 21
.endm
#endif
#define HAS_LIBLOAD 1
