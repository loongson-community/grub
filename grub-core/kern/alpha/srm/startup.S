#include <config.h>
#include <grub/symbol.h>
#include <grub/offsets.h>

	.set noreorder
	.globl	_start
	.ent	_start
_start:
	.prologue 0
	/* load GP.  */
	br	$27, 1f
1:	ldgp	$29, 0($27)

	/* Move modules out of the BSS. */
	lda     $1, __bss_start
	lda     $2, _end
	lda     $4, modsize
	ldq     $3, 0($4)
	addq    $3, 7, $3
	sra     $3, 3, $3
	sll     $3, 3, $4
	subq    $4, 8, $4
	addq    $1, $4, $1
	addq    $2, $4, $2

2:
	beq     $3, 3f
	ldq     $4, 0($1)
	stq     $4, 0($2)
	subq    $3, 1, $3
	subq    $1, 8, $1
	subq    $2, 8, $2
	br      2b
3:	

	/* Clean BSS.  */
	lda     $1, __bss_start
	lda     $2, _end
	subq    $2, $1, $2
	sra     $2, 3, $2
2:
	beq     $2, 3f
	stq     $31, 0($1)
	subq    $2, 1, $2
	addq    $1, 8, $1
	br      2b
3:
	/* call main.  */
	lda	$27, EXT_C (grub_main)
	jmp	($27)
	.end _start
	. = _start + GRUB_KERNEL_ALPHA_SRM_TOTAL_MODULE_SIZE
modsize:
	.quad 0
