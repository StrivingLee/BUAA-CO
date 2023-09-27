.macro end
	li   $v0, 10
	syscall
.end_macro

.macro printInt(%src)
	move $a0, %src
	li   $v0, 1
	syscall
.end_macro

.data

.text
main:
	li   $s0, 9 # $s0 is the boundary
	li   $t0, 1
	fori:
		bgt  $t0, $s0, iend
		li   $t1, 0
		forj:
			bgt  $t1, $s0, jend
			li   $t2, 0
			fork:
				bgt  $t2, $s0, kend
				li   $s1, 0 # $s1 is sum, clear once
				li   $s3, 0 # $s3 is cur, clear once
				mulu $t3, $t0, $t0
				mulu $t3, $t3, $t0
				addu $s1, $s1, $t3
				mulu $t3, $t1, $t1
				mulu $t3, $t3, $t1
				addu $s1, $s1, $t3
				mulu $t3, $t2, $t2
				mulu $t3, $t3, $t2
				addu $s1, $s1, $t3
				mulu $t3, $t0, 100
				addu $s3, $s3, $t3
				mulu $t3, $t1, 10
				addu $s3, $s3, $t3
				addu $s3, $s3, $t2
				bne  $s1, $s3, print_end
			print:
				printInt($s3)
			print_end:
				addi $t2, $t2, 1
				j    fork
			kend:
				addi $t1, $t1, 1
				j   forj
		jend:
			addi $t0, $t0, 1
			j    fori
	iend:
		end
		
	