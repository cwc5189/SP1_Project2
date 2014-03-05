.globl new_course
.type new_course, @function
.extern malloc
.text

#AUTHOR - CHAD CAMPBELL

new_course:
	# stack setup

	pushl %ebp
	movl %esp, %ebp
	
	push $16
	call malloc
	addl $4, %esp

	# pointer to following
	movl $0, (%eax)

	#pointer to first enrollment
	movl $0, 4(%eax)

	# char 1
	movl 8(%ebp), %ecx
	movb %cl, 10(%eax)

	# char 2
	movl 12(%ebp), %ecx
	movb %cl, 11(%eax)

	# number id
	movl 16(%ebp), %ecx
	movw %cx, 8(%eax)

	# max enrollment
	movl 20(%ebp), %ecx
	movb %cl, 12(%eax)

	# cur enrollment
	movb $0, 13(%eax)

# stack clenaup

EXIT:
	popl %ebp
	ret

