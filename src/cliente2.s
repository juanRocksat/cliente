	.file	"cliente2.c"
	.text
	.globl	preparaDirecciondelServidor
	.type	preparaDirecciondelServidor, @function
preparaDirecciondelServidor:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$2, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$8080, %edi
	call	htons
	movw	%ax, -30(%rbp)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	preparaDirecciondelServidor, .-preparaDirecciondelServidor
	.section	.rodata
.LC0:
	.string	"error en: "
	.text
	.globl	verificarError
	.type	verificarError, @function
verificarError:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L5
	cmpl	$0, -4(%rbp)
	je	.L6
.L5:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	call	strcat
	movq	%rax, %rdi
	call	perror
	movl	$1, %eax
	jmp	.L4
.L6:
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	verificarError, .-verificarError
	.section	.rodata
.LC1:
	.string	"127.0.0.1"
.LC2:
	.string	"No se pudo conectar"
.LC3:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1040, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$2, -1024(%rbp)
	movl	$.LC1, %edi
	call	inet_addr
	movl	%eax, -1020(%rbp)
	movl	$8080, %edi
	call	htons
	movw	%ax, -1022(%rbp)
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -1028(%rbp)
	leaq	-1024(%rbp), %rcx
	movl	-1028(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect
	testl	%eax, %eax
	je	.L9
	movl	$.LC2, %edi
	call	perror
	movl	$1, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	jmp	.L12
.L9:
	leaq	-1008(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-1008(%rbp), %rsi
	movl	-1028(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send
	jmp	.L9
.L12:
	call	__stack_chk_fail
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
