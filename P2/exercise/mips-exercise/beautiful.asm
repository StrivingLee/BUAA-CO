.macro func_start ()
subu $sp, $sp, 8
sw $fp, 4($sp)
sw $ra, 0($sp)
addu $fp, $sp, 8
.end_macro

.macro func_return ()
move $sp, $fp
lw $ra, -8($fp)
lw $fp, -4($fp)
jr $ra
.end_macro

.macro print_str (%label)
li $v0, 4
la $a0, %label
syscall
.end_macro

.data
	msg1: .byte 219,176,176,176,219,'\n',0
	msg2: .byte 176,219,176,219,176,'\n',0
	msg3: .byte 176,176,219,176,176,'\n',0
	msg4: .byte 176,219,176,219,176,'\n',0
	msg5: .byte 219,176,176,176,219,'\n',0
	
.globl start main print
.text
	start:
	jal main
	li $v0, 10
	syscall
	
	main:
	func_start ()
	jal print
	func_return ()
	
	print:
	func_start ()
	print_str (msg1)
	print_str (msg2)
	print_str (msg3)
	print_str (msg4)
	print_str (msg5)
	func_return ()