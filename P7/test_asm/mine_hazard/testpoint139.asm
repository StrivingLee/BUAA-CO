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

lui		$13,1
mflo	$13
mfc0	$13,$12
sw		$13,116($15)
mflo	$1
mfhi	$2
addi	$1,$0,72
addi	$2,$0,115
addi	$13,$0,247
lui		$13,4
mfhi	$13
mflo	$13
sb		$13,392($13)
mflo	$1
mfhi	$2
addi	$1,$0,23
addi	$2,$0,98
addi	$13,$0,12
lui		$0,7
mfc0	$0,$12
mfhi	$0
sh		$28,460($0)
mflo	$1
mfhi	$2
addi	$1,$0,120
addi	$2,$0,107
lui		$26,5
mflo	$26
lui		$26,4
lhu		$26,14569($26)
mflo	$1
mfhi	$2
addi	$1,$0,36
mfc0	$1,$12
addi	$1,$0,88
mfc0	$1,$13
addi	$1,$0,92
mfc0	$1,$14
addi	$2,$0,202
lui		$14,4
mfc0	$14,$13
lui		$14,4
lw		$14,-136($7)
mflo	$1
mfhi	$2
addi	$1,$0,172
addi	$2,$0,206
lui		$14,1
mfhi	$14
lui		$14,0
lb		$14,-248($8)
mflo	$1
mfhi	$2
addi	$1,$0,189
addi	$2,$0,241
lui		$29,6
mflo	$29
lui		$29,0
lbu		$29,12($29)
mflo	$1
mfhi	$2
addi	$1,$0,80
addi	$2,$0,35
lui		$27,4
mfc0	$27,$13
lui		$27,4
sw		$27,1133($27)
mflo	$1
mfhi	$2
addi	$1,$0,160
mfc0	$1,$12
addi	$1,$0,128
mfc0	$1,$13
addi	$1,$0,204
mfc0	$1,$14
addi	$2,$0,52
lui		$14,6
mfhi	$14
lui		$14,0
sb		$14,312($14)
mflo	$1
mfhi	$2
addi	$1,$0,153
addi	$2,$0,138
addi	$14,$0,218
lui		$14,3
mflo	$14
lui		$14,0
sh		$14,108($10)
mflo	$1
mfhi	$2
addi	$1,$0,151
addi	$2,$0,145
addi	$14,$0,174
lui		$28,0
mfc0	$28,$13
lui		$28,6
sw		$0,456($0)
mflo	$1
mfhi	$2
addi	$1,$0,63
addi	$2,$0,232
lui		$31,5
mfhi	$31
jal		TAG_0
lh		$31,-13124($31)
addi	$1,$1,1
TAG_0:
mflo	$1
mfhi	$2
addi	$1,$0,222
addi	$2,$0,61
lui		$31,7
mflo	$31
jal		TAG_1
lhu		$22,-13272($31)
addi	$1,$1,1
TAG_1:
mflo	$1
mfhi	$2
addi	$1,$0,0
addi	$2,$0,223
lui		$23,5
mfc0	$23,$13
jal		TAG_2
lw		$31,-124($23)
addi	$1,$1,1
TAG_2:
mflo	$1
mfhi	$2
addi	$1,$0,193
addi	$2,$0,198
lui		$0,1
mfhi	$0
jal		TAG_3
lb		$0,68($0)
addi	$1,$1,1
TAG_3:
mflo	$1
mfhi	$2
addi	$1,$0,65
addi	$2,$0,15
lui		$31,6
mflo	$31
jal		TAG_4
sb		$31,-13088($31)
addi	$1,$1,1
TAG_4:
mflo	$1
mfhi	$2
addi	$1,$0,90
addi	$2,$0,183
lui		$31,4
mfc0	$31,$12
jal		TAG_5
sh		$23,240($23)
addi	$1,$1,1
TAG_5:
mflo	$1
mfhi	$2
addi	$1,$0,14
addi	$2,$0,9
lui		$24,1
mfhi	$24
jal		TAG_6
sw		$31,304($24)
addi	$1,$1,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,67
addi	$2,$0,70
addi	$24,$0,71
lui		$0,4
mflo	$0
jal		TAG_7
sb		$0,-13116($31)
addi	$1,$1,1
TAG_7:
mflo	$1
mfhi	$2
addi	$1,$0,25
addi	$2,$0,10
la		$14,TAG_8
lui		$8,6
mfc0	$8,$12
jalr	$8,$14
lbu		$8,-13512($8)
addi	$1,$1,1
TAG_8:
mflo	$1
mfhi	$2
addi	$1,$0,222
addi	$2,$0,18
la		$14,TAG_9
lui		$15,0
mfhi	$15
jalr	$15,$14
lh		$15,-110($1)
addi	$1,$1,1
TAG_9:
mflo	$1
mfhi	$2
addi	$1,$0,246
addi	$2,$0,61
la		$14,TAG_10
lui		$15,3
mflo	$15
jalr	$15,$14
lhu		$2,-13584($15)
addi	$1,$1,1
TAG_10:
mflo	$1
mfhi	$2
addi	$1,$0,221
addi	$2,$0,131
la		$14,TAG_11
lui		$0,2
mfc0	$0,$12
jalr	$0,$14
lw		$0,-24($29)
addi	$1,$1,1
TAG_11:
mflo	$1
mfhi	$2
addi	$1,$0,117
addi	$2,$0,2
la		$14,TAG_12
lui		$9,7
mfhi	$9
jalr	$9,$14
sh		$9,-13256($9)
addi	$1,$1,1
TAG_12:
mflo	$1
mfhi	$2
addi	$1,$0,153
addi	$2,$0,192
la		$14,TAG_13
lui		$15,3
mflo	$15
jalr	$15,$14
sw		$3,212($3)
addi	$1,$1,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,90
addi	$2,$0,215
la		$14,TAG_14
lui		$15,7
mfc0	$15,$13
jalr	$15,$14
sb		$4,136($4)
addi	$1,$1,1
TAG_14:
mflo	$1
mfhi	$2
addi	$1,$0,6
addi	$2,$0,69
la		$14,TAG_15
lui		$18,1
mfhi	$18
jalr	$18,$14
sh		$0,308($0)
addi	$1,$1,1
TAG_15:
mflo	$1
mfhi	$2
addi	$1,$0,103
addi	$2,$0,127
lui		$14,6
mflo	$14
nop
lb		$14,100($14)
mflo	$1
mfhi	$2
addi	$1,$0,28
addi	$2,$0,140
lui		$15,0
mfc0	$15,$12
nop
lbu		$13,-140($15)
mflo	$1
mfhi	$2
addi	$1,$0,184
addi	$2,$0,55
lui		$15,0
mfhi	$15
nop
lh		$15,120($15)
mflo	$1
mfhi	$2
addi	$1,$0,202
addi	$2,$0,203
lui		$5,4
mflo	$5
nop
lhu		$0,40($5)
mflo	$1
mfhi	$2
addi	$1,$0,116
addi	$2,$0,22
addi	$5,$0,141
lui		$15,3
mfc0	$15,$12
nop
sw		$15,256($15)
mflo	$1
mfhi	$2
addi	$1,$0,201
addi	$2,$0,134
lui		$15,4
mfhi	$15
nop
sb		$15,316($15)
mflo	$1
mfhi	$2
addi	$1,$0,18
addi	$2,$0,252
addi	$15,$0,8
lui		$15,1
mflo	$15
nop
sh		$15,380($15)
mflo	$1
mfhi	$2
addi	$1,$0,242
addi	$2,$0,12
addi	$15,$0,76
lui		$20,4
mfc0	$20,$13
nop
sw		$0,388($0)
mflo	$1
mfhi	$2
addi	$1,$0,229
addi	$2,$0,70
lui		$26,1
lui		$26,2
xor		$26,$26,$26
lw		$26,52($26)
lui		$16,1
lui		$16,2
add		$7,$16,$16
lb		$7,27902($16)
addi	$1,$0,180
mfc0	$1,$12
addi	$1,$0,104
mfc0	$1,$13
addi	$1,$0,96
mfc0	$1,$14
lui		$16,6
lui		$16,4
addu	$8,$16,$8
lbu		$16,12018($16)
addi	$1,$0,212
mfc0	$1,$12
addi	$1,$0,168
mfc0	$1,$13
addi	$1,$0,244
mfc0	$1,$14
lui		$23,6
lui		$23,5
and		$0,$23,$0
lh		$23,52($0)
lui		$27,3
lui		$27,7
nor		$27,$27,$27
sb		$27,19572($27)
addi	$1,$0,88
mfc0	$1,$12
addi	$1,$0,188
mfc0	$1,$13
addi	$1,$0,104
mfc0	$1,$14
lui		$16,6
lui		$16,3
or		$9,$9,$9
sh		$16,5485($16)
addi	$1,$0,108
mfc0	$1,$12
addi	$1,$0,152
mfc0	$1,$13
addi	$1,$0,196
mfc0	$1,$14
lui		$16,4
lui		$16,3
sllv	$10,$10,$16
sw		$10,14793($16)
addi	$1,$0,52
mfc0	$1,$12
addi	$1,$0,64
mfc0	$1,$13
addi	$1,$0,36
mfc0	$1,$14
lui		$0,2
lui		$0,6
srlv	$11,$0,$0
sb		$11,312($0)
addi	$11,$0,96
lui		$8,4
lui		$8,2
andi	$8,$8,52
lhu		$8,68($8)
lui		$17,3
lui		$17,1
ori		$17,$1,138
lw		$17,-20($1)
lui		$17,6
lui		$17,0
slti	$2,$17,-4
lb		$2,128($17)
addi	$17,$0,182
lui		$4,6
lui		$4,0
sltiu	$4,$0,0
lbu		$0,100($0)
addi	$4,$0,201
lui		$9,1
lui		$9,3
xori	$9,$9,223
sh		$9,18803($9)
addi	$1,$0,176
mfc0	$1,$12
addi	$1,$0,56
mfc0	$1,$13
addi	$1,$0,216
mfc0	$1,$14
lui		$17,7
lui		$17,7
addi	$3,$3,-147
sw		$17,1145($17)
addi	$1,$0,76
mfc0	$1,$12
addi	$1,$0,160
mfc0	$1,$13
addi	$1,$0,180
mfc0	$1,$14
lui		$17,5
lui		$17,1
addiu	$4,$4,69
sb		$4,82($4)
lui		$0,1
lui		$0,4
andi	$21,$21,69
sh		$0,312($21)
lui		$20,4
lui		$20,6
sra		$20,$20,1
lh		$20,11923($20)
addi	$1,$0,208
mfc0	$1,$12
addi	$1,$0,156
mfc0	$1,$13
addi	$1,$0,228
mfc0	$1,$14
lui		$17,2
lui		$17,6
sll		$25,$17,1
lhu		$17,8066($17)
addi	$1,$0,60
mfc0	$1,$12
addi	$1,$0,108
mfc0	$1,$13
addi	$1,$0,64
mfc0	$1,$14
lui		$17,2
lui		$17,5
srl		$17,$26,2
lw		$26,44($26)
lui		$28,3
lui		$28,0
sra		$0,$28,1
lb		$28,0($0)
lui		$21,3
lui		$21,7
sll		$21,$21,2
sw		$21,12549($21)
addi	$1,$0,68
mfc0	$1,$12
addi	$1,$0,232
mfc0	$1,$13
addi	$1,$0,28
mfc0	$1,$14
lui		$17,7
lui		$17,5
srl		$17,$27,2
sb		$17,18572($27)
addi	$1,$0,232
mfc0	$1,$12
addi	$1,$0,240
mfc0	$1,$13
addi	$1,$0,12
mfc0	$1,$14
lui		$17,7
lui		$17,4
sra		$28,$28,1
sh		$17,26120($17)
addi	$1,$0,16
mfc0	$1,$12
addi	$1,$0,156
mfc0	$1,$13
addi	$1,$0,156
mfc0	$1,$14
lui		$0,7
lui		$0,6
sll		$0,$8,2
sw		$0,428($0)
lui		$29,1
lui		$29,4
lbu		$29,7098($29)
srav	$29,$29,$29
addi	$1,$0,188
mfc0	$1,$12
addi	$1,$0,196
mfc0	$1,$13
addi	$1,$0,224
mfc0	$1,$14
lui		$18,3
lui		$18,1
lh		$18,18732($18)
slt		$13,$13,$13
addi	$1,$0,88
mfc0	$1,$12
addi	$1,$0,108
mfc0	$1,$13
addi	$1,$0,204
mfc0	$1,$14
addi	$13,$0,160
lui		$18,1
lui		$18,5
lhu		$18,128($14)
sltu	$14,$18,$14
lui		$19,5
lui		$19,0
lw		$19,60($0)
sub		$0,$0,$0
lui		$30,5
lui		$30,7
lb		$30,10426($30)
ori		$30,$30,4
addi	$1,$0,144
mfc0	$1,$12
addi	$1,$0,248
mfc0	$1,$13
addi	$1,$0,196
mfc0	$1,$14
lui		$18,3
lui		$18,0
lbu		$18,-8($15)
slti	$15,$15,0
addi	$15,$0,165
lui		$18,5
lui		$18,7
lh		$16,17969($16)
sltiu	$16,$18,0
addi	$1,$0,48
mfc0	$1,$12
addi	$1,$0,0
mfc0	$1,$13
addi	$1,$0,60
mfc0	$1,$14
addi	$16,$0,80
lui		$15,4
lui		$15,5
lhu		$0,19249($15)
xori	$15,$0,97
addi	$1,$0,32
mfc0	$1,$12
addi	$1,$0,120
mfc0	$1,$13
addi	$1,$0,152
mfc0	$1,$14
lui		$1,5
lui		$1,4
lw		$1,31391($1)
srl		$1,$1,2
addi	$1,$0,172
mfc0	$1,$12
addi	$1,$0,156
mfc0	$1,$13
addi	$1,$0,208
mfc0	$1,$14
lui		$18,1
lui		$18,6
lb		$17,12615($17)
sra		$18,$17,2
addi	$1,$0,124
mfc0	$1,$12
addi	$1,$0,236
mfc0	$1,$13
addi	$1,$0,204
mfc0	$1,$14
lui		$18,3
lui		$18,4
lbu		$18,16646($18)
sll		$18,$18,1
addi	$1,$0,104
mfc0	$1,$12
addi	$1,$0,164
mfc0	$1,$13
addi	$1,$0,16
mfc0	$1,$14
lui		$5,0
lui		$5,2
lh		$5,5591($5)
srl		$0,$5,1
addi	$1,$0,4
mfc0	$1,$12
addi	$1,$0,244
mfc0	$1,$13
addi	$1,$0,204
mfc0	$1,$14
lui		$2,7
lui		$2,6
lhu		$2,1150($2)
lw		$2,22457($2)
addi	$1,$0,204
mfc0	$1,$12
addi	$1,$0,196
mfc0	$1,$13
addi	$1,$0,152
mfc0	$1,$14
lui		$18,1
lui		$18,0
lb		$18,28($18)
lbu		$18,24($19)
lui		$18,4
lui		$18,1
lh		$20,26819($20)
lhu		$20,13629($18)
addi	$1,$0,68
mfc0	$1,$12
addi	$1,$0,64
mfc0	$1,$13
addi	$1,$0,60
mfc0	$1,$14
lui		$15,4
lui		$15,7
lw		$0,48($0)
lb		$15,32($0)
lui		$3,0
lui		$3,0
lbu		$3,16($3)
sb		$3,272($3)
lui		$18,0
lui		$18,5
lh		$21,20995($21)
sh		$18,10600($18)
addi	$1,$0,176
mfc0	$1,$12
addi	$1,$0,92
mfc0	$1,$13
addi	$1,$0,124
mfc0	$1,$14
lui		$18,2
lui		$18,1
lhu		$18,28424($18)
sw		$18,8400($18)
addi	$1,$0,156
mfc0	$1,$12
addi	$1,$0,236
mfc0	$1,$13
addi	$1,$0,136
mfc0	$1,$14
lui		$0,2
lui		$0,7
lw		$8,64($0)
sb		$0,420($0)
lui		$4,2
lui		$4,4
lb		$4,24271($4)
mult	$4,$4
mflo	$1
mfhi	$2
addi	$1,$0,164
mfc0	$1,$12
addi	$1,$0,252
mfc0	$1,$13
addi	$1,$0,248
mfc0	$1,$14
lui		$18,2
lui		$18,4
lbu		$23,17835($18)
multu	$18,$18
mflo	$1
mfhi	$2
addi	$1,$0,8
mfc0	$1,$12
addi	$1,$0,132
mfc0	$1,$13
addi	$1,$0,44
mfc0	$1,$14
lui		$18,2
lui		$18,0
lh		$24,128($18)
mthi	$24
mflo	$1
mfhi	$2
addi	$1,$0,217
addi	$18,$0,227
lui		$4,4
lui		$4,5
lhu		$4,2534($4)
mtlo	$0
mflo	$1
mfhi	$2
addi	$1,$0,132
mfc0	$1,$12
addi	$1,$0,36
mfc0	$1,$13
addi	$1,$0,148
mfc0	$1,$14
lui		$5,5
lui		$5,2
lw		$5,8430($5)
beq		$5,$5,TAG_16
addiu	$5,$5,1
addiu	$5,$5,1
TAG_16:
addi	$1,$0,204
mfc0	$1,$12
addi	$1,$0,108
mfc0	$1,$13
addi	$1,$0,192
mfc0	$1,$14
lui		$18,4
lui		$18,7
lb		$25,3048($25)
bne		$18,$0,TAG_17
addiu	$18,$0,1
addiu	$0,$18,1
TAG_17:
addi	$1,$0,104
mfc0	$1,$12
addi	$1,$0,200
mfc0	$1,$13
addi	$1,$0,56
mfc0	$1,$14
lui		$18,6
lui		$18,7
lbu		$26,-36($26)
beq		$18,$18,TAG_18
addiu	$18,$18,1
addiu	$18,$18,1
TAG_18:
lui		$0,2
lui		$0,4
lh		$0,128($0)
bne		$0,$1,TAG_19
addiu	$0,$1,1
addiu	$1,$0,1
TAG_19:
lui		$6,5
lui		$6,1
lhu		$6,15521($6)
beq		$6,$0,TAG_20
addiu	$6,$0,1
addiu	$0,$6,1
TAG_20:
addi	$1,$0,168
mfc0	$1,$12
addi	$1,$0,8
mfc0	$1,$13
addi	$1,$0,60
mfc0	$1,$14
lui		$18,2
lui		$18,5
lw		$27,474($27)
bne		$18,$18,TAG_21
addiu	$18,$18,1
addiu	$18,$18,1
TAG_21:
addi	$1,$0,96
mfc0	$1,$12
addi	$1,$0,4
mfc0	$1,$13
addi	$1,$0,28
mfc0	$1,$14
lui		$18,1
lui		$18,1
lb		$28,2($28)
beq		$18,$28,TAG_22
addiu	$18,$28,1
addiu	$28,$18,1
TAG_22:
.ktext 0x4180

_entry6:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	LOOP1:	j	LOOP1
	LOOP2:	j	LOOP2
	LOOP3:	j	LOOP3
#end