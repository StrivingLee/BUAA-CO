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

.macro read_char(%reg)
li $v0, 12
syscall
move %reg, $v0
.end_macro

.macro print_msg(%msg)
li $v0, 4
la $a0, %msg
syscall
.end_macro

.data
	msg1: .asciiz "Please input the first letter:"
	msg2: .asciiz "\nPlease input the next letter:"
	mon: .asciiz "\nmonday"
	wed: .asciiz "\nwednesdat"
	fri: .asciiz "\nfriday"
	tue: .asciiz "\ntuesday"
	thu: .asciiz "\nthursday"
	sat: .asciiz "\nsaturday"
	sun: .asciiz "\nsunday"
	err: .asciiz "\nerror"
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	print_msg (msg1)
	read_char ($t0)
	beq $t0, 'm', case_m
	beq $t0, 'w', case_w
	beq $t0, 'f', case_f
	beq $t0, 't', case_t
	beq $t0, 's', case_s
	b default	
	case_m:
	print_msg (mon)
	b ends
	case_w:
	print_msg (wed)
	b ends
	case_f:
	print_msg (fri)
	b ends
	case_t:
	print_msg (msg2)
	read_char ($t1)
	bne $t1, 'u', else0
	print_msg (tue)
	b ends
	else0:
	bne $t1, 'h', else1
	print_msg (thu)
	b ends
	else1:
	b default
	case_s:
	print_msg (msg2)
	read_char ($t1)
	bne $t1, 'a', else2
	print_msg (sat)
	b ends
	else2:
	bne $t1, 'u', else3
	print_msg (sun)
	b ends
	else3:
	b default
	default:
	print_msg (err)			
	ends:
	func_end

	spin:
	j spin
