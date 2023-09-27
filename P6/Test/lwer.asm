ori $t0, $0, 0x1
ori $t1, $t1, 0x4
sw $t0, 0($0)
lwer $t1, 0($0)
sw $a0, 4($0)