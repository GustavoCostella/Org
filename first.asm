.data

entrada: .string "Entre com um valor: "
saida: .string "O maior numero eh: "
saida2: .string "A media eh: "
saida3: .string "O menor numero eh: \n"

.text
	#s1 e s0 recebem seus valores
	addi s1,s1,3
	add s0,s0,zero
	li a2,0
forini:
	beq s0,s1,final
	li a7,4
	la a0, entrada
	ecall
	li a7,5
	ecall
	mv a1,a0
	add t1,t1,a1
	bgt a1,a2,troca
	blt a1,a3,trocamen
	addi s1,s1,-1
	j forini
	
troca:
	mv a2,a1
	addi s1,s1,-1
	j forini
	
trocamen:
	mv a3,a1
	addi s1,s1,-1
	j forini
	
final:
	addi t2,t2,3
	div t1,t1,t2
	li a7,4
	la a0, saida
	ecall
	li a7,1
	mv a0,a2
	ecall
	li a7,4
	la a0, saida3
	ecall
	li a7,1
	mv a0,a3
	ecall
	li a7,4
	la a0, saida2
	ecall
	li a7,1
	mv a0,t1
	ecall
