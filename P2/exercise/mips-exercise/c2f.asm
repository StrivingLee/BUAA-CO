.data
	msg1: .asciiz "Convert temperature in Celsius to Fahrenheit\n"
	msg2: .asciiz "Please input temperatrure in Celsius: "
	msg3: .asciiz "\nTemperature in Fahrenheit is "
	.align 2
	mult: .float 1.8 
	addnum:  .float 32
.text
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 6
	syscall
	l.s $f1, mult
	mul.s $f0, $f1, $f0
	l.s $f1, addnum
	add.s $f0, $f0, $f1
	mov.s $f12, $f0
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 2
	syscall
	li $v0, 10
	syscall