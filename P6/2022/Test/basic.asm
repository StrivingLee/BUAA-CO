lui $0, 0xffff
ori $t0, $0, 0xabcd
add $t1, $t0, $0
addi $s0, $t1, 0x1234
and $s1, $t1, $s0
or $s2, $s1, $t1
slt $s3, $s2, $s1
slt $s4, $s2, $s1
sltu $s5, $s3, $s4
addi $s6, $s5, 0x1145
andi $s7, $s6, 0x1145
bne $s3, $s4, jump
ori $s3, $s4, 0x1145
addi $s3, $s3, 0x1145
jump:
addi $s0, $0, 0x1145