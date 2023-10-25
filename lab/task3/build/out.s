	.text
	.file	"main.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80                     // =80
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	add	x29, sp, #48                    // =48
	.cfi_def_cfa w29, 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset b8, -24
	.cfi_offset b9, -32
	adrp	x8, .L.str
	add	x0, x8, :lo12:.L.str
	stur	wzr, [x29, #-4]
	bl	puts
	mov	x8, #100
	stur	x8, [x29, #-16]
	ldur	x0, [x29, #-16]
	bl	malloc
	adrp	x8, stdin
	add	x8, x8, :lo12:stdin
	str	x0, [sp, #24]
	ldr	x2, [x8]
	add	x0, sp, #24                     // =24
	sub	x1, x29, #16                    // =16
	bl	getline
	ldr	x0, [sp, #24]
	bl	atof
	adrp	x8, stdin
	add	x8, x8, :lo12:stdin
	str	d0, [sp, #16]
	ldr	x2, [x8]
	add	x0, sp, #24                     // =24
	sub	x1, x29, #16                    // =16
	bl	getline
	ldr	x0, [sp, #24]
	bl	atof
	str	d0, [sp, #8]
	ldr	d8, [sp, #16]
	ldr	d9, [sp, #8]
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #8]
	bl	check_add
	mov	v2.16b, v0.16b
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	mov	v0.16b, v8.16b
	mov	v1.16b, v9.16b
	bl	printf
	ldr	x0, [sp, #24]
	bl	free
	mov	w0, wzr
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	add	sp, sp, #80                     // =80
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.globl	check_add                       // -- Begin function check_add
	.p2align	2
	.type	check_add,@function
check_add:                              // @check_add
	.cfi_startproc
// %bb.0:                               // %entry
	mov	x8, #4636737291354636288
	fadd	d0, d0, d1
	fmov	d1, x8
	fcmp	d0, d1
	b.le	.LBB1_2
// %bb.1:                               // %bigger
	mov	x8, #4636737291354636288
	fmov	d1, x8
	b	fmod
.LBB1_2:                                // %smaller
	ret
.Lfunc_end1:
	.size	check_add, .Lfunc_end1-check_add
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"plz input two numbers"
	.size	.L.str, 22

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"%.2f + %.2f = %.2f \n"
	.size	.L.str.1, 21

	.ident	"Debian clang version 13.0.1-6"
	.section	".note.GNU-stack","",@progbits
