addi	$1,$0,84
sw		$1,0($0)
addi	$1,$0,64
sw		$1,4($0)
addi	$1,$0,100
sw		$1,8($0)
addi	$1,$0,24
sw		$1,12($0)
addi	$1,$0,28
sw		$1,16($0)
addi	$1,$0,36
sw		$1,20($0)
addi	$1,$0,88
sw		$1,24($0)
addi	$1,$0,4
sw		$1,28($0)
addi	$1,$0,192
sw		$1,32($0)
addi	$1,$0,156
sw		$1,36($0)
addi	$1,$0,76
sw		$1,40($0)
addi	$1,$0,144
sw		$1,44($0)
addi	$1,$0,128
sw		$1,48($0)
addi	$1,$0,80
sw		$1,52($0)
addi	$1,$0,16
sw		$1,56($0)
addi	$1,$0,68
sw		$1,60($0)
addi	$1,$0,116
sw		$1,64($0)
addi	$1,$0,60
sw		$1,68($0)
addi	$1,$0,52
sw		$1,72($0)
addi	$1,$0,40
sw		$1,76($0)
addi	$1,$0,72
sw		$1,80($0)
addi	$1,$0,140
sw		$1,84($0)
addi	$1,$0,196
sw		$1,88($0)
addi	$1,$0,56
sw		$1,92($0)
addi	$1,$0,20
sw		$1,96($0)
addi	$1,$0,200
sw		$1,100($0)
addi	$1,$0,152
sw		$1,104($0)
addi	$1,$0,104
sw		$1,108($0)
addi	$1,$0,96
sw		$1,112($0)
addi	$1,$0,136
sw		$1,116($0)
addi	$1,$0,188
sw		$1,120($0)
addi	$1,$0,132
sw		$1,124($0)
addi	$1,$0,184
sw		$1,128($0)
addi	$1,$0,180
sw		$1,132($0)
addi	$1,$0,12
sw		$1,136($0)
addi	$1,$0,160
sw		$1,140($0)
addi	$1,$0,48
sw		$1,144($0)
addi	$1,$0,172
sw		$1,148($0)
addi	$1,$0,8
sw		$1,152($0)
addi	$1,$0,32
sw		$1,156($0)
addi	$1,$0,108
sw		$1,160($0)
addi	$1,$0,148
sw		$1,164($0)
addi	$1,$0,112
sw		$1,168($0)
addi	$1,$0,120
sw		$1,172($0)
addi	$1,$0,92
sw		$1,176($0)
addi	$1,$0,44
sw		$1,180($0)
addi	$1,$0,124
sw		$1,184($0)
addi	$1,$0,176
sw		$1,188($0)
addi	$1,$0,168
sw		$1,192($0)
addi	$1,$0,164
sw		$1,196($0)

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

addi	$1,$0,0
mfc0	$1,$12
addi	$1,$0,220
mfc0	$1,$13
addi	$1,$0,156
mfc0	$1,$14
mult	$7,$7
lw		$7,-204($7)
lui		$7,7
srl		$7,$7,1
mflo	$1
mfhi	$2
addi	$2,$0,235
multu	$28,$29
lb		$29,-184($29)
lui		$28,5
sra		$28,$28,1
mflo	$1
mfhi	$2
addi	$2,$0,214
mthi	$28
lbu		$30,-188($30)
lui		$28,0
sll		$30,$30,1
mflo	$1
mfhi	$2
addi	$28,$0,66
mtlo	$0
lh		$0,-120($10)
lui		$0,3
srl		$0,$10,2
mflo	$1
mfhi	$2
addi	$1,$0,224
mtc0	$8,$12
lhu		$8,-104($8)
lui		$8,6
lw		$8,29426($8)
mflo	$1
mfhi	$2
addi	$1,$0,84
mfc0	$1,$12
addi	$1,$0,152
mfc0	$1,$13
addi	$1,$0,196
mfc0	$1,$14
div		$1,$29
lb		$29,-168($1)
lui		$29,5
lbu		$1,-44($1)
mflo	$1
mfhi	$2
divu	$29,$2
lh		$29,4($2)
lui		$29,7
lhu		$2,30787($29)
mflo	$1
mfhi	$2
addi	$1,$0,172
mfc0	$1,$12
addi	$1,$0,28
mfc0	$1,$13
addi	$1,$0,176
mfc0	$1,$14
addi	$2,$0,192
mult	$0,$6
lw		$0,100($0)
lui		$0,6
lb		$6,-100($6)
mflo	$1
mfhi	$2
addi	$1,$0,8
addi	$2,$0,93
multu	$9,$9
lbu		$9,-188($9)
lui		$9,3
sb		$9,8778($9)
mflo	$1
mfhi	$2
addi	$1,$0,192
mfc0	$1,$12
addi	$1,$0,132
mfc0	$1,$13
addi	$1,$0,84
mfc0	$1,$14
addi	$2,$0,86
mthi	$3
lh		$29,-184($3)
lui		$29,4
sh		$29,22625($29)
mflo	$1
mfhi	$2
addi	$1,$0,252
mfc0	$1,$12
addi	$1,$0,16
mfc0	$1,$13
addi	$1,$0,40
mfc0	$1,$14
mtlo	$4
lhu		$4,-192($4)
lui		$29,4
sw		$29,25988($29)
mflo	$1
mfhi	$2
addi	$1,$0,52
mfc0	$1,$12
addi	$1,$0,100
mfc0	$1,$13
addi	$1,$0,176
mfc0	$1,$14
mtc0	$8,$12
lw		$8,28107($8)
lui		$8,6
sb		$0,292($0)
mflo	$1
mfhi	$2
addi	$1,$0,48
mfc0	$1,$12
addi	$1,$0,0
mfc0	$1,$13
addi	$1,$0,168
mfc0	$1,$14
div		$10,$10
lb		$10,-252($10)
lui		$10,0
divu	$10,$5
mflo	$1
mfhi	$2
addi	$1,$0,196
addi	$2,$0,182
addi	$10,$0,175
mult	$29,$29
lbu		$29,-168($5)
lui		$29,3
multu	$5,$29
mflo	$1
mfhi	$2
addi	$2,$0,105
mthi	$29
lh		$29,128($6)
lui		$29,5
mtlo	$6
mflo	$1
mfhi	$2
mtc0	$21,$12
lhu		$0,108($0)
lui		$0,3
div		$21,$17
mflo	$1
mfhi	$2
addi	$2,$0,194
divu	$11,$11
lw		$11,-176($11)
lui		$11,7
beq		$11,$11,TAG_0
addiu	$11,$11,1
addiu	$11,$11,1
TAG_0:
mflo	$1
mfhi	$2
addi	$2,$0,64
mult	$7,$29
lb		$7,29751($7)
lui		$29,2
bne		$7,$29,TAG_1
addiu	$7,$29,1
addiu	$29,$7,1
TAG_1:
mflo	$1
mfhi	$2
addi	$1,$0,108
mfc0	$1,$12
addi	$1,$0,96
mfc0	$1,$13
addi	$1,$0,224
mfc0	$1,$14
multu	$8,$8
lbu		$8,14000($29)
lui		$29,4
beq		$29,$29,TAG_2
addiu	$29,$29,1
addiu	$29,$29,1
TAG_2:
mflo	$1
mfhi	$2
addi	$1,$0,188
mfc0	$1,$12
addi	$1,$0,4
mfc0	$1,$13
addi	$1,$0,240
mfc0	$1,$14
mthi	$0
lh		$0,104($0)
lui		$23,7
bne		$0,$1,TAG_3
addiu	$0,$1,1
addiu	$1,$0,1
TAG_3:
mflo	$1
mfhi	$2
addi	$1,$0,65
addi	$2,$0,188
mtlo	$12
lhu		$12,-224($12)
lui		$12,3
beq		$12,$0,TAG_4
addiu	$12,$0,1
addiu	$0,$12,1
TAG_4:
mflo	$1
mfhi	$2
addi	$2,$0,116
mtc0	$9,$13
lw		$9,17400($9)
lui		$29,6
bne		$9,$9,TAG_5
addiu	$9,$9,1
addiu	$9,$9,1
TAG_5:
mflo	$1
mfhi	$2
addi	$1,$0,88
mfc0	$1,$12
addi	$1,$0,8
mfc0	$1,$13
addi	$1,$0,84
mfc0	$1,$14
addi	$2,$0,203
div		$10,$10
lb		$10,8336($29)
lui		$29,2
beq		$10,$29,TAG_6
addiu	$10,$29,1
addiu	$29,$10,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,12
mfc0	$1,$12
addi	$1,$0,136
mfc0	$1,$13
addi	$1,$0,148
mfc0	$1,$14
addi	$2,$0,169
divu	$5,$10
lbu		$0,-136($5)
lui		$0,1
bne		$0,$0,TAG_7
addiu	$0,$0,1
addiu	$0,$0,1
TAG_7:
mflo	$1
mfhi	$2
addi	$1,$0,13
mult	$13,$13
lh		$13,-116($13)
lui		$13,7
bgtz	$13,TAG_8
addiu	$13,$13,1
addiu	$13,$13,1
TAG_8:
mflo	$1
mfhi	$2
addi	$2,$0,184
multu	$11,$11
lhu		$11,11819($29)
lui		$29,5
bgez	$29,TAG_9
addiu	$29,$29,1
addiu	$29,$29,1
TAG_9:
mflo	$1
mfhi	$2
addi	$1,$0,28
mfc0	$1,$12
addi	$1,$0,244
mfc0	$1,$13
addi	$1,$0,188
mfc0	$1,$14
mthi	$12
lw		$12,6351($29)
lui		$29,5
bltz	$29,TAG_10
addiu	$29,$29,1
addiu	$29,$29,1
TAG_10:
mflo	$1
mfhi	$2
addi	$1,$0,188
mfc0	$1,$12
addi	$1,$0,36
mfc0	$1,$13
addi	$1,$0,32
mfc0	$1,$14
mtlo	$0
lb		$0,84($0)
lui		$1,1
blez	$1,TAG_11
addiu	$1,$1,1
addiu	$1,$1,1
TAG_11:
mflo	$1
mfhi	$2
addi	$1,$0,83
mtc0	$14,$13
lbu		$14,-208($14)
lui		$14,3
bgtz	$14,TAG_12
addiu	$14,$14,1
addiu	$14,$14,1
TAG_12:
mflo	$1
mfhi	$2
addi	$1,$0,207
div		$29,$29
lh		$13,1341($29)
lui		$29,7
bgez	$29,TAG_13
addiu	$29,$29,1
addiu	$29,$29,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,208
mfc0	$1,$12
addi	$1,$0,72
mfc0	$1,$13
addi	$1,$0,200
mfc0	$1,$14
addi	$2,$0,214
divu	$29,$29
lhu		$29,22577($29)
lui		$29,0
bltz	$29,TAG_14
addiu	$29,$29,1
addiu	$29,$29,1
TAG_14:
mflo	$1
mfhi	$2
addi	$1,$0,12
mfc0	$1,$12
addi	$1,$0,168
mfc0	$1,$13
addi	$1,$0,148
mfc0	$1,$14
addi	$2,$0,148
mult	$27,$27
lw		$0,-216($27)
lui		$0,3
blez	$0,TAG_15
addiu	$0,$0,1
addiu	$0,$0,1
TAG_15:
mflo	$1
mfhi	$2
addi	$2,$0,52
multu	$31,$31
lb		$31,-120($31)
jal		TAG_16
add		$31,$31,$31
addi	$1,$1,1
TAG_16:
mflo	$1
mfhi	$2
addi	$2,$0,213
mthi	$24
lbu		$24,-28348($31)
jal		TAG_17
addu	$31,$31,$24
addi	$1,$1,1
TAG_17:
mflo	$1
mfhi	$2
mtlo	$31
lh		$31,-14248($31)
jal		TAG_18
and		$31,$31,$25
addi	$1,$1,1
TAG_18:
mflo	$1
mfhi	$2
mtc0	$0,$12
lhu		$31,0($0)
jal		TAG_19
nor		$31,$0,$0
addi	$1,$1,1
TAG_19:
mflo	$1
mfhi	$2
div		$31,$31
lw		$31,105($31)
jal		TAG_20
ori		$31,$31,125
addi	$1,$1,1
TAG_20:
mflo	$1
mfhi	$2
addi	$2,$0,34
divu	$25,$25
lb		$25,-14301($31)
jal		TAG_21
slti	$31,$25,7
addi	$1,$1,1
TAG_21:
mflo	$1
mfhi	$2
addi	$2,$0,151
mult	$31,$26
lbu		$26,-224($26)
jal		TAG_22
sltiu	$26,$31,6
addi	$1,$1,1
TAG_22:
mflo	$1
mfhi	$2
addi	$2,$0,244
addi	$26,$0,205
multu	$31,$0
lh		$31,28($0)
jal		TAG_23
xori	$31,$0,54
addi	$1,$1,1
TAG_23:
mflo	$1
mfhi	$2
addi	$1,$0,109
addi	$2,$0,175
mthi	$31
lhu		$31,14($31)
jal		TAG_24
sra		$31,$31,1
addi	$1,$1,1
TAG_24:
mflo	$1
mfhi	$2
addi	$1,$0,165
mtlo	$26
lw		$26,-7146($31)
jal		TAG_25
sll		$31,$31,2
addi	$1,$1,1
TAG_25:
mflo	$1
mfhi	$2
mtc0	$31,$12
lb		$27,10143($31)
jal		TAG_26
srl		$31,$27,2
addi	$1,$1,1
TAG_26:
mflo	$1
mfhi	$2
addi	$1,$0,252
mfc0	$1,$12
addi	$1,$0,156
mfc0	$1,$13
addi	$1,$0,176
mfc0	$1,$14
div		$0,$31
lbu		$0,44($0)
jal		TAG_27
sra		$0,$0,2
addi	$1,$1,1
TAG_27:
mflo	$1
mfhi	$2
addi	$1,$0,1
addi	$2,$0,227
divu	$31,$31
lh		$31,-14436($31)
jal		TAG_28
lhu		$31,-14572($31)
addi	$1,$1,1
TAG_28:
mflo	$1
mfhi	$2
addi	$2,$0,54
mult	$27,$31
lw		$31,12($31)
jal		TAG_29
lb		$27,-184($27)
addi	$1,$1,1
TAG_29:
mflo	$1
mfhi	$2
addi	$2,$0,154
multu	$28,$31
lbu		$28,-14536($31)
jal		TAG_30
lh		$28,-14604($31)
addi	$1,$1,1
TAG_30:
mflo	$1
mfhi	$2
addi	$2,$0,56
mthi	$0
lhu		$31,84($0)
jal		TAG_31
lw		$0,-14632($31)
addi	$1,$1,1
TAG_31:
mflo	$1
mfhi	$2
addi	$2,$0,67
mtlo	$31
lb		$31,-14580($31)
jal		TAG_32
sh		$31,-14372($31)
addi	$1,$1,1
TAG_32:
mflo	$1
mfhi	$2
addi	$2,$0,91
mtc0	$31,$12
lbu		$28,4($28)
jal		TAG_33
sw		$28,-14344($31)
addi	$1,$1,1
TAG_33:
mflo	$1
mfhi	$2
addi	$2,$0,219
div		$31,$31
lh		$29,26($29)
jal		TAG_34
sb		$31,-14328($31)
addi	$1,$1,1
TAG_34:
mflo	$1
mfhi	$2
addi	$2,$0,197
divu	$0,$27
lhu		$0,-14656($31)
jal		TAG_35
sh		$31,304($0)
addi	$1,$1,1
TAG_35:
mflo	$1
mfhi	$2
addi	$1,$0,149
addi	$2,$0,92
mult	$31,$31
lw		$31,-14732($31)
jal		TAG_36
multu	$31,$31
addi	$1,$1,1
TAG_36:
mflo	$1
mfhi	$2
addi	$2,$0,82
mthi	$31
lb		$29,-14792($31)
jal		TAG_37
mtlo	$29
addi	$1,$1,1
TAG_37:
mflo	$1
mfhi	$2
mtc0	$31,$13
lbu		$31,-156($30)
jal		TAG_38
div		$31,$30
addi	$1,$1,1
TAG_38:
mflo	$1
mfhi	$2
divu	$0,$31
lh		$0,120($0)
jal		TAG_39
mult	$0,$31
addi	$1,$1,1
TAG_39:
mflo	$1
mfhi	$2
addi	$1,$0,244
addi	$2,$0,107
la		$11,TAG_40
multu	$17,$17
lhu		$17,-252($17)
jalr	$17,$11
or		$17,$17,$17
addi	$1,$1,1
TAG_40:
mflo	$1
mfhi	$2
addi	$2,$0,106
la		$11,TAG_41
mthi	$19
lw		$29,-24($29)
jalr	$29,$11
sllv	$19,$29,$19
addi	$1,$1,1
TAG_41:
mflo	$1
mfhi	$2
la		$11,TAG_42
mtlo	$29
lb		$20,-188($20)
jalr	$29,$11
srlv	$20,$29,$20
addi	$1,$1,1
TAG_42:
mflo	$1
mfhi	$2
addi	$20,$0,238
la		$4,TAG_43
mtc0	$0,$13
lbu		$0,128($0)
jalr	$11,$4
srav	$0,$11,$11
addi	$1,$1,1
TAG_43:
mflo	$1
mfhi	$2
la		$4,TAG_44
div		$18,$18
lh		$18,-208($18)
jalr	$18,$4
addi	$18,$18,-194
addi	$1,$1,1
TAG_44:
mflo	$1
mfhi	$2
addi	$2,$0,175
la		$4,TAG_45
divu	$29,$21
lhu		$29,-14960($29)
jalr	$29,$4
addiu	$29,$21,-194
addi	$1,$1,1
TAG_45:
mflo	$1
mfhi	$2
la		$4,TAG_46
mult	$29,$22
lw		$29,10($29)
jalr	$29,$4
andi	$22,$22,253
addi	$1,$1,1
TAG_46:
mflo	$1
mfhi	$2
addi	$2,$0,161
la		$4,TAG_47
multu	$27,$27
lb		$27,60($0)
jalr	$27,$4
ori		$27,$27,136
addi	$1,$1,1
TAG_47:
mflo	$1
mfhi	$2
addi	$2,$0,221
la		$4,TAG_48
mthi	$19
lbu		$19,26150($19)
jalr	$19,$4
sll		$19,$19,1
addi	$1,$1,1
TAG_48:
mflo	$1
mfhi	$2
addi	$1,$0,208
mfc0	$1,$12
addi	$1,$0,108
mfc0	$1,$13
addi	$1,$0,244
mfc0	$1,$14
la		$4,TAG_49
mtlo	$29
lh		$29,28644($23)
jalr	$29,$4
srl		$29,$23,2
addi	$1,$1,1
TAG_49:
mflo	$1
mfhi	$2
addi	$1,$0,76
mfc0	$1,$12
addi	$1,$0,232
mfc0	$1,$13
addi	$1,$0,120
mfc0	$1,$14
la		$4,TAG_50
mtc0	$29,$12
lhu		$24,30245($29)
jalr	$29,$4
sra		$29,$24,2
addi	$1,$1,1
TAG_50:
mflo	$1
mfhi	$2
addi	$1,$0,80
mfc0	$1,$12
addi	$1,$0,196
mfc0	$1,$13
addi	$1,$0,12
mfc0	$1,$14
la		$4,TAG_51
div		$26,$26
lw		$26,52($26)
jalr	$0,$4
sll		$26,$26,1
addi	$1,$1,1
TAG_51:
mflo	$1
mfhi	$2
addi	$2,$0,184
la		$4,TAG_52
divu	$20,$20
lb		$20,-166($20)
jalr	$20,$4
lbu		$20,-15356($20)
addi	$1,$1,1
TAG_52:
mflo	$1
mfhi	$2
addi	$2,$0,227
la		$4,TAG_53
mult	$25,$25
lh		$29,-27($29)
jalr	$29,$4
lhu		$29,-15352($29)
addi	$1,$1,1
TAG_53:
mflo	$1
mfhi	$2
addi	$2,$0,208
la		$4,TAG_54
multu	$29,$26
lw		$29,16($29)
jalr	$29,$4
lb		$29,-15388($29)
addi	$1,$1,1
TAG_54:
mflo	$1
mfhi	$2
addi	$2,$0,80
la		$4,TAG_55
mthi	$30
lbu		$0,104($0)
jalr	$30,$4
lh		$30,152($0)
addi	$1,$1,1
TAG_55:
mflo	$1
mfhi	$2
la		$4,TAG_56
mtlo	$21
lhu		$21,-172($21)
jalr	$21,$4
sw		$21,-15136($21)
addi	$1,$1,1
TAG_56:
mflo	$1
mfhi	$2
la		$4,TAG_57
mtc0	$27,$13
lw		$29,20($29)
jalr	$29,$4
sb		$29,-15192($29)
addi	$1,$1,1
TAG_57:
mflo	$1
mfhi	$2
la		$4,TAG_58
div		$29,$29
lb		$29,-24($28)
jalr	$29,$4
sh		$28,-15232($29)
addi	$1,$1,1
TAG_58:
mflo	$1
mfhi	$2
addi	$2,$0,78
la		$4,TAG_59
divu	$9,$30
lbu		$9,17637($9)
jalr	$0,$4
sw		$0,23095($9)
addi	$1,$1,1
TAG_59:
mflo	$1
mfhi	$2
addi	$1,$0,188
mfc0	$1,$12
addi	$1,$0,124
mfc0	$1,$13
addi	$1,$0,224
mfc0	$1,$14
la		$4,TAG_60
mult	$22,$22
lh		$22,-216($22)
jalr	$22,$4
multu	$22,$22
addi	$1,$1,1
TAG_60:
mflo	$1
mfhi	$2
addi	$2,$0,156
la		$4,TAG_61
mthi	$29
lhu		$29,-15656($29)
jalr	$29,$4
mtlo	$29
addi	$1,$1,1
TAG_61:
mflo	$1
mfhi	$2
la		$4,TAG_62
mtc0	$29,$12
lw		$30,36($30)
jalr	$29,$4
div		$30,$29
addi	$1,$1,1
TAG_62:
mflo	$1
mfhi	$2
addi	$1,$0,17
la		$6,TAG_63
divu	$0,$4
lb		$4,96($0)
jalr	$4,$6
mult	$4,$4
addi	$1,$1,1
TAG_63:
mflo	$1
mfhi	$2
.ktext 0x4180

_entry5:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	eret
	eret
#end