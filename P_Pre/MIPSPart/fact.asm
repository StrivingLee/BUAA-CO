.data
	str: .asciiz "Input\n"
	
	
.text 
main:
	la   $a0, str
	li   $v0, 4
	syscall
	li   $v0, 5
	syscall # read
	move $s0, $v0
	move $a0, $v0
	jal  fact
	
	move $a0, $v0
	li   $v0, 1
	syscall # print
	li   $v0, 10
	syscall # end
	
fact:
	bne  $a0, 1, work
	li   $v0, 1
	jr   $ra
	
work:
	move $t0, $a0

	sw   $ra, 0($sp)
	subi $sp, $sp, 4
	sw   $t0, 0($sp)
	subi $sp, $sp, 4

	subi $t1, $t0, 1
	move $a0, $t1
	jal  fact

	addi $sp, $sp, 4
	lw   $t0, 0($sp)
	addi $sp, $sp, 4
	lw   $ra, 0($sp)

	mult $t0, $v0
	mflo $v0
	jr   $ra