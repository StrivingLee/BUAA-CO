add $s1, $s2, $s3
sw $s1, 0($0)
add $s1, $s2, $s3
sw $0, 0($s1)
jal label
nop
label:
add $1, $31, $0
jal label1
label1:
add $1, $31, $0
nop
addu $s0, $s1, $s2
subu $s3, $s4, $s5
sw $s0, 0($0)
jal label2
nop
label2:
jr $31
nop
add $31, $1, $2
jr $31 
nop
jal target
nop
target:
beq $31, $0, target2
nop
target2:
add $31, $1, $2