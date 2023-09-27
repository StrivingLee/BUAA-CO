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
	li   $a0, 1000
	li   $v0, 8
	syscall
.end_macro

.macro end
	li   $v0, 10
	syscall
.end_macro

.data
	string:    .space 1000
	substring: .space 1000
	
.text
	
	