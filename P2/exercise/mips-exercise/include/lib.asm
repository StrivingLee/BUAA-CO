.eqv SYS_PSTR 4
.eqv SYS_PCHR 11
.eqv SYS_PINT 1
.eqv SYS_RSTR 8
.eqv SYS_RCHR 12
.eqv SYS_RINT 5

.macro print_msg(%msg)
subu $sp, $sp, 8
sw $v0 0($sp)
sw $a0, 4($sp)
li $v0, SYS_PSTR
la $a0, %msg
syscall
lw $v0, 0($sp)
lw $a0, 4($sp)
addu $sp, $sp, 8
.end_macro

.macro read_int(%reg)
subu $sp, $sp, 4
sw $v0, 0($sp)
li $v0, SYS_RINT
syscall
move %reg, $v0
lw $v0, 0($sp)
addu $sp, $sp, 4
.end_macro

.macro print_int(%reg)
subu $sp, $sp, 8
sw $v0, 0($sp)
sw $a0, 4($sp)
li $v0, SYS_PINT
move $a0, %reg
syscall
lw $v0, 0($sp)
lw $a0, 4($sp)
addu $sp, $sp, 8
.end_macro

.macro print_char(%char)
subu $sp, $sp, 8
sw $v0, 0($sp)
sw $a0, 4($sp)
li $v0, SYS_PCHR
li $a0, %char
syscall
lw $v0, 0($sp)
lw $a0, 4($sp)
addu $sp, $sp, 8
.end_macro
