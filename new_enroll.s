.globl new_enroll
.type new_enroll, @function
.extern malloc
.text

#AUTHOR - CHAD CAMPBELL

new_enroll:
	pushl %ebp
	movl %esp, %ebp
	
	# allocate space
	push $16
	call malloc
	addl $4, %esp

	# pointer to next enrolled student node
	movl $0, (%eax)
	
	# pointer to next enrolled course for this student
	movl $0, 4(%eax)

	# pointer to this student
	movl 8(%ebp), %ecx
	movl %ecx, 8(%eax)

	# pointer to this course
	movl 12(%ebp), %ecx
	movl %ecx, 12(%eax)

# stack cleanup
EXIT:
	popl %ebp
	ret
