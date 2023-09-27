.macro printInt(%src)
	move $a0, %src
	li   $v0, 1
	syscall
.end_macro

.macro getInt(%dst)
	li   $v0, 5
	syscall
	move %dst, $v0
.end_macro

.macro printStr(%src)
	la   $a0, %src
	li   $v0, 4
	syscall
.end_macro

.macro getStr(%dst)
	la   $a0, %dst
	li   $a1, 20
	li   $v0, 8
	syscall
.end_macro

.macro getLen(%dst, %target)
		
	li   %dst, 0
count_loop:
	lb   $t1, %target(%dst)
	li   $t2, '\n'
	beq  $t1, $t2, enter_end
	beq  $t1, $0, string_end
	addi %dst, %dst, 1
	j    count_loop
	
string_end:
	addi %dst, %dst, -1
enter_end:
.end_macro

.macro end
	li   $v0, 10
	syscall
.end_macro

.data
	string: .space 100
	substring: .space 100
	
.text
	getStr(string)
	getStr(substring)

	getLen($s0, string) # s0 contains the length of string
	getLen($s1, substring) # s1 contains the length of substring
	
	li   $t0, 0
fori:
	bge  $t0, $s0, iend
	li   $t1, 0
	li   $s2, 0 # s2 contains the current step(the number that match)
	if1:
		lb   $t2, string($t0)
		lb   $t3, substring($0)
		bne  $t2, $t3, else1
		forj:
			bge   $t1, $s1, jend
			if2:
				add  $t2, $t0, $t1
				lb   $t3, string($t2)
				lb   $t4, substring($t1)
				bne  $t3, $t4, jend
			else2:
				addi $s2, $s2, 1
				addi $t1, $t1, 1
				j    forj
		jend:
	else1:
		if_match:
			beq  $s1, $s2, output1
		else_match:
			add  $t0, $t0, $s2
		beq  $s2, $s1, output1
		addi $t0, $t0, 1
		j    fori
iend:
	j    output0
output1:
	li   $t5, 1
	j    print
output0:
	li   $t5, 0
print:
	printInt($t5)
	
	end
