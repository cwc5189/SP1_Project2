.globl cmp_student
.extern strcmp
.type cmp_student, @function
.text

#AUTHOR - CHAD CAMPBELL

cmp_student:
	
	# set ebp to esp, and move esp back 28
	pushl %ebp
	movl %esp, %ebp
	subl $28, %esp

	# save esi and ebx
	movl %esi, 24(%esp)
	movl %ebx, 20(%esp)

	# put stud1 into esi and stud2 into edx
	movl 8(%ebp), %esi
	movl 12(%ebp), %edx

	# put stud1 str into esp+4 and stud2 str into esp
	movl 8(%esi), %ecx
	movl %ecx, (%esp)
	movl 8(%edx), %ecx
	movl %ecx, 4(%esp)
	
	# call string compare
	call strcmp

	# leave if it was not equal
	testl %eax, %eax
	jne EXIT
	
	# copy over the id numbers
	movl 12(%ebp), %edx
	movl 12(%esi), %ecx
	xorl %eax, %eax	
	
	# compare them and if not equal go to evaluation
	cmpl %ecx, 12(%edx)
	jne CMPGREATER
	jmp EXIT

# check if it is greater otherwise go to less than
CMPGREATER:
	jg CMPLESS
	xorl %eax, %eax
	addl $1, %eax
	jmp EXIT

CMPLESS:
	xorl %eax, %eax
	subl $1, %eax
	jmp EXIT

# stack cleanup
EXIT:
	movl 20(%esp), %ebx
	movl 24(%esp), %esi
	addl $28, %esp
	popl %ebp
	ret
