ori $t0, $0, 0x3018
sw $t0, 0($0)
lw $t1, 0($0)
jr $t1
nop
add $t1, $t1, $t1
ori $t2, $0, 0x1145
