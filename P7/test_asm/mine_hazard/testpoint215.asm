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

lui		$4,6
mult	$4,$18
sra		$4,$4,2
bltz	$4,TAG_0
addiu	$4,$4,1
addiu	$4,$4,1
TAG_0:
mflo	$1
mfhi	$2
addi	$2,$0,102
lui		$0,7
multu	$0,$0
sll		$18,$0,1
blez	$0,TAG_1
addiu	$0,$0,1
addiu	$0,$0,1
TAG_1:
mflo	$1
mfhi	$2
addi	$1,$0,84
addi	$2,$0,46
addi	$18,$0,192
lui		$2,4
mthi	$2
srl		$2,$2,2
bgtz	$2,TAG_2
addiu	$2,$2,1
addiu	$2,$2,1
TAG_2:
mflo	$1
mfhi	$2
addi	$1,$0,96
lui		$4,3
mtlo	$19
sra		$4,$4,2
bgez	$4,TAG_3
addiu	$4,$4,1
addiu	$4,$4,1
TAG_3:
mflo	$1
mfhi	$2
lui		$4,0
mtc0	$4,$12
sll		$4,$4,1
bltz	$4,TAG_4
addiu	$4,$4,1
addiu	$4,$4,1
TAG_4:
mflo	$1
mfhi	$2
lui		$0,2
div		$18,$18
srl		$18,$0,1
blez	$0,TAG_5
addiu	$0,$0,1
addiu	$0,$0,1
TAG_5:
mflo	$1
mfhi	$2
addi	$2,$0,144
addi	$18,$0,40
lui		$17,5
divu	$17,$17
mult	$17,$17
sub		$17,$17,$17
mflo	$1
mfhi	$2
addi	$1,$0,229
addi	$17,$0,238
lui		$5,3
multu	$19,$19
mthi	$19
subu	$5,$19,$19
mflo	$1
mfhi	$2
addi	$5,$0,16
lui		$5,1
mtlo	$20
mtc0	$20,$12
xor		$5,$5,$20
mflo	$1
mfhi	$2
lui		$5,7
div		$0,$5
divu	$0,$9
add		$5,$5,$0
mflo	$1
mfhi	$2
addi	$1,$0,4
addi	$2,$0,40
lui		$18,7
mult	$18,$18
multu	$18,$18
slti	$18,$18,5
mflo	$1
mfhi	$2
addi	$1,$0,89
addi	$18,$0,3
lui		$5,7
mthi	$21
mtlo	$21
sltiu	$21,$5,2
mflo	$1
mfhi	$2
addi	$21,$0,188
lui		$5,3
mtc0	$22,$12
div		$5,$5
xori	$22,$22,158
mflo	$1
mfhi	$2
addi	$2,$0,100
lui		$2,3
divu	$2,$9
mult	$0,$2
addi	$0,$2,99
mflo	$1
mfhi	$2
addi	$1,$0,240
addi	$2,$0,118
lui		$19,5
multu	$19,$19
mthi	$19
sra		$19,$19,1
mflo	$1
mfhi	$2
addi	$1,$0,159
lui		$5,7
mtlo	$5
mtc0	$23,$13
sll		$23,$5,1
mflo	$1
mfhi	$2
lui		$5,5
div		$24,$24
divu	$24,$24
srl		$5,$5,1
mflo	$1
mfhi	$2
addi	$2,$0,241
lui		$0,6
mult	$28,$0
multu	$28,$0
sra		$28,$28,1
mflo	$1
mfhi	$2
addi	$1,$0,41
addi	$2,$0,223
lui		$22,4
mthi	$22
mtlo	$22
mtc0	$22,$13
mflo	$1
mfhi	$2
lui		$5,2
div		$29,$5
divu	$5,$5
mult	$5,$5
mflo	$1
mfhi	$2
addi	$1,$0,139
lui		$5,0
multu	$30,$5
mthi	$30
mtlo	$30
mflo	$1
mfhi	$2
addi	$5,$0,58
lui		$0,1
mtc0	$0,$12
div		$23,$23
divu	$23,$4
mflo	$1
mfhi	$2
addi	$2,$0,50
lui		$23,7
mult	$23,$23
multu	$23,$23
beq		$23,$23,TAG_6
addiu	$23,$23,1
addiu	$23,$23,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,110
lui		$6,3
mthi	$1
mtlo	$1
bne		$1,$0,TAG_7
addiu	$1,$0,1
addiu	$0,$1,1
TAG_7:
mflo	$1
mfhi	$2
lui		$6,1
mtc0	$6,$12
div		$2,$2
beq		$2,$2,TAG_8
addiu	$2,$2,1
addiu	$2,$2,1
TAG_8:
mflo	$1
mfhi	$2
addi	$2,$0,139
lui		$0,6
divu	$21,$21
mult	$0,$21
bne		$21,$0,TAG_9
addiu	$21,$0,1
addiu	$0,$21,1
TAG_9:
mflo	$1
mfhi	$2
addi	$1,$0,148
addi	$2,$0,44
lui		$24,6
multu	$24,$24
mthi	$24
beq		$24,$0,TAG_10
addiu	$24,$0,1
addiu	$0,$24,1
TAG_10:
mflo	$1
mfhi	$2
addi	$1,$0,140
lui		$6,2
mtlo	$6
mtc0	$6,$13
bne		$3,$3,TAG_11
addiu	$3,$3,1
addiu	$3,$3,1
TAG_11:
mflo	$1
mfhi	$2
lui		$6,3
div		$4,$4
divu	$4,$4
beq		$4,$6,TAG_12
addiu	$4,$6,1
addiu	$6,$4,1
TAG_12:
mflo	$1
mfhi	$2
addi	$2,$0,118
lui		$12,5
mult	$12,$0
multu	$12,$0
bne		$0,$0,TAG_13
addiu	$0,$0,1
addiu	$0,$0,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,39
addi	$2,$0,75
lui		$25,6
mthi	$25
mtlo	$25
bgtz	$25,TAG_14
addiu	$25,$25,1
addiu	$25,$25,1
TAG_14:
mflo	$1
mfhi	$2
lui		$6,7
mtc0	$5,$12
div		$6,$5
bgez	$6,TAG_15
addiu	$6,$6,1
addiu	$6,$6,1
TAG_15:
mflo	$1
mfhi	$2
lui		$6,5
divu	$6,$6
mult	$6,$6
bltz	$6,TAG_16
addiu	$6,$6,1
addiu	$6,$6,1
TAG_16:
mflo	$1
mfhi	$2
addi	$1,$0,127
lui		$8,7
multu	$8,$8
mthi	$0
blez	$8,TAG_17
addiu	$8,$8,1
addiu	$8,$8,1
TAG_17:
mflo	$1
mfhi	$2
addi	$1,$0,246
addi	$2,$0,178
lui		$26,6
mtlo	$26
mtc0	$26,$13
bgtz	$26,TAG_18
addiu	$26,$26,1
addiu	$26,$26,1
TAG_18:
mflo	$1
mfhi	$2
addi	$2,$0,80
lui		$6,6
div		$6,$6
divu	$7,$6
bgez	$6,TAG_19
addiu	$6,$6,1
addiu	$6,$6,1
TAG_19:
mflo	$1
mfhi	$2
addi	$1,$0,251
lui		$6,7
mult	$6,$8
multu	$8,$6
bltz	$6,TAG_20
addiu	$6,$6,1
addiu	$6,$6,1
TAG_20:
mflo	$1
mfhi	$2
lui		$5,7
mthi	$0
mtlo	$0
blez	$5,TAG_21
addiu	$5,$5,1
addiu	$5,$5,1
TAG_21:
mflo	$1
mfhi	$2
addi	$1,$0,132
addi	$2,$0,110
lui		$29,2
mtc0	$29,$13
mflo	$29
addu	$29,$29,$29
mflo	$1
mfhi	$2
addi	$1,$0,96
addi	$2,$0,81
addi	$29,$0,5
lui		$6,0
div		$13,$13
mfc0	$6,$12
and		$13,$13,$6
mflo	$1
mfhi	$2
addi	$2,$0,172
lui		$6,5
divu	$6,$6
mfhi	$6
nor		$14,$6,$14
mflo	$1
mfhi	$2
addi	$2,$0,29
addi	$6,$0,175
lui		$14,6
mult	$14,$14
mflo	$14
or		$0,$0,$0
mflo	$1
mfhi	$2
addi	$1,$0,122
addi	$14,$0,211
lui		$30,0
multu	$30,$30
mfc0	$30,$12
addiu	$30,$30,246
mflo	$1
mfhi	$2
addi	$1,$0,217
addi	$2,$0,189
lui		$6,3
mthi	$15
mfhi	$6
andi	$6,$6,113
mflo	$1
mfhi	$2
addi	$1,$0,103
lui		$6,2
mtlo	$6
mflo	$6
ori		$6,$16,223
mflo	$1
mfhi	$2
lui		$8,1
mtc0	$8,$12
mfc0	$8,$12
slti	$0,$0,-3
mflo	$1
mfhi	$2
lui		$1,7
div		$1,$1
mfhi	$1
sll		$1,$1,1
mflo	$1
mfhi	$2
addi	$2,$0,167
lui		$6,7
divu	$6,$17
mflo	$6
srl		$17,$6,1
mflo	$1
mfhi	$2
lui		$6,6
mult	$18,$6
mfc0	$6,$13
sra		$6,$6,1
mflo	$1
mfhi	$2
addi	$2,$0,215
lui		$15,3
multu	$15,$0
mfhi	$15
sll		$15,$0,2
mflo	$1
mfhi	$2
addi	$1,$0,183
addi	$2,$0,75
addi	$15,$0,210
lui		$4,0
mthi	$4
mflo	$4
mtlo	$4
mflo	$1
mfhi	$2
addi	$1,$0,86
addi	$2,$0,119
addi	$4,$0,200
lui		$6,3
mtc0	$6,$13
mfc0	$6,$12
div		$6,$23
mflo	$1
mfhi	$2
addi	$1,$0,102
lui		$6,5
divu	$6,$24
mfhi	$6
mult	$6,$6
mflo	$1
mfhi	$2
addi	$1,$0,206
addi	$2,$0,121
addi	$6,$0,195
lui		$0,5
multu	$26,$26
mflo	$0
mthi	$26
mflo	$1
mfhi	$2
lui		$5,0
mtlo	$5
mfc0	$5,$12
beq		$5,$5,TAG_22
addiu	$5,$5,1
addiu	$5,$5,1
TAG_22:
mflo	$1
mfhi	$2
addi	$1,$0,77
lui		$6,2
mtc0	$6,$12
mfhi	$6
bne		$6,$0,TAG_23
addiu	$6,$0,1
addiu	$0,$6,1
TAG_23:
mflo	$1
mfhi	$2
addi	$1,$0,46
lui		$6,7
div		$26,$6
mflo	$6
beq		$6,$6,TAG_24
addiu	$6,$6,1
addiu	$6,$6,1
TAG_24:
mflo	$1
mfhi	$2
addi	$1,$0,108
lui		$0,3
divu	$27,$27
mfc0	$0,$13
bne		$27,$0,TAG_25
addiu	$27,$0,1
addiu	$0,$27,1
TAG_25:
mflo	$1
mfhi	$2
addi	$2,$0,170
lui		$6,1
mult	$6,$6
mfhi	$6
beq		$6,$0,TAG_26
addiu	$6,$0,1
addiu	$0,$6,1
TAG_26:
mflo	$1
mfhi	$2
addi	$1,$0,45
lui		$6,0
multu	$6,$6
mflo	$6
bne		$27,$27,TAG_27
addiu	$27,$27,1
addiu	$27,$27,1
TAG_27:
mflo	$1
mfhi	$2
addi	$1,$0,176
addi	$2,$0,77
addi	$6,$0,244
lui		$6,7
mthi	$6
mfc0	$6,$13
beq		$6,$0,TAG_28
addiu	$6,$0,1
addiu	$0,$6,1
TAG_28:
mflo	$1
mfhi	$2
addi	$1,$0,100
lui		$0,6
mtlo	$14
mfhi	$0
bne		$14,$14,TAG_29
addiu	$14,$14,1
addiu	$14,$14,1
TAG_29:
mflo	$1
mfhi	$2
lui		$7,7
mtc0	$7,$12
mflo	$7
bgtz	$7,TAG_30
addiu	$7,$7,1
addiu	$7,$7,1
TAG_30:
mflo	$1
mfhi	$2
lui		$6,5
div		$6,$6
mfc0	$6,$13
bgez	$6,TAG_31
addiu	$6,$6,1
addiu	$6,$6,1
TAG_31:
mflo	$1
mfhi	$2
addi	$2,$0,225
lui		$6,2
divu	$6,$30
mfhi	$6
bltz	$6,TAG_32
addiu	$6,$6,1
addiu	$6,$6,1
TAG_32:
mflo	$1
mfhi	$2
lui		$0,7
mult	$0,$0
mflo	$0
blez	$0,TAG_33
addiu	$0,$0,1
addiu	$0,$0,1
TAG_33:
mflo	$1
mfhi	$2
addi	$1,$0,165
addi	$2,$0,2
lui		$8,4
multu	$8,$8
mfc0	$8,$12
bgtz	$8,TAG_34
addiu	$8,$8,1
addiu	$8,$8,1
TAG_34:
mflo	$1
mfhi	$2
addi	$1,$0,21
lui		$7,6
mthi	$7
mfhi	$7
bgez	$7,TAG_35
addiu	$7,$7,1
addiu	$7,$7,1
TAG_35:
mflo	$1
mfhi	$2
addi	$1,$0,149
lui		$7,5
mtlo	$2
mflo	$7
bltz	$7,TAG_36
addiu	$7,$7,1
addiu	$7,$7,1
TAG_36:
mflo	$1
mfhi	$2
lui		$0,6
mtc0	$17,$12
mfc0	$0,$13
blez	$0,TAG_37
addiu	$0,$0,1
addiu	$0,$0,1
TAG_37:
mflo	$1
mfhi	$2
lui		$11,4
div		$11,$11
lui		$11,0
sllv	$11,$11,$11
mflo	$1
mfhi	$2
addi	$2,$0,175
addi	$11,$0,201
lui		$7,4
divu	$7,$7
lui		$7,6
srlv	$7,$7,$7
mflo	$1
mfhi	$2
addi	$2,$0,100
lui		$7,4
mult	$8,$8
lui		$7,7
srav	$8,$8,$7
mflo	$1
mfhi	$2
lui		$0,6
multu	$2,$0
lui		$0,3
slt		$2,$0,$2
mflo	$1
mfhi	$2
addi	$1,$0,160
addi	$2,$0,54
lui		$12,1
mthi	$12
lui		$12,3
sltiu	$12,$12,-6
mflo	$1
mfhi	$2
addi	$1,$0,0
lui		$7,5
mtlo	$9
lui		$7,3
xori	$7,$9,68
mflo	$1
mfhi	$2
lui		$7,4
mtc0	$10,$13
lui		$7,7
addi	$7,$10,-182
mflo	$1
mfhi	$2
lui		$6,5
div		$6,$2
lui		$6,2
addiu	$0,$0,-134
mflo	$1
mfhi	$2
addi	$2,$0,59
lui		$13,4
divu	$13,$13
lui		$13,5
srl		$13,$13,2
mflo	$1
mfhi	$2
addi	$2,$0,215
lui		$7,3
mult	$11,$7
lui		$7,7
sra		$7,$11,2
mflo	$1
mfhi	$2
addi	$2,$0,165
lui		$7,5
multu	$12,$7
lui		$7,0
sll		$12,$12,1
mflo	$1
mfhi	$2
addi	$2,$0,192
addi	$7,$0,233
lui		$0,2
mthi	$0
lui		$0,6
srl		$17,$0,1
mflo	$1
mfhi	$2
addi	$2,$0,31
addi	$17,$0,121
lui		$16,4
mtlo	$16
lui		$16,7
mtc0	$16,$13
mflo	$1
mfhi	$2
addi	$2,$0,140
lui		$7,6
div		$7,$17
lui		$7,7
divu	$7,$7
mflo	$1
mfhi	$2
addi	$2,$0,42
lui		$7,7
mult	$7,$7
lui		$7,2
multu	$18,$7
mflo	$1
mfhi	$2
addi	$2,$0,211
lui		$19,3
mthi	$0
lui		$19,6
mtlo	$0
mflo	$1
mfhi	$2
addi	$1,$0,85
addi	$2,$0,18
lui		$17,1
mtc0	$17,$12
lui		$17,7
beq		$17,$17,TAG_38
addiu	$17,$17,1
addiu	$17,$17,1
TAG_38:
mflo	$1
mfhi	$2
addi	$1,$0,101
addi	$2,$0,96
lui		$7,2
div		$7,$19
lui		$7,0
bne		$7,$19,TAG_39
addiu	$7,$19,1
addiu	$19,$7,1
TAG_39:
mflo	$1
mfhi	$2
addi	$1,$0,228
lui		$7,0
divu	$7,$12
lui		$7,6
beq		$20,$20,TAG_40
addiu	$20,$20,1
addiu	$20,$20,1
TAG_40:
mflo	$1
mfhi	$2
addi	$1,$0,95
addi	$2,$0,169
lui		$10,3
mult	$0,$0
lui		$10,5
bne		$10,$0,TAG_41
addiu	$10,$0,1
addiu	$0,$10,1
TAG_41:
mflo	$1
mfhi	$2
addi	$1,$0,203
addi	$2,$0,239
lui		$18,4
multu	$18,$18
lui		$18,1
beq		$18,$0,TAG_42
addiu	$18,$0,1
addiu	$0,$18,1
TAG_42:
mflo	$1
mfhi	$2
addi	$1,$0,233
lui		$7,4
mthi	$21
lui		$7,4
bne		$21,$21,TAG_43
addiu	$21,$21,1
addiu	$21,$21,1
TAG_43:
mflo	$1
mfhi	$2
addi	$1,$0,204
lui		$7,6
mtlo	$7
lui		$7,4
beq		$22,$0,TAG_44
addiu	$22,$0,1
addiu	$0,$22,1
TAG_44:
mflo	$1
mfhi	$2
lui		$0,1
mtc0	$0,$12
lui		$0,3
bne		$0,$0,TAG_45
addiu	$0,$0,1
addiu	$0,$0,1
TAG_45:
mflo	$1
mfhi	$2
lui		$19,6
div		$19,$19
lui		$19,0
bgtz	$19,TAG_46
addiu	$19,$19,1
addiu	$19,$19,1
TAG_46:
mflo	$1
mfhi	$2
addi	$2,$0,104
lui		$7,2
divu	$7,$7
lui		$7,5
bgez	$7,TAG_47
addiu	$7,$7,1
addiu	$7,$7,1
TAG_47:
mflo	$1
mfhi	$2
addi	$2,$0,1
lui		$7,0
mult	$24,$24
lui		$7,2
bltz	$7,TAG_48
addiu	$7,$7,1
addiu	$7,$7,1
TAG_48:
mflo	$1
mfhi	$2
addi	$2,$0,5
lui		$28,2
multu	$28,$0
lui		$28,1
blez	$28,TAG_49
addiu	$28,$28,1
addiu	$28,$28,1
TAG_49:
mflo	$1
mfhi	$2
addi	$1,$0,102
addi	$2,$0,81
lui		$20,7
mthi	$20
lui		$20,5
bgtz	$20,TAG_50
addiu	$20,$20,1
addiu	$20,$20,1
TAG_50:
mflo	$1
mfhi	$2
addi	$1,$0,180
lui		$7,1
mtlo	$25
lui		$7,1
bgez	$7,TAG_51
addiu	$7,$7,1
addiu	$7,$7,1
TAG_51:
mflo	$1
mfhi	$2
lui		$7,3
mtc0	$7,$12
lui		$7,6
bltz	$7,TAG_52
addiu	$7,$7,1
addiu	$7,$7,1
TAG_52:
mflo	$1
mfhi	$2
lui		$11,0
div		$0,$14
lui		$11,4
blez	$11,TAG_53
addiu	$11,$11,1
addiu	$11,$11,1
TAG_53:
mflo	$1
mfhi	$2
addi	$1,$0,27
addi	$2,$0,93
lui		$31,2
divu	$31,$31
jal		TAG_54
sltu	$31,$31,$31
addi	$1,$1,1
TAG_54:
mflo	$1
mfhi	$2
addi	$2,$0,53
addi	$31,$0,175
lui		$31,2
mult	$13,$13
jal		TAG_55
sub		$31,$31,$13
addi	$1,$1,1
TAG_55:
mflo	$1
mfhi	$2
lui		$14,6
multu	$14,$31
jal		TAG_56
subu	$14,$31,$14
addi	$1,$1,1
TAG_56:
mflo	$1
mfhi	$2
lui		$0,4
mthi	$31
jal		TAG_57
xor		$31,$31,$0
addi	$1,$1,1
TAG_57:
mflo	$1
mfhi	$2
lui		$31,7
mtlo	$31
jal		TAG_58
andi	$31,$31,249
addi	$1,$1,1
TAG_58:
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