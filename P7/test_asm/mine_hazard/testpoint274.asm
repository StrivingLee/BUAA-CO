addi	$0,$0,252
addi	$1,$0,252
addi	$2,$0,252
addi	$3,$0,252
addi	$4,$0,252
addi	$5,$0,252
addi	$6,$0,252
addi	$7,$0,252
addi	$8,$0,252
addi	$9,$0,252
addi	$10,$0,252
addi	$11,$0,252
addi	$12,$0,252
addi	$13,$0,252
addi	$14,$0,252
addi	$15,$0,252
addi	$16,$0,252
addi	$17,$0,252
addi	$18,$0,252
addi	$19,$0,252
addi	$20,$0,252
addi	$21,$0,252
addi	$22,$0,252
addi	$23,$0,252
addi	$24,$0,252
addi	$25,$0,252
addi	$26,$0,252
addi	$27,$0,252
addi	$28,$0,252
addi	$29,$0,252
addi	$30,$0,252
addi	$31,$0,252

mult	$17,$17
addu	$17,$17,$17
nop
and		$17,$17,$17
mflo	$1
mfhi	$2
addi	$2,$0,203
multu	$9,$9
nor		$19,$19,$9
nop
or		$19,$9,$9
mflo	$1
mfhi	$2
addi	$2,$0,117
mthi	$20
sllv	$9,$9,$9
nop
srlv	$20,$20,$20
mflo	$1
mfhi	$2
addi	$20,$0,20
mtlo	$17
srav	$0,$0,$17
nop
slt		$0,$17,$0
mflo	$1
mfhi	$2
mtc0	$18,$12
sltu	$18,$18,$18
nop
andi	$18,$18,219
mflo	$1
mfhi	$2
addi	$18,$0,136
div		$21,$9
sub		$9,$21,$21
nop
ori		$9,$9,152
mflo	$1
mfhi	$2
addi	$1,$0,118
divu	$9,$22
subu	$22,$9,$9
nop
slti	$9,$9,6
mflo	$1
mfhi	$2
addi	$1,$0,75
addi	$9,$0,22
addi	$22,$0,162
mult	$0,$0
xor		$29,$0,$0
nop
sltiu	$29,$29,0
mflo	$1
mfhi	$2
addi	$1,$0,182
addi	$2,$0,149
addi	$29,$0,165
multu	$19,$19
add		$19,$19,$19
nop
sll		$19,$19,2
mflo	$1
mfhi	$2
addi	$2,$0,138
mthi	$23
addu	$9,$9,$23
nop
srl		$23,$9,2
mflo	$1
mfhi	$2
mtlo	$24
and		$9,$24,$24
nop
sra		$24,$24,1
mflo	$1
mfhi	$2
mtc0	$30,$12
nor		$0,$0,$30
nop
sll		$0,$30,1
mflo	$1
mfhi	$2
div		$22,$22
or		$22,$22,$22
nop
divu	$22,$22
mflo	$1
mfhi	$2
addi	$2,$0,77
mult	$9,$29
sllv	$29,$29,$9
nop
multu	$29,$29
mflo	$1
mfhi	$2
addi	$1,$0,135
mthi	$9
srlv	$30,$30,$30
nop
mtlo	$9
mflo	$1
mfhi	$2
addi	$30,$0,173
mtc0	$18,$13
srav	$0,$18,$0
nop
div		$0,$20
mflo	$1
mfhi	$2
addi	$1,$0,240
addi	$2,$0,250
divu	$23,$23
slt		$23,$23,$23
nop
beq		$23,$23,TAG_0
addiu	$23,$23,1
addiu	$23,$23,1
TAG_0:
mflo	$1
mfhi	$2
addi	$2,$0,211
mult	$10,$1
sltu	$1,$10,$10
nop
bne		$1,$10,TAG_1
addiu	$1,$10,1
addiu	$10,$1,1
TAG_1:
mflo	$1
mfhi	$2
addi	$2,$0,248
multu	$2,$2
sub		$10,$10,$10
nop
beq		$10,$10,TAG_2
addiu	$10,$10,1
addiu	$10,$10,1
TAG_2:
mflo	$1
mfhi	$2
addi	$2,$0,188
mthi	$15
subu	$0,$0,$15
nop
bne		$0,$15,TAG_3
addiu	$0,$15,1
addiu	$15,$0,1
TAG_3:
mflo	$1
mfhi	$2
mtlo	$24
xor		$24,$24,$24
nop
beq		$24,$1,TAG_4
addiu	$24,$1,1
addiu	$1,$24,1
TAG_4:
mflo	$1
mfhi	$2
mtc0	$3,$12
add		$10,$10,$3
nop
bne		$10,$10,TAG_5
addiu	$10,$10,1
addiu	$10,$10,1
TAG_5:
mflo	$1
mfhi	$2
div		$4,$10
addu	$10,$10,$4
nop
beq		$10,$0,TAG_6
addiu	$10,$0,1
addiu	$0,$10,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,97
divu	$0,$19
and		$9,$0,$0
nop
bne		$9,$0,TAG_7
addiu	$9,$0,1
addiu	$0,$9,1
TAG_7:
mflo	$1
mfhi	$2
addi	$1,$0,14
addi	$2,$0,35
mult	$25,$25
nor		$25,$25,$25
nop
bgtz	$25,TAG_8
addiu	$25,$25,1
addiu	$25,$25,1
TAG_8:
mflo	$1
mfhi	$2
addi	$2,$0,148
multu	$5,$5
or		$10,$10,$5
nop
bgez	$10,TAG_9
addiu	$10,$10,1
addiu	$10,$10,1
TAG_9:
mflo	$1
mfhi	$2
addi	$2,$0,171
mthi	$10
sllv	$6,$10,$6
nop
bltz	$10,TAG_10
addiu	$10,$10,1
addiu	$10,$10,1
TAG_10:
mflo	$1
mfhi	$2
mtlo	$9
srlv	$0,$9,$0
nop
blez	$9,TAG_11
addiu	$9,$9,1
addiu	$9,$9,1
TAG_11:
mflo	$1
mfhi	$2
mtc0	$26,$12
srav	$26,$26,$26
nop
bgtz	$26,TAG_12
addiu	$26,$26,1
addiu	$26,$26,1
TAG_12:
mflo	$1
mfhi	$2
div		$7,$10
slt		$10,$10,$7
nop
bgez	$10,TAG_13
addiu	$10,$10,1
addiu	$10,$10,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,229
divu	$8,$8
sltu	$10,$10,$8
nop
bltz	$10,TAG_14
addiu	$10,$10,1
addiu	$10,$10,1
TAG_14:
mflo	$1
mfhi	$2
addi	$2,$0,66
mult	$0,$0
sub		$24,$24,$0
nop
blez	$0,TAG_15
addiu	$0,$0,1
addiu	$0,$0,1
TAG_15:
mflo	$1
mfhi	$2
addi	$1,$0,134
addi	$2,$0,173
multu	$29,$29
xori	$29,$29,48
subu	$29,$29,$29
xor		$29,$29,$29
mflo	$1
mfhi	$2
addi	$1,$0,65
addi	$29,$0,212
mthi	$13
addi	$10,$10,-244
add		$13,$10,$10
addu	$10,$10,$13
mflo	$1
mfhi	$2
addi	$1,$0,198
mtlo	$10
addiu	$14,$10,-203
and		$10,$14,$14
nor		$14,$14,$10
mflo	$1
mfhi	$2
mtc0	$19,$12
andi	$0,$19,241
or		$19,$0,$19
sllv	$0,$0,$19
mflo	$1
mfhi	$2
div		$30,$30
ori		$30,$30,92
srlv	$30,$30,$30
slti	$30,$30,-1
mflo	$1
mfhi	$2
addi	$2,$0,225
addi	$30,$0,255
divu	$10,$10
sltiu	$10,$15,0
srav	$15,$15,$15
xori	$15,$15,152
mflo	$1
mfhi	$2
addi	$2,$0,178
addi	$10,$0,243
mult	$16,$10
addi	$10,$16,-117
slt		$16,$16,$16
addiu	$10,$16,78
mflo	$1
mfhi	$2
addi	$2,$0,39
addi	$16,$0,158
multu	$9,$0
andi	$9,$9,179
sltu	$0,$9,$9
ori		$0,$9,144
mflo	$1
mfhi	$2
addi	$1,$0,98
addi	$2,$0,223
mthi	$1
slti	$1,$1,-3
sub		$1,$1,$1
srl		$1,$1,2
mflo	$1
mfhi	$2
addi	$1,$0,233
mtlo	$10
sltiu	$17,$10,2
subu	$10,$10,$17
sra		$10,$17,1
mflo	$1
mfhi	$2
addi	$10,$0,113
addi	$17,$0,35
mtc0	$18,$13
xori	$18,$18,194
xor		$10,$18,$18
sll		$10,$18,1
mflo	$1
mfhi	$2
div		$12,$23
addi	$0,$0,-64
add		$12,$0,$0
srl		$0,$12,1
mflo	$1
mfhi	$2
addi	$2,$0,252
addi	$12,$0,233
divu	$4,$4
addiu	$4,$4,57
addu	$4,$4,$4
mult	$4,$4
mflo	$1
mfhi	$2
addi	$2,$0,33
multu	$10,$10
andi	$23,$23,40
and		$10,$10,$10
mthi	$23
mflo	$1
mfhi	$2
addi	$2,$0,209
addi	$23,$0,85
mtlo	$24
ori		$24,$24,189
nor		$10,$24,$24
mtc0	$10,$13
mflo	$1
mfhi	$2
addi	$2,$0,150
div		$0,$27
slti	$0,$0,0
or		$27,$0,$27
divu	$27,$27
mflo	$1
mfhi	$2
addi	$2,$0,39
mult	$5,$5
sltiu	$5,$5,1
sllv	$5,$5,$5
beq		$5,$5,TAG_16
addiu	$5,$5,1
addiu	$5,$5,1
TAG_16:
mflo	$1
mfhi	$2
addi	$2,$0,35
multu	$10,$10
xori	$25,$25,5
srlv	$10,$10,$25
bne		$10,$25,TAG_17
addiu	$10,$25,1
addiu	$25,$10,1
TAG_17:
mflo	$1
mfhi	$2
mthi	$10
addi	$10,$26,-91
srav	$26,$26,$26
beq		$26,$26,TAG_18
addiu	$26,$26,1
addiu	$26,$26,1
TAG_18:
mflo	$1
mfhi	$2
mtlo	$0
addiu	$12,$0,-175
slt		$0,$12,$0
bne		$12,$0,TAG_19
addiu	$12,$0,1
addiu	$0,$12,1
TAG_19:
mflo	$1
mfhi	$2
addi	$1,$0,7
mtc0	$6,$13
andi	$6,$6,43
sltu	$6,$6,$6
beq		$6,$1,TAG_20
addiu	$6,$1,1
addiu	$1,$6,1
TAG_20:
mflo	$1
mfhi	$2
addi	$1,$0,69
div		$27,$27
ori		$27,$27,2
sub		$10,$27,$10
bne		$27,$27,TAG_21
addiu	$27,$27,1
addiu	$27,$27,1
TAG_21:
mflo	$1
mfhi	$2
addi	$2,$0,59
divu	$10,$10
slti	$10,$28,7
subu	$28,$10,$10
beq		$28,$1,TAG_22
addiu	$28,$1,1
addiu	$1,$28,1
TAG_22:
mflo	$1
mfhi	$2
addi	$2,$0,188
addi	$10,$0,224
mult	$0,$30
sltiu	$30,$30,6
xor		$0,$0,$0
bne		$0,$0,TAG_23
addiu	$0,$0,1
addiu	$0,$0,1
TAG_23:
mflo	$1
mfhi	$2
addi	$1,$0,130
addi	$2,$0,17
addi	$30,$0,161
multu	$7,$7
xori	$7,$7,12
add		$7,$7,$7
bgtz	$7,TAG_24
addiu	$7,$7,1
addiu	$7,$7,1
TAG_24:
mflo	$1
mfhi	$2
addi	$2,$0,93
mthi	$29
addi	$10,$29,253
addu	$29,$10,$29
bgez	$10,TAG_25
addiu	$10,$10,1
addiu	$10,$10,1
TAG_25:
mflo	$1
mfhi	$2
mtlo	$30
addiu	$10,$30,-21
and		$30,$10,$10
bltz	$10,TAG_26
addiu	$10,$10,1
addiu	$10,$10,1
TAG_26:
mflo	$1
mfhi	$2
mtc0	$25,$13
andi	$25,$0,10
nor		$0,$0,$0
blez	$0,TAG_27
addiu	$0,$0,1
addiu	$0,$0,1
TAG_27:
mflo	$1
mfhi	$2
addi	$25,$0,182
div		$8,$8
ori		$8,$8,106
or		$8,$8,$8
bgtz	$8,TAG_28
addiu	$8,$8,1
addiu	$8,$8,1
TAG_28:
mflo	$1
mfhi	$2
addi	$2,$0,91
divu	$1,$1
slti	$11,$11,-4
sllv	$1,$11,$11
bgez	$11,TAG_29
addiu	$11,$11,1
addiu	$11,$11,1
TAG_29:
mflo	$1
mfhi	$2
addi	$2,$0,127
mult	$2,$2
sltiu	$11,$2,6
srlv	$2,$11,$2
bltz	$11,TAG_30
addiu	$11,$11,1
addiu	$11,$11,1
TAG_30:
mflo	$1
mfhi	$2
addi	$2,$0,190
multu	$5,$0
xori	$5,$0,208
srav	$0,$0,$5
blez	$0,TAG_31
addiu	$0,$0,1
addiu	$0,$0,1
TAG_31:
mflo	$1
mfhi	$2
addi	$1,$0,92
addi	$2,$0,113
mthi	$11
addi	$11,$11,233
addiu	$11,$11,17
slt		$11,$11,$11
mflo	$1
mfhi	$2
addi	$1,$0,136
addi	$11,$0,53
mtlo	$11
andi	$7,$11,253
ori		$7,$7,235
sltu	$11,$7,$11
mflo	$1
mfhi	$2
addi	$11,$0,85
mtc0	$11,$13
slti	$11,$8,0
sltiu	$11,$11,-5
sub		$8,$8,$11
mflo	$1
mfhi	$2
div		$3,$4
xori	$0,$3,78
addi	$0,$0,-57
subu	$3,$0,$3
mflo	$1
mfhi	$2
addi	$1,$0,223
divu	$12,$12
addiu	$12,$12,-122
andi	$12,$12,158
ori		$12,$12,189
mflo	$1
mfhi	$2
addi	$2,$0,45
mult	$11,$9
slti	$11,$11,-7
sltiu	$11,$9,-6
xori	$11,$9,14
mflo	$1
mfhi	$2
addi	$2,$0,100
multu	$10,$11
addi	$10,$10,1
addiu	$11,$10,72
andi	$11,$10,130
mflo	$1
mfhi	$2
addi	$2,$0,239
mthi	$0
ori		$2,$0,189
slti	$0,$2,-5
sltiu	$2,$0,0
mflo	$1
mfhi	$2
addi	$2,$0,227
mtlo	$13
xori	$13,$13,33
addi	$13,$13,228
sra		$13,$13,1
mflo	$1
mfhi	$2
addi	$2,$0,84
mtc0	$11,$13
addiu	$11,$11,-167
andi	$11,$11,97
sll		$11,$11,2
mflo	$1
mfhi	$2
addi	$2,$0,118
div		$11,$12
ori		$12,$11,142
slti	$11,$11,7
srl		$12,$12,2
mflo	$1
mfhi	$2
addi	$11,$0,190
divu	$19,$17
sltiu	$0,$0,-1
xori	$0,$19,85
sra		$0,$0,1
mflo	$1
mfhi	$2
mult	$16,$16
addi	$16,$16,-155
addiu	$16,$16,-248
multu	$16,$16
mflo	$1
mfhi	$2
mthi	$11
andi	$11,$11,106
ori		$17,$17,218
mtlo	$11
mflo	$1
mfhi	$2
mtc0	$11,$12
slti	$11,$18,-1
sltiu	$11,$18,-6
div		$11,$18
mflo	$1
mfhi	$2
addi	$1,$0,108
divu	$9,$9
xori	$0,$9,67
addi	$9,$9,-211
mult	$0,$9
mflo	$1
mfhi	$2
addi	$1,$0,25
addi	$2,$0,108
multu	$17,$17
addiu	$17,$17,214
andi	$17,$17,243
beq		$17,$17,TAG_32
addiu	$17,$17,1
addiu	$17,$17,1
TAG_32:
mflo	$1
mfhi	$2
addi	$2,$0,143
mthi	$19
ori		$19,$19,180
slti	$19,$19,-1
bne		$19,$11,TAG_33
addiu	$19,$11,1
addiu	$11,$19,1
TAG_33:
mflo	$1
mfhi	$2
mtlo	$20
sltiu	$20,$20,6
xori	$11,$20,174
beq		$11,$11,TAG_34
addiu	$11,$11,1
addiu	$11,$11,1
TAG_34:
mflo	$1
mfhi	$2
addi	$20,$0,142
mtc0	$0,$12
addi	$0,$0,-150
addiu	$0,$19,-232
bne		$0,$19,TAG_35
addiu	$0,$19,1
addiu	$19,$0,1
TAG_35:
mflo	$1
mfhi	$2
div		$18,$18
andi	$18,$18,16
ori		$18,$18,250
beq		$18,$0,TAG_36
addiu	$18,$0,1
addiu	$0,$18,1
TAG_36:
mflo	$1
mfhi	$2
addi	$2,$0,117
divu	$11,$21
slti	$21,$11,5
sltiu	$21,$11,3
bne		$11,$11,TAG_37
addiu	$11,$11,1
addiu	$11,$11,1
TAG_37:
mflo	$1
mfhi	$2
addi	$1,$0,98
addi	$21,$0,105
mult	$11,$22
xori	$22,$22,214
addi	$22,$11,-135
beq		$11,$22,TAG_38
addiu	$11,$22,1
addiu	$22,$11,1
TAG_38:
mflo	$1
mfhi	$2
addi	$2,$0,192
multu	$0,$25
addiu	$25,$25,-43
andi	$25,$25,97
bne		$25,$25,TAG_39
addiu	$25,$25,1
addiu	$25,$25,1
TAG_39:
mflo	$1
mfhi	$2
addi	$1,$0,76
addi	$2,$0,213
mthi	$19
ori		$19,$19,219
slti	$19,$19,1
bgtz	$19,TAG_40
addiu	$19,$19,1
addiu	$19,$19,1
TAG_40:
mflo	$1
mfhi	$2
addi	$1,$0,30
mtlo	$23
sltiu	$11,$23,4
xori	$23,$23,105
bgez	$11,TAG_41
addiu	$11,$11,1
addiu	$11,$11,1
TAG_41:
mflo	$1
mfhi	$2
mtc0	$11,$13
addi	$24,$24,-40
addiu	$24,$24,-243
bltz	$11,TAG_42
addiu	$11,$11,1
addiu	$11,$11,1
TAG_42:
mflo	$1
mfhi	$2
div		$0,$22
andi	$0,$0,55
ori		$22,$22,250
blez	$0,TAG_43
addiu	$0,$0,1
addiu	$0,$0,1
TAG_43:
mflo	$1
mfhi	$2
addi	$1,$0,121
addi	$2,$0,213
divu	$20,$20
slti	$20,$20,4
sltiu	$20,$20,2
bgtz	$20,TAG_44
addiu	$20,$20,1
addiu	$20,$20,1
TAG_44:
mflo	$1
mfhi	$2
addi	$2,$0,177
mult	$11,$11
xori	$25,$11,214
addi	$11,$25,119
bgez	$11,TAG_45
addiu	$11,$11,1
addiu	$11,$11,1
TAG_45:
mflo	$1
mfhi	$2
addi	$2,$0,100
multu	$26,$11
addiu	$26,$11,47
andi	$26,$11,226
bltz	$11,TAG_46
addiu	$11,$11,1
addiu	$11,$11,1
TAG_46:
mflo	$1
mfhi	$2
addi	$2,$0,71
mthi	$8
ori		$8,$0,153
slti	$0,$0,-6
blez	$0,TAG_47
addiu	$0,$0,1
addiu	$0,$0,1
TAG_47:
mflo	$1
mfhi	$2
mtlo	$23
sltiu	$23,$23,4
sll		$23,$23,2
xor		$23,$23,$23
mflo	$1
mfhi	$2
addi	$23,$0,194
mtc0	$1,$13
xori	$1,$1,154
srl		$1,$1,2
add		$12,$1,$1
mflo	$1
mfhi	$2
div		$12,$2
addi	$12,$12,-76
sra		$2,$2,2
addu	$12,$2,$12
mflo	$1
mfhi	$2
addi	$1,$0,235
divu	$0,$29
addiu	$0,$26,233
sll		$26,$26,1
and		$0,$0,$26
mflo	$1
mfhi	$2
addi	$1,$0,54
addi	$2,$0,22
mult	$24,$24
andi	$24,$24,71
srl		$24,$24,2
ori		$24,$24,88
mflo	$1
mfhi	$2
addi	$2,$0,49
multu	$12,$3
slti	$12,$12,0
sra		$12,$3,2
sltiu	$3,$3,-5
mflo	$1
mfhi	$2
mthi	$12
xori	$4,$4,243
sll		$4,$4,1
addi	$4,$4,-232
mflo	$1
mfhi	$2
mtlo	$17
addiu	$17,$17,-160
srl		$17,$17,1
andi	$17,$17,60
mflo	$1
mfhi	$2
mtc0	$25,$12
ori		$25,$25,53
sra		$25,$25,2
sll		$25,$25,1
mflo	$1
mfhi	$2
div		$12,$5
slti	$5,$12,5
srl		$12,$5,1
sra		$12,$12,1
mflo	$1
mfhi	$2
addi	$1,$0,89
addi	$12,$0,37
divu	$12,$6
sltiu	$6,$6,-1
sll		$6,$6,2
srl		$6,$6,1
mflo	$1
mfhi	$2
mult	$1,$1
xori	$1,$1,239
sra		$1,$0,2
sll		$0,$0,2
mflo	$1
mfhi	$2
addi	$2,$0,253
multu	$28,$28
addi	$28,$28,88
srl		$28,$28,2
mthi	$28
mflo	$1
mfhi	$2
mtlo	$11
addiu	$11,$11,78
sra		$12,$11,1
mtc0	$12,$12
mflo	$1
mfhi	$2
div		$12,$12
andi	$12,$12,241
sll		$12,$12,1
divu	$12,$12
mflo	$1
mfhi	$2
.ktext 0x4180

_entry7:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	jr		$k0
	jr		$k0
	jr		$k0
#end