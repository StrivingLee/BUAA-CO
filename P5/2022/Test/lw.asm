ori $s1, $0, 1
ori $t0, $0, 0x301f
sw $t0, 0($0)
ori $t1, $0, 0xffff
lw $t1, 0($0)
add $ra, $ra, $s1
ori $t2, $0, 2
ori $t2, $0, 1
