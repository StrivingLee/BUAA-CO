# binary search
.data
.text
	li $v0,5
	syscall
	move $s0,$v0  # n
	li $t1,1 	#left
	li $t2,256	#right
while:
	add $t3,$t1,$t2
	srl $t3,$t3,1  # mid=(right+left)/2 
	mult $t3,$t3  #square
	mflo $t4
	beq $t4,$s0,end  #success
	nop
if:
	blt $t4,$s0,else1  #left
	nop
	blt $s0,$t4,else2  #right
	
else1:
	addi $t1,$t3,1
	j while
	nop
else2:
	addi $t2,$t3,-1
	j while
	nop

end:
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,10
	syscall