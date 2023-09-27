.data

.text
	li $v0, 5
	syscall
	
	move $s0, $v0
	li $t0, 4
	li $t1, 100
	li $t2, 400
	rem $t3, $s0, $t0
	rem $t4, $s0, $t1
	rem $t5, $s0, $t2
	beq $t5, $0, isleap
	bne $t3, $0, else
	beq $t4, $0, else
isleap:
	li $a0, 1
	j end
else:
	li $a0, 0
	j end
end:
	li $v0, 1
	syscall
	li $v0, 10
	syscall