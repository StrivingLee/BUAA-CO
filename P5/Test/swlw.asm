ori $t0, $0, 1
sw $t0, 0($0)
lw $t1, 0($0)
nop
sw $t1, 4($0)
lw $t2, 4($0)
ori $t2, $t2, 3
sw $t2, 8($0)
lw $t3, 8($0)
nop
sw $t3, 12($0)