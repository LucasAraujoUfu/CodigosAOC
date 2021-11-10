.macro 	print_int(%int)
	addi $v0, $zero, 1
	addu $a0, $zero, %int
	syscall
.end_macro 

.macro input_int(%int)
	addi $v0, $zero, 5
	syscall
	addu %int, $zero, $v0
.end_macro 	 

.macro Spc
	addi $v0, $zero, 4
	la $a0, spc
	syscall
.end_macro

.macro NL
	addi $v0, $zero, 4
	la $a0, nl
	syscall
.end_macro

.macro return
	addi $v0 $zero 10
	syscall	
.end_macro

.data
	arr: .space 20
	spc: .asciiz "k"
	nl:  .asciiz "n"
.text 

	input_int($t1)
	
	add $t0, $zero, $zero
	
	add $s2, $zero, $zero
	
	la $s7, arr
	
For_ler:slti $t0, $s0, 10	
	beq $t0, $zero, saiLer
	
	input_int($s1)
	
	sw $s1, 0($s7)
	addiu $s7, $s7, 4
	
	bne $s1 $t1 Eq
		addiu $s2, $s2, 1
	Eq:
	
	addiu $s0, $s0, 1
	j For_ler
saiLer:

	print_int($s2)
	NL
	
	addi $v0, $zero, 4
	la $a0, nl
	syscall
	
	add $s0, $zero, $zero
		
	la $s7, arr
	
ForPrin:slti $t0, $s0, 10
	beq $t0, $zero, SaiPrin
	
	lw $s1, 0($s7)
	addiu $s7, $s7, 4
	
	print_int($s1)
	Spc
	
	addiu $s0, $s0, 1
	j ForPrin
SaiPrin:

	NL
	
	return
