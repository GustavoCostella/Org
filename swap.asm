.data:
vetor:  .word 1, -2, -2, 4, 3, 6, 9, 5, 5, 6


.text:
    
main:

    la a2, vetor
    li a0, 2
    li a1, 7
    jal swap

swap:
    add t0, a0, a0
    add t0, t0, t0 
    add t1, a2, t0
    lw s0, 0(t1)
    add t2, a1, a1
    add t2, t2, t2
    add t3, a2, t2 
    lw s1, 0(t3)
    sw s1, 0(t1)
    sw s0, 0(t3)