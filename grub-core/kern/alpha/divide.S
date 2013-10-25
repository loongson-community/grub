
#include <grub/symbol.h>

	.set noat
	
	.macro	PREAMBLE

	subq $30, 31 * 8, $30
	stq  $0, (0 * 8)($30)
	stq  $1, (1 * 8)($30)
	stq  $2, (2 * 8)($30)
	stq  $3, (3 * 8)($30)
	stq  $4, (4 * 8)($30)
	stq  $5, (5 * 8)($30)
	stq  $6, (6 * 8)($30)
	stq  $7, (7 * 8)($30)
	stq  $8, (8 * 8)($30)
	stq  $9, (9 * 8)($30)
	stq  $10, (10 * 8)($30)
	stq  $11, (11 * 8)($30)
	stq  $12, (12 * 8)($30)
	stq  $13, (13 * 8)($30)
	stq  $14, (14 * 8)($30)
	stq  $15, (15 * 8)($30)
	stq  $16, (16 * 8)($30)
	stq  $17, (17 * 8)($30)
	stq  $18, (18 * 8)($30)
	stq  $19, (19 * 8)($30)
	stq  $20, (20 * 8)($30)
	stq  $21, (21 * 8)($30)
	stq  $22, (22 * 8)($30)
	stq  $23, (23 * 8)($30)
	stq  $24, (24 * 8)($30)
	stq  $25, (25 * 8)($30)
	stq  $26, (26 * 8)($30)
	stq  $28, (28 * 8)($30)
	stq  $29, (29 * 8)($30)
	addq $30, (30 * 8), $18
	/* load GP.  */
	br	$27, 1f
1:	ldgp	$29, 0($27)
	.endm

	.macro	POSTAMBLE
	ldq  $0, (0 * 8)($30)
	ldq  $1, (1 * 8)($30)
	ldq  $2, (2 * 8)($30)
	ldq  $3, (3 * 8)($30)
	ldq  $4, (4 * 8)($30)
	ldq  $5, (5 * 8)($30)
	ldq  $6, (6 * 8)($30)
	ldq  $7, (7 * 8)($30)
	ldq  $8, (8 * 8)($30)
	ldq  $9, (9 * 8)($30)
	ldq  $10, (10 * 8)($30)
	ldq  $11, (11 * 8)($30)
	ldq  $12, (12 * 8)($30)
	ldq  $13, (13 * 8)($30)
	ldq  $14, (14 * 8)($30)
	ldq  $15, (15 * 8)($30)
	ldq  $16, (16 * 8)($30)
	ldq  $17, (17 * 8)($30)
	ldq  $18, (18 * 8)($30)
	ldq  $19, (19 * 8)($30)
	ldq  $20, (20 * 8)($30)
	ldq  $21, (21 * 8)($30)
	ldq  $22, (22 * 8)($30)
	ldq  $23, (23 * 8)($30)
	ldq  $24, (24 * 8)($30)
	ldq  $25, (25 * 8)($30)
	ldq  $26, (26 * 8)($30)
	ldq  $28, (28 * 8)($30)
	ldq  $29, (29 * 8)($30)
	addq $30, 31 * 8, $30
	ret $31,($23)
	.endm

FUNCTION (__divqu)
	PREAMBLE
	mov $24, $16
	mov $25, $17
	jsr $26, EXT_C (grub_divmod64)
	mov $0, $27
	POSTAMBLE

FUNCTION (__remqu)
	PREAMBLE
	mov $24, $16
	mov $25, $17
	jsr $26, EXT_C (grub_divmod64)
	ldq $27, (30 * 8)($30)
	POSTAMBLE

FUNCTION (__divlu)
	PREAMBLE
	sll $24, 32, $16
	sra $16, 32, $16
	sll $25, 32, $17
	sra $17, 32, $17
	mov $24, $16
	mov $25, $17	
	jsr $26, EXT_C (grub_divmod64)
	mov $0, $27
	POSTAMBLE

FUNCTION (__remlu)
	PREAMBLE
	sll $24, 32, $16
	sra $16, 32, $16
	sll $25, 32, $17
	sra $17, 32, $17
	jsr $26, EXT_C (grub_divmod64)
	ldq $27, (30 * 8)($30)
	POSTAMBLE
