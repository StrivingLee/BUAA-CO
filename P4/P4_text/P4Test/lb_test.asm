lui $a0, 0xfedc
ori $a0, $a0, 0xba98
sw $a0, 0($0)
lui $a1, 0x7654
ori $a1, $a1, 0x3210
sw $a1, 4($0)
lb $t0, 0($0)
lb $t1, 1($0)
lb $t2, 2($0)
lb $t3, 3($0)
lb $t4, 4($0)
lb $t5, 5($0)
lb $t6, 6($0)
lb $t7, 7($0)
