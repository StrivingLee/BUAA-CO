.data
	string: .space 100
	
.text
	li $v0, 5
	syscall # read the number
	move $s0, $v0
	li $t0, 0 # set the for loop counter
	
for_input_loop:
	beq $t0, $s0, for_input_end
	li $v0, 12
	syscall # read a char
	sll $t1, $t0, 2 # offset of byte
	sw $v0, string($t1)
	addi $t0, $t0, 1 # increment
	j for_input_loop
	
for_input_end:
	move $t0, $0 # clean the counter
	addi $s1, $s0, -1
	
for_compare_loop:
	bge $t0, $s1, equal_end
	# check if end
	sll $t2, $t0, 2
	sll $t3, $s1, 2
	lw $t4, string($t2)
	lw $t5, string($t3)
	bne $t4, $t5, not_equal_end
	addi $t0, $t0, 1
	addi $s1, $s1, -1
	j for_compare_loop
	
not_equal_end:
	li $a0, 0
	j end
	
equal_end:
	li $a0, 1
	
end:
	li $v0, 1
	syscall # output the result
	li $v0, 10
	syscall
