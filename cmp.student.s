.globl cmp_student
.type cmp_student, @function
.text

cmp_student:
	
	push %ebp
	movl %esp, %ebp
	subl $28, %esp
	movl 12(%ebp), (%esp)
	movl 32(%ebp), 4(%esp)
	xorl %eax, %eax
	call strcmp
	testl %eax, %eax
	jne EXIT
	movl 16(%ebp), %edx
	movl 36(%ebp), %ecx
	cmpl %edx, %ecx
	je EXIT
	setle %al
	movzbl %al, %eax
	leal -1(%eax, %eax), %eax

EXIT:
	pop %ebp
	addl $28, %esp
	ret
	
