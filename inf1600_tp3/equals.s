.globl matrix_equals_asm

matrix_equals_asm:
   
        push %ebp      #Save old base pointer
        mov %esp,%ebp  #Set ebp to current esp

        push %esi    #sauvegarder les anciennes valeurs de ces registres
        push %edi
        push %esi
        push %edx
        push %ecx
        
        movl $0,%edx  # r=%edx=0 
        movl $0,%ecx  # c=%ecx=0 
        movl 16(%ebp),%esi  # %esi=matorder
        movl 12(%ebp),%edi  # %edi=inmatdata2
        movl 8(%ebp),%ebx   # %ebx=inmatdata1

BOUCLE1:
          cmp %esi,%edx # compare r avec matorder 
          jge RETURN1 # si r>=matorder sauter a l etiquette FIN 
          movl $0,%ecx # remettre c a 0 a chaque fois que ca atteint matorder 

BOUCLE2:
          cmp %esi,%ecx # compare c avec matorder 
          jge BOUCLE1inc # sauter a etiquette BOUCLE1inc si c>=matorder
          push %edx # sauvegarder la valeur courante de r avant de la modifier 
          
          imul %esi,%edx # %edx=r*matorder 
          addl %ecx,%edx # %edx=r*matorder+c 
          mov (%ebx,%edx,4),%ebx # %ebx=inmatdata1[c + r * matorder] 
          mov (%edi,%edx,4),%edi # %edi=inmatdata2[c + r * matorder] 
          cmp %ebx,%edi
          jne RETURN0
          pop %edx
          movl 16(%ebp),%esi  # %esi=matorder
          movl 12(%ebp),%edi  # %edi=inmatdata2
          movl 8(%ebp),%ebx   # %ebx=inmatdata1
          incl %ecx # c++
          jmp BOUCLE2
         
BOUCLE1inc:
          incl %edx # r++ 
          jmp BOUCLE1 # sauter a l etiquette BOUCLE1 

RETURN1:
          pop %edx
          movl $1,%eax
          pop %ecx # remet l'ancienne valeur de %ecx 
          pop %edx # remet l'ancienne valeur de %edx 
          pop %ebx # remet l'ancienne valeur de %ebx 
          pop %edi # remet l'ancienne valeur de %edi 
          pop %esi # remet l'ancienne valeur de %esi 
          leave    # Restore ebp and esp 
          ret      # Return to the caller

RETURN0:
          pop %edx
          movl $0,%eax
          pop %ecx # remet l'ancienne valeur de %ecx 
          pop %edx # remet l'ancienne valeur de %edx 
          pop %ebx # remet l'ancienne valeur de %ebx 
          pop %edi # remet l'ancienne valeur de %edi 
          pop %esi # remet l'ancienne valeur de %esi 
          leave    # Restore ebp and esp 
          ret      # Return to the caller
