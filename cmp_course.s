.globl cmp_course
.type cmp_course, @function
.text

#AUTHOR - CHAD CAMPBELL

# cmp_course
# Compares two courses (given by their two character and number identifiers)
# by the characters then the numbers. Returns a negative if a is less than b,
# 0 if they are equal, and a number >0 if a is greater than b.

# cmp_course( char a, char b, int num1, char c, char d, int num2 )

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
