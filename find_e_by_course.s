.globl find_e_by_course
.type find_e_by_course, @function
.text

.data
	.comm courses,4

#AUTHOR - CHAD CAMPBELL

find_e_by_course:

	# Stack setup

	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	movl %esi, (%esp)

	xorl %eax, %eax

	# Get course list into esi and start loop

	movl courses, %esi
	jmp find_course_loop

find_enrollment_start:

	#move to first enrollment node

	movl 4(%esi), %esi


find_enrollment_loop:
	
	#Pull out student, then student id into ecd

	movl 8(%esi), %ecx
	movl 12(%ecx), %edx
	
	cmpl %edx, 8(%ebp)	
	jne cont_enrollment_loop
	
	#found node!

	movl %esi, 4(%esp)
	movl 4(%esp), %eax
	jmp EXIT
	
# increment enrollment pointer and validate it
	
cont_enrollment_loop:
	movl (%esi), %esi
	cmpl $0, %esi
	je EXIT
	jmp find_enrollment_loop
	
# loop to find the right course

find_course_loop:

	# check first letter

	movb 10(%esi), %cl
	cmpl 12(%ebp), %ecx
	jne cont_course_loop

	# check second letter

	movb 11(%esi), %cl
	cmpl 16(%ebp), %ecx
	jne cont_course_loop

	# check number

	movw 8(%esi), %cx
	cmpw 20(%ebp), %cx
	jne cont_course_loop
	
	cmpl $0, 4(%esi)
	je EXIT
	jmp find_enrollment_start

# increments pointer and checks for null

cont_course_loop:
	xorl %ecx, %ecx
	movl (%esi), %esi
	cmpl $0, %esi
	je EXIT
	jmp find_course_loop

# stack cleanup

EXIT:
	movl (%esp), %esi
	addl $8, %esp
	popl %ebp
	ret

#test method

EXIT_TEST:
	movl $2, %eax
	jmp EXIT
