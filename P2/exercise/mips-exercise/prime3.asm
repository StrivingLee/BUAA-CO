.macro func_start
subu $sp, $sp, 8
sw $ra, 0($sp)
sw $fp, 4($sp)
addu $fp, $sp, 8
.end_macro

.macro func_end
move $sp, $fp
lw $ra, -8($fp)
lw $fp, -4($fp)
jr $ra
.end_macro

.macro proc_end
li $v0, 10
syscall
.end_macro
.data
	.align 2
	prime: .space 4000
.globl start main is_prime_naive is_prime sieve is_prime_sieve
.text

	start:
	jal main
	proc_end
	j spin
	
	
	main:
	func_start
	jal sieve
	xor $s0, $s0, $s0
	main_loop:
	bgt $s0, 30, main_endl
	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	move $a0, $s0
	jal is_prime
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	addu $s0, $s0, 1
	b main_loop
	main_endl:
	func_end
	
	is_prime_naive:
	func_start
	li $v0, 0
	ble $a0, 1, ipn_ret
	li $t0, 2
	ipn_loop:
	bge $t0, $a0, ipn_endl
	rem $t1, $a0, $t0
	bne $t1, 0, ipn_else
	li $v0, 0
	b ipn_ret
	ipn_else:
	ipn_cont:
	addu $t0, $t0, 1
	b ipn_loop
	ipn_endl:
	li $v0, 1
	ipn_ret:
	func_end
	
	is_prime:
	func_start
	li $v0, 0
	ble $a0, 1, ip_ret
	li $v0, 1
	beq $a0, 2, ip_ret
	rem $t1, $a0, 2
	li $v0, 0
	beqz $t1, ip_ret
	mtc1, $a0, $f0
	cvt.d.w $f0, $f0
	sqrt.d $f0, $f0
	floor.w.d $f0, $f0
	mfc1 $t1, $f0 #word?
	li $t0, 3
	ip_loop:
	bgt $t0, $t1, ip_endl
	rem $t2, $a0, $t0
	li $v0, 0
	beqz $t2, ip_ret 
	ip_cont:
	addu $t0, $t0, 2
	b ip_loop
	ip_endl:
	li $v0, 1
	ip_ret:
	func_end
	
	sieve:
	func_start
	sw $zero, prime
	sw $zero, prime + 4
	li $t0, 2
	li $t1, 1000
	s_loop0:
	bgt $t0, $t1, s_endl0
	mulu $t2, $t0, 4
	la $t3, prime
	addu $t2, $t2, $t3
	li $t3, 1
	sw $t3, ($t2)
	s_cont0:
	addu $t0, $t0, 1
	b s_loop0
	s_endl0:
	li $t1, 1000
	mtc1 $t1, $f0
	cvt.d.w $f0, $f0
	sqrt.d $f0, $f0
	floor.w.d $f0, $f0
	mfc1 $t1, $f0
	li $t0, 2
	s_loop1:
	bgt $t0, $t1, s_endl1
	mulu $t2, $t0, 4
	la $t3, prime
	addu $t2, $t2, $t3
	lw $t2, ($t2)
	beqz $t2, s_else
		mulu $t2, $t0, $t0
		li $t3, 1000
		s_loop2:
		bgt $t2, $t3, s_endl2
			mulu $t4, $t2, 4
			la $t5, prime
			addu $t4, $t4, $t5
			sw $zero, ($t4)
		s_cont2:
		addu $t2, $t2, $t0
		b s_loop2
		s_endl2:
	s_else:
	s_cont1:
	addu $t0, $t0, 1
	b s_loop1
	s_endl1:
	func_end
	
	is_prime_sieve:
	func_start
	la $t0, prime
	mulu $t1, $a0, 4
	addu $t0, $t0, $t1
	lw $t0, ($t0)
	beqz $t0, ips_else
	li $v0, 1
	b ips_ret
	ips_else:
	li $v0, 0
	ips_ret:
	func_end
	
	spin:
	j spin