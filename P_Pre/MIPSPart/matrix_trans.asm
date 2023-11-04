.data
a: .space 3000
b: .space 3000
c: .space 3000
space: .asciiz " "
enter: .asciiz "\n"

.text

li $v0, 5
syscall	
move $t0, $v0  # $t0 is n

li $v0, 5
syscall	
move $t1, $v0  # $t1 is m

li $t4, 0

li $t2, 1  # initialize $t2 as i
fori:
	bgt $t2, $t0 endi  # check if n equals i
	li $t3, 1  # initialize $t3 as j
	forj:
		bgt $t3, $t1 endj  # check if m equals j
		li $v0, 5  # read an integer
		syscall
		beq $v0, $0, else  # if is 0, turn to else
		sw $t2 a($t4)
		sw $t3 b($t4)
		sw $v0 c($t4)
		addi $t4, $t4, 4
		else:
		addi $t3, $t3, 1
		j forj
	endj:
	addi $t2, $t2, 1
	j fori
endi:

for:
	beq $t4, $0, end
	addi $t4, $t4, -4
	
	lw $a0, a($t4)
	li $v0, 1
	syscall
	
	la $a0 space
	li $v0, 4
	syscall
	
	lw $a0, b($t4)
	li $v0, 1
	syscall
	
	la $a0 space
	li $v0, 4
	syscall
	
	lw $a0, c($t4)
	li $v0, 1
	syscall
	
	la $a0 enter
	li $v0, 4
	syscall

	j for
end:
li $v0, 10
syscall	
