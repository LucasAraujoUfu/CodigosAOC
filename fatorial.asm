.macro 	print_int(%int)
	addi $v0 $zero 1
	addu $a0 $zero %int
	syscall
.end_macro 

.macro input_int(%int)
	addi $v0 $zero 5
	syscall
	addu %int $zero $v0
.end_macro 	 

.macro return
	addi $v0 $zero 10
	syscall	
.end_macro

.text 

	addiu $s0 $zero 1
	addiu $t0 $zero 2
	input_int($s1)
	
for1:	sle $t1 $t0 $s1
	beq $t1 $zero endfor1
	
	mul $s0 $s0 $t0 
	
	addiu $t0 $t0 1
	j for1
endfor1:

	print_int($s0)
	
	return