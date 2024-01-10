ori $s0, $0, 0x1145
ori $s1, $0, 1
ori $s2, $0, 0x1145
ori $s3, $0, 1
loop:
beq $s0, $s2, end
add $s3, $s0, $s1
end:
ori $s0, $0, 0x14
