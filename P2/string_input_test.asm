.data
	message: .asciiz "Hello,"
	userInput: .space 20 # variable:allow the user to input 20 characters
.text
main:
	li $v0 8
	la $a0 userInput
	li $a1 20 # input max 19 characters
	syscall
	
	li $v0 4
	la $a0 message
	syscall
	
	li $v0 4
	la $a0 userInput
	syscall

	# the end of the programm
	li $v0 10
	syscall