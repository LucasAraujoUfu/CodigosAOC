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
	.align 2
	arr: .space 84 
	nl: .asciiz "\n"
	spc: .asciiz " "

.text
	add $t0, $zero, $zero
	
	la $s7, arr
	
For_ler:slti $t0, $s0, 42
	beq $t0, $zero, saiLer
	
	input_int($s1)
	
	sw $s1, 0($s7)
	addiu $s7, $s7, 4
	
	addiu $s0, $s0, 1
	j For_ler
saiLer:
		
	la $a1, arr

	jal Soma

	print_int($v1)
	NL

	la $a1, arr

	jal Min

	print_int($v1)
	NL

	la $a1, arr

	jal Max

	print_int($v1)
	NL

	la $s7, arr
	add $s0, $zero, $zero

ForPrin:slti $t0, $s0, 42
	beq $t0, $zero, SaiPrin
	
	lw $s1, 0($s7)
	addiu $s7, $s7, 4
	
	print_int($s1)
	Spc
	addiu $s0, $s0, 1
	j ForPrin
SaiPrin:

	return
	
Soma:
	#t0,t1,s0
	add $s0, $zero, $zero
	add $v1, $zero, $zero
for_sum: slti $t0, $s0, 42
	beq $t0, $zero, saisum

	lw $t1, 0($a1)

	addu $v1, $v1, $t1

	addiu $a1, $a1, 4

	addiu $s0, $s0, 1
	j for_sum
saisum:

	jr $ra
	
Min:
	#t0,t1,s0
	add $s0, $zero, $zero
	lw $t1, 0($a1)
	add $v1, $zero, $t1
for_Min: slti $t0, $s0, 42
	beq $t0, $zero, saiMin
	
	slt $t0, $t1,  $v1
	beq $t0, $zero, ATT
		move $v1, $t1
	ATT:
	
	addiu $a1, $a1, 4
	
	addiu $s0, $s0, 1

	lw $t1, 0($a1)

	j for_Min
saiMin:

	jr $ra
	
Max:
	#t0,t1,s0
	add $t0, $zero, $zero
	add $s0, $zero, $zero
	lw $t1, 0($a1)
	add $v1, $zero, $t1
for_Max: slti $t0, $s0, 42
	beq $t0, $zero, saiMax
	
	sle $t0, $v1, $t1
	beq $t0, $zero, Att
		move $v1, $t1
	Att:
	
	addiu $a1, $a1, 4
	
	addiu $s0, $s0, 1

	lw $t1, 0($a1)

	j for_Max
saiMax:

	jr $ra
