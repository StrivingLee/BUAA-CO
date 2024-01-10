lui $a0, 0xfedc
ori $a0, $a0, 0xba98
sw $a0, 0($0)
ori $a1, $0, 0x7654
sw $a1, 4($0)
lb $t0, 0($0)
lb $t1, 1($0)
lb $t2, 2($0)
lb $t3, 3($0)
