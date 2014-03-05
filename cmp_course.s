.globl cmp_course
.type cmp_course, @function
.text

#AUTHOR - CHAD CAMPBELL

cmp_course:

	# stack setup

	pushl %ebp
	movl %esp, %ebp
	xorl %eax, %eax

	# char a vs c

	movl 8(%ebp), %edx
	movl 20(%ebp), %ecx
	cmpl %edx, %ecx
	jne CMPLESS

	# char b vs d

	movl 12(%ebp), %edx
	movl 24(%ebp), %ecx
	cmpl %edx, %ecx
	jne CMPLESS

	# num1 vs num2

	movw 16(%ebp), %dx
	movw 28(%ebp), %cx
	cmpw %dx, %cx
	jne CMPLESS

	jmp EXIT

# the usual check if greater or less

CMPLESS:
	jg CMPGREATER
	xorl %eax, %eax
	addl $1, %eax
	jmp EXIT

CMPGREATER:
	xorl %eax, %eax
	subl $1, %eax
	jmp EXIT

# stack cleanup

EXIT:
	popl %ebp
	ret
