ori $t1, $0, 1
ori $t2, $0, 2
sw $t2, 0($0)
sw $t2, 4($t1)
lwie $t3, 0($t2)