.macro func_start
subu $sp, $sp, 8
sw $fp, 4($sp)
sw $ra, 0($sp)
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
	msg1: .asciiz "Hello World!\n"
.globl start main hello_world three_hellos
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	jal three_hellos
	func_end
	
	hello_world:
	func_start
	li $v0, 4
	la $a0, msg1
	syscall
	func_end
	
	three_hellos:
	func_start
	xor $t0, $t0, $t0
	loop:
	bge $t0, 3, endl
	subu $sp, $sp, 4
	sw $t0, ($sp)
	jal hello_world
	lw $t0, ($sp)
	addu $sp, $sp, 4
	addu $t0, $t0, 1
	b loop
	endl:
	func_end
	
	spin:
	j spin
