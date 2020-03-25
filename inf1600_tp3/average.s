.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp
        mov %esp,%ebp
   
        subl $12,%esp # reserver pour les int r et c
        movl $0,-4(%ebp) # r=0
        mov 16(%ebp),%ecx #%ecx=matorder
        movl $0,-12(%ebp) # elem=0

BOUCLE1:
        cmp -4(%ebp),%ecx
        je FIN
        movl $0,-8(%ebp) # reset c=0
        movl $0,-12(%ebp) # elem=0

BOUCLE2:
        cmp -8(%ebp),%ecx # comparer c et matorder
        je DIVISION
        mov -4(%ebp),%eax # %eax=r
        mul %ecx # %ecx=r*matorder
        add -8(%ebp),%eax # %eax=c+r*matorder
        mov 8(%ebp),%ebx # %ebx=inmatdata
        mov (%ebx,%eax,4),%ebx # %ebx=inmatdata[c+r*matorder]
        add %ebx,-12(%ebp) # elem+=inmatdata[c+r*matorder]
        incl -8(%ebp) # c++
        jmp BOUCLE2

DIVISION:
        mov -12(%ebp),%eax # %eax=elem
        idiv %ecx # %eax=elem/matorder
        mov 12(%ebp),%ebx # %ebx=outmatdata
        mov -4(%ebp),%edx # %edx=r
        mov %eax,(%ebx,%edx,4) # outmatdata[r]=elem/matorder
        jmp BOUCLE1inc

BOUCLE1inc:
        incl -4(%ebp) # r++
        jmp BOUCLE1

FIN:
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
