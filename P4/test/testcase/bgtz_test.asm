ori $s0, 1
ori $s1, 1
ori $s2, 4
ori $t0, 0xffff
bgtz $t0, label
ori $s2, 0xfedc
label:
sw $s2, 0($0)
ori $s3, 5
ori $s4, 1
ori $s5, 4
