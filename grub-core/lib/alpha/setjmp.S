/* Copyright (C) 1992, 1994, 1996, 1997, 2002, 2006, 2013 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <grub/symbol.h>
#include <grub/dl.h>

#define JB_S0  0
#define JB_S1  1
#define JB_S2  2
#define JB_S3  3
#define JB_S4  4
#define JB_S5  5
#define JB_PC  6
#define JB_FP  7
#define JB_SP  8
#define JB_F2  9
#define JB_F3  10
#define JB_F4  11
#define JB_F5  12
#define JB_F6  13
#define JB_F7  14
#define JB_F8  15
#define JB_F9  16

#define v0	$0	/* function return value */

#define t0	$1	/* temporary registers (caller-saved) */
#define t1	$2
#define t2	$3
#define t3	$4
#define t4	$5
#define t5	$6
#define t6	$7
#define t7	$8

#define	s0	$9	/* saved-registers (callee-saved registers) */
#define	s1	$10
#define	s2	$11
#define	s3	$12
#define	s4	$13
#define	s5	$14
#define	s6	$15
#define	fp	s6	/* frame-pointer (s6 in frame-less procedures) */

#define a0	$16	/* argument registers (caller-saved) */
#define a1	$17
#define a2	$18
#define a3	$19
#define a4	$20
#define a5	$21

#define t8	$22	/* more temps (caller-saved) */
#define t9	$23
#define t10	$24
#define t11	$25
#define ra	$26	/* return address register */
#define t12	$27

#define pv	t12	/* procedure-variable register */
#define AT	$at	/* assembler temporary */
#define gp	$29	/* global pointer */
#define sp	$30	/* stack pointer */
#define zero	$31	/* reads as zero, writes are noops */

#define ENTRY(name)				\
  .globl EXT_C(name);				\
  .align 4;					\
  .ent EXT_C(name), 0;				\
  EXT_C(name):					\
  .frame sp, 0, ra


GRUB_MOD_LICENSE "GPLv3+"

	.text

ENTRY(grub_setjmp)
	ldgp	gp, 0(pv)

#ifndef PIC
#define FRAME	16
	subq    sp, FRAME, sp
	.frame  sp, FRAME, ra, 0
	stq     ra, 0(sp)
	.mask   0x04000000, -FRAME
#else
#define FRAME	0
	.frame	sp, FRAME, ra, 0
#endif
#ifdef PROF
	.set noat
	lda	AT, _mcount
	jsr	AT, (AT), _mcount
	.set at
#endif

	.prologue 1
	mov	0, a1

	stq	s0, JB_S0*8(a0)
	stq	s1, JB_S1*8(a0)
	stq	s2, JB_S2*8(a0)
	stq	s3, JB_S3*8(a0)
	stq	s4, JB_S4*8(a0)
	stq	s5, JB_S5*8(a0)
#ifdef PTR_MANGLE
	PTR_MANGLE(t1, ra, t0)
	stq	t1, JB_PC*8(a0)
#else
	stq	ra, JB_PC*8(a0)
#endif
#if defined(PTR_MANGLE) && FRAME == 0
	PTR_MANGLE2(t1, sp, t0)
#else
	addq	sp, FRAME, t1
# ifdef PTR_MANGLE
	PTR_MANGLE2(t1, t1, t0)
# endif
#endif
	stq	t1, JB_SP*8(a0)
#ifdef PTR_MANGLE
	PTR_MANGLE2(t1, fp, t0)
	stq	t1, JB_FP*8(a0)
#else
	stq	fp, JB_FP*8(a0)
#endif
	stt	$f2, JB_F2*8(a0)
	stt	$f3, JB_F3*8(a0)
	stt	$f4, JB_F4*8(a0)
	stt	$f5, JB_F5*8(a0)
	stt	$f6, JB_F6*8(a0)
	stt	$f7, JB_F7*8(a0)
	stt	$f8, JB_F8*8(a0)
	stt	$f9, JB_F9*8(a0)

	mov	0, v0
	ret

.end grub_setjmp

ENTRY(grub_longjmp)
#ifdef PROF
	ldgp    gp, 0(pv)
	.set noat
	lda     AT, _mcount
	jsr     AT, (AT), _mcount
	.set at
	.prologue 1
#else
	.prologue 0
#endif

	mov     a1, v0
	ldq     s0, JB_S0*8(a0)
	ldq     s1, JB_S1*8(a0)
	ldq     s2, JB_S2*8(a0)
	ldq     s3, JB_S3*8(a0)
	ldq     s4, JB_S4*8(a0)
	ldq     s5, JB_S5*8(a0)
	ldq     ra, JB_PC*8(a0)
	ldq     fp, JB_FP*8(a0)
	ldq     t0, JB_SP*8(a0)
	ldt     $f2, JB_F2*8(a0)
	ldt     $f3, JB_F3*8(a0)
	ldt     $f4, JB_F4*8(a0)
	ldt     $f5, JB_F5*8(a0)
	ldt     $f6, JB_F6*8(a0)
	ldt     $f7, JB_F7*8(a0)
	ldt     $f8, JB_F8*8(a0)
	ldt     $f9, JB_F9*8(a0)
#ifdef PTR_DEMANGLE
	PTR_DEMANGLE(ra, t1)
	PTR_DEMANGLE2(t0, t1)
	PTR_DEMANGLE2(fp, t1)
#endif
	cmoveq  v0, 1, v0
	mov     t0, sp
	ret

.end EXT_C(grub_longjmp)
