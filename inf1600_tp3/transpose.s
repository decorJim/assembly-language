.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        push %esi  # sauvegarder l'acienne valeur des registres 
        push %edi
        push %ebx
        push %edx
        push %ecx

        mov 16(%ebp),%esi # %esi=matorder
        mov 12(%ebp),%edi  # %edi=outmatdata
        mov 8(%ebp),%ebx  # %ebx=inmatdata
        movl $0,%edx  # %edx=r=0

BOUCLE1:
        cmp %esi,%edx  # comparer matorder et r
        jge FIN  # si r>=matorder sauter a etiquette FIN
        movl $0,%ecx # mettre c=0 a chaque fois qu'on entre

BOUCLE2:
        cmp %esi,%ecx # comparer matorder et c
        jge BOUCLE1inc # sauter a etiquette BOUCLE1inc si c>=matorder
        
        push %edx # sauvegarder la valeur courante de r
        push %ecx # sauvegarder la valeur courante de c

        imul %esi,%ecx # %ecx=c=c*matorder
        add %edx,%ecx # %ecx=c*matorder+r
        mov (%ebx,%ecx,4),%ebx # %ebx=inmatdata[c*matorder+r]
        
        pop %ecx # restaurer la valeur de c
     
        imul %esi,%edx # %edx=r=r*matorder
        add %ecx,%edx  # %edx=r*matorder+c
        mov %ebx,(%edi,%edx,4) # outmatdata[r*matorder+c]

        pop %edx # restaurer la valeur de r
        mov 16(%ebp),%esi # %esi=matorder
        mov 12(%ebp),%edi  # %edi=outmatdata
        mov 8(%ebp),%ebx  # %ebx=inmatdata
        incl %ecx # c++
        jmp BOUCLE2

BOUCLE1inc:
        incl %edx # r++
        jmp BOUCLE1

FIN:
        pop %ecx
        pop %edx
        pop %ebx
        pop %edi
        pop %esi
        leave
        ret



        


