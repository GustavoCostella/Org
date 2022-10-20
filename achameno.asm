.data
	vet: .word 1,15,14,13,12,11,2,9,3,4,5,10,6,7,30,66
	saida: .string "A local do numero no vetor eh: "
.text
	
main:
	li a0,16 
	la a1, vet
	jal achameno
	mv t1,a0
	li a7,4
	la a0, saida
	ecall
	li a7,1
	mv a0,t1
	ecall
	
achameno:
	li t2,2046
	li t4, 0
	li t5, 0
	j continua_for
	
continua_for:
	beq a0,t4,final
	lw t1,0(a1)
	blt t1,t2,semenor
	addi a1,a1,4
	addi t4,t4,1
	addi t5,t5,1
	j continua_for
	
semenor:
	mv t2,t1
	mv t3,t5
	addi a1,a1,4
	addi t4,t4,1
	addi t5,t5,1
	j continua_for
	
final:
	mv a0,t3
	ret
