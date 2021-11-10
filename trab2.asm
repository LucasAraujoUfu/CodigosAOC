# Lucas Gabriel Teodoro Araújo - 11921BSI247
# Sávio Dias Araújo - 11921BSI234
.data
	.align 2
	arr: .space 20

.text
	add $t0, $zero, $zero
	
	addi $s0, $zero, 1
	
	addi $s3, $zero,11
	
	la $s7, arr
	
For_ler:slt $t0, $s0, $s3
	beq $t0, $zero, saiLer
	
	add $s1, $zero, $s0
	
	sw $s1, 0($s7)
	addi $s7, $s7, 4
	
	addi $s0, $s0, 1
	j For_ler
saiLer:

	add $s0, $zero, $zero
		
	la $s7, arr
	
	addi $s3, $zero, 10
	
ForPrin:slt $t0, $s0, $s3
	beq $t0, $zero, SaiPrin
	
	lw $s1, 0($s7)
	
	mul $s1 $s1 $s1
	sw $s1,0($s7)
	
	addi $s7, $s7, 4
	
	addi $s0, $s0, 1
	j ForPrin
SaiPrin:

