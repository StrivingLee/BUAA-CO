.macro func_start
subu $sp, $sp, 40
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s3, 12($sp)
sw $s4, 16($sp)
sw $s5, 20($sp)
sw $s6, 24($sp)
sw $s7, 28($sp)
sw $ra, 32($sp)
sw $fp, 36($sp)
addu $fp, $sp, 40
.end_macro

.macro func_end
move $sp, $fp
lw $s0, -40($fp)
lw $s1, -36($fp)
lw $s2, -32($fp)
lw $s3, -28($fp)
lw $s4, -24($fp)
lw $s5, -20($fp)
lw $s6, -16($fp)
lw $s7, -12($fp)
lw $ra, -8($fp)
lw $fp, -4($fp)
jr $ra
.end_macro

.macro proc_end
li $v0, 10
syscall
.end_macro