	.file	"cmp.c"
	.text
	.p2align 4,,15
	.globl	cmpS
	.type	cmpS, @function
cmpS:
.LFB22:
	.cfi_startproc
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	%esi, 24(%esp)
	movl	36(%esp), %esi
	.cfi_offset 6, -8
	movl	%ebx, 20(%esp)
	movl	32(%esp), %ebx
	.cfi_offset 3, -12
	movl	(%esi), %eax
	movl	%eax, 4(%esp)
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L2
	movl	4(%ebx), %edx
	cmpl	%edx, 4(%esi)
	je	.L2
	setle	%al
	movzbl	%al, %eax
	leal	-1(%eax,%eax), %eax
.L2:
	movl	20(%esp), %ebx
	movl	24(%esp), %esi
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	.cfi_restore 6
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE22:
	.size	cmpS, .-cmpS
	.p2align 4,,15
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB23:
	.cfi_startproc
	movl	8(%esp), %edx
	xorl	%eax, %eax
	cmpl	%edx, 4(%esp)
	je	.L6
	setge	%al
	movzbl	%al, %eax
	leal	-1(%eax,%eax), %eax
.L6:
	rep
	ret
	.cfi_endproc
.LFE23:
	.size	cmp, .-cmp
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
