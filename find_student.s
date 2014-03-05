.globl find_student
.type find_student, @function
.text

.data
	.comm students,4

#AUTHOR - CHAD CAMPBELL

find_student:
	# stack setup

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	xorl %eax, %eax

	# get student array

	movl students, %ecx
	
	# null list check
	cmpl $0, %ecx
	je EXIT	
	
	jmp find_student_loop
	
find_student_loop:
	# get student ID from current pointer pos
	# and the ID given as a param

	movl 12(%ecx), %edx
	cmpl 8(%ebp), %edx

	# if not equal continue the loop

	jne cont_find_student_loop

	# must be equal so return this student's pointer
	movl %ecx, (%esp)
	movl (%esp), %eax	
	jmp EXIT
	
# continuing step for loop

cont_find_student_loop:
	movl (%ecx), %ecx
	cmpl $0, %ecx
	je EXIT	
	jmp find_student_loop

# stack cleanup

EXIT:
	addl $4, %esp
	popl %ebp
	ret
	
