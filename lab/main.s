	.text
	.file	"main.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #64                     // =64
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48                    // =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	adrp	x8, .L.str
	add	x0, x8, :lo12:.L.str
	bl	puts
	mov	x8, #100
	stur	x8, [x29, #-16]
	ldur	x0, [x29, #-16]
	bl	malloc
	str	x0, [sp, #24]
	adrp	x8, stdin
	add	x8, x8, :lo12:stdin
	ldr	x2, [x8]
	add	x0, sp, #24                     // =24
	sub	x1, x29, #16                    // =16
	bl	getline
	ldr	x0, [sp, #24]
	bl	atof
	str	d0, [sp, #16]
	adrp	x8, stdin
	add	x8, x8, :lo12:stdin
	ldr	x2, [x8]
	add	x0, sp, #24                     // =24
	sub	x1, x29, #16                    // =16
	bl	getline
	ldr	x0, [sp, #24]
	bl	atof
	str	d0, [sp, #8]
	ldr	d0, [sp, #16]
	ldr	d1, [sp, #8]
	ldr	d2, [sp, #16]
	ldr	d3, [sp, #8]
	fadd	d2, d2, d3
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	ldr	x0, [sp, #24]
	bl	free
	mov	w0, wzr
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #64                     // =64
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
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
