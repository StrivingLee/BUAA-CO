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
	li   $a1, 100
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

	getLen($s0, string)
	getLen($s1, substring)
	
	printInt($s0)
	printInt($s1)
	

	
	end
