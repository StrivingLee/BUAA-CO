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
	msg1: .asciiz "Order is: "
	msg2: .asciiz "a--"
	msg3: .asciiz "\tb--"
	msg4: .asciiz "\tc--"
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $t0, 'x'
	loop0:
	bgt $t0, 'z', endl0
		li $t1, 'x'
		loop1:
		bgt $t1, 'z', endl1
		beq $t0, $t1, cont1
			li $t2, 'x'
			loop2:
			bgt $t2, 'z', endl2
			sne $t3, $t0, $t2
			sne $t4, $t1, $t2
			and $t3, $t3, $t4
			beqz $t3, cont2
			sne $t3, $t0, 'x'
			sne $t4, $t2, 'x'
			and $t3, $t3, $t4
			sne $t4, $t2, 'z'
			and $t3, $t3, $t4
			beqz $t3, cont2
			li $v0, 4
			la $a0, msg1
			syscall
			li $v0, 4
			la $a0, msg2
			syscall
			li $v0, 11
			move $a0, $t0
			syscall
			li $v0, 4
			la $a0, msg3
			syscall
			li $v0, 11
			move $a0, $t1
			syscall
			li $v0, 4
			la $a0, msg4
			syscall
			li $v0, 11
			move $a0, $t2
			syscall
			cont2:
			addu $t2, $t2, 1
			b loop2
			endl2:
		cont1:
		addu $t1, $t1, 1
		b loop1
		endl1:
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	
	func_end
		
	spin:
	j spin