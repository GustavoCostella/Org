	.data 
entrada: .string "Insira o numero: "
	.align 2
hello: .string "Informe o que quer fazer: "
	.align 2
bemvindo: .string "                     *@@&*/@@@@*                                                                                                                                                                        \n                   &@&      @@@@&                                                                                                                                            #@@@, &@                   \n         (@@@/   /@&        (@@@@(                                                                                                                                         @@@@.     #&                 \n        ,@@@@@# @@.         *@@@@#                                                                                                                                       .@@@@        @(                \n        @@@@@@,@@           #@@@@/                                                                                                                                      *@@@@.        &%                \n        @@@@@@@@           .@@@@&                                                                                                                                       @@@@@         @#                \n       *@@@@@@@            @@@@&                                                                                                                                       @@@@@         .@                 \n       %@@@@@@           ,@@@@,                                                                                         #@@((@@@,                                     .@@@@@         @/                 \n       @@@@@@(         .@@@@,                                                                                           ,@@@@@@,                                      %@@@@/        @#                  \n       @@@@@@       ,@@@%.                                                                                                 *%.                                        &@@@@        @,                   \n       @@@@@@/###/,,/@@@@@/               #@@@(    @@@@#   .@@@@%       %%&@@/                         ,@@@%     *@&*     ,###*       &@@&*    *@@@@%         /@@@(@@.@@@@@      &@      *(/.           \n       @@@@@@          *@@@@@          /@@@@  #&  ,@@@@&  /@,/@@@@    /&  @@@@*                        @@@@@    %@ ,@     @@@@@      (@@@@&   #@(@@@@,      /@@@&   ,@@@@@@    &&    ,@@@/   ##         \n       @@@@@@            (@@@@#       %@@@@.  @,  *@@@@# ,@( *@@@@*  /%  .@@@@#        &@@@@@@@@@@@@@(.@@@@@   ,@( *@    .@@@@@      &@@@@(  %& #@@@@,     (@@@@.    /@@@@@*&&.     %@@@#     /%        \n       @@@@@@             ,@@@@%     (@@@@* /@    (@@@@/ @@  ,@@@@( /%   *@@@@(                        @@@@@   *@( %%    ,@@@@&      @@@@@* #@  %@@@@.    .@@@@(     .@@@@@        .@@@@    .&%@    ,#  \n       @@@@@@    ,/%&&@@@@@@@@@@@&@&#&@@@@.       %@@@@/@@   .@@@@#(&    /@@@@/     **                 &@@@@   .@#,@*    *@@@@(      @@@@@.#@   &@@@@     *@@@@*     *@@@@@        (@@@&     @(@.#%.    \n       @@@@@@              ,@@@@(    &@@@@       %&@@@@#@/   .@@@@@@     (@@@@*    %,                  ,@@@@*   *@@#   *&,@@@@*     @@@@@@/@    %@@@@     (@@@@,    #@/@@@@       @*@@@@      (#        \n      ,@@@@@@              .@@@@/    /@@@@     .@ /@@@@@@     @@@@@.     ,@@@@*  .@                     %@@@#    &&,*.    @@@@/   #% @@@@@@,    (@@@@    %.%@@@/   &%  &@@@&    ,@  /@@@(    *@         \n    .@..@@@@@              *@@@@      .@@@#  /@,   @@@@@,      &@&        *@@@% &(                       (@@@/ *@(        *@@@@ (@   %@@@@#      &@@@  ##   /@@@.#@,    *@@@%  @*     @@@*  @#          \n    @.  @@@@@.             &@@@*                                                                             ,.               .                                                                         \n   .@.   @@@@@            (@@@*                                                                                                                                                                         \n    %@     *##.          %@@&                                                                                                                                                                           \n     ,@%               #@@%                                                                                                                                                                             \n        (@@/.     ./@@@(                                                                                                                                                                                \n"
	.align 2
matrix_type: .string "Informe o tamanho da matriz (2, 3, 4, 5 ou 6):\n "
	.align 2
err1: .string "Valor incorreto, informe um tamanho valido!"
	.align 2
err2: .string "Nao foi possivel calcular o valor do determinante!"
	.align 2
print_menu: .string "\n 1- Ler matriz \n 2- Imprimir matriz \n 3- Achar o maior valor \n 4- Ordenar a matriz \n 5- Calcular determinante (somente 3x3)\n 9- Sair do programa \n"
	.align 2
maiorval: .string "maior valor eh: "
	.align 2
virgula: .string ", "
	.align 2
barn: .string "\n"
	.align 2
matriz: .space 144
	.align 2
tamanho: .word
	.text
main:
	li a7,4
	la a0, bemvindo
	ecall

menu_princ:
	li a7,4
	la a0, print_menu
	ecall
	li a7,4
	la a0, hello
	ecall
	li a7,5
	ecall
	la a2,matriz
	la a3,tamanho
	mv t2,zero
	mv t1,zero
	mv t3,zero
	mv t4,zero
	mv t5,zero
	mv t6,zero
	mv s1,zero
	mv a1,zero
	mv a4,zero
	mv a5,zero
	mv a6,zero
	li s2,1
	li s3,2
	li s4,3
	li s5,4
	li s6,5
	li s7,9
	beq s2,a0,lemat
	beq s3,a0,printmat
	beq s4,a0,maiomat
	beq s5,a0,ordmat
	beq s6,a0,detmat
	beq s7,a0,final
	j menu_princ

lemat:
	li a7,4
	la a0, matrix_type
	ecall	
	li a7, 5
	ecall 	
	sw a0,0(a3)
	add t4,a0,zero
	add t3,t4,zero
	mul t1,t4,t3
	mv t3,zero
	j montamat
	
montamat:
	beq t1,t2,menu_princ
	addi t2,t3,1
	mv t3,t2
	la a0, entrada
	li a7, 4
	ecall
	li a7, 5
	ecall
	sb a0,0(a2)
	addi a2,a2,4
	j montamat

printmat:
	lw t1, 0(a3)
	mul t3,t1,t1
	beq a1,t1,barran
	lb a0, 0(a2)
	li a7, 1
	ecall
	addi t2,t2,1
	beq t3,t2,menu_princ
	la a0, virgula
	li a7, 4
	ecall
	addi a2,a2,4
	addi a1,a1,1
	j printmat
	
barran:
	la a0,barn
	li a7,4
	ecall
	li a1,0
	j printmat

maiomat:
	lw t1, 0(a3)
	mul t1,t1,t1
	beq t1,t2,maio
	addi t2,t2,1
	lb t3, 0(a2)
	addi a2,a2,4
	blt a0,t3,troca
	j maiomat

troca:
	mv a0,t3
	j maiomat
	
maio:
	mv t1,a0
	la a0,maiorval
	li a7,4
	ecall
	mv a0,t1
	li a7,1
	ecall
	j menu_princ

ordmat:
	la a3,tamanho
	la a2,matriz
	mv t2,zero
	lw t1, 0(a3)
	mul t1,t1,t1
	addi s1,s1,-1
	add a6,t1,s1
	beqz a6,menu_princ
	j bubble

bubble:
	beq a6,t2,ordmat
	addi t2,t2,1
	add a4,a2,zero
	addi a4,a4,4
	lb a0, 0(a4)
	lb a1, 0(a2)
	blt a0,a1,bub
	addi a2,a2,4
	mv t6,t2
	j bubble
	
bub:
	sb a1, 0(a4)
	sb a0, 0(a2)
	addi a2,a2,4
	j bubble


detmat:
	add s11,s11,zero
	la a2, matriz
	lw a3, tamanho
	
	lw s8, 0(a2)
	lw s9, 16(a2)
	mul s8, s8, s9
	lw s10, 32(a2)
	mul s8, s8, s10
	add s11, s11, a2
	
	lw s8, 4(a2)
	lw s9, 20(a2)
	mul s8, s8, s9
	lw s10, 24(a2)
	mul s8, s8, s10
	add s11, s11, a2
	
	lw s8, 8(a2)
	lw s9, 12(a2)
	mul s8, s8, s9
	lw s10, 28(a2)
	mul s8, s8, s10
	add s11, s11, a2
	
	lw s8, 8(a2)
	lw s9, 16(a2)
	mul s8, s8, s9
	lw s10, 24(a2)
	mul s8, s8, s10
	sub s11, s11, a2
	
	lw s8, 0(a2)
	lw s9, 20(a2)
	mul s8, s8, s9
	lw s10, 28(a2)
	mul s8, s8, s10
	sub s11, s11, a2
	
	lw s8, 4(a2)
	lw s9, 12(a2)
	mul s8, s8, s9
	lw s10, 32(a2)
	mul s8, s8, s10
	sub s11, s11, a2
	
	mv a0, s11
	li a7, 1
	ecall 
	j menu_princ
	
	
final:
	wfi