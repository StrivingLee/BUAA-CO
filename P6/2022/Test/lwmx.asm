ori $t0, $0, 0x5
ori $t1, $t1, 0x4
sw $t0, 0($0)
lwmx $t1, 0($0)
sw $4, 4($0)
sw $5, 8($0)