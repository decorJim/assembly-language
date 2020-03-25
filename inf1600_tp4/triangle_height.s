.data
    factor: .float 2.0

.text
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:

            push %ebp      /* save old base pointer */
            mov %esp, %ebp /* set ebp to current esp */
        
            mov 8(%ebp),%ebx  # met l'adresse de l'objet sur la pile
            mov (%ebx),%ecx   # %ecx=table virtuelle
            push %ebx         # met l'adresse de l'objet sur la pile
            call *20(%ecx)    # appel la fonction AreaAsm()
            pop %ebx        # pop l'adresse de l'objet de la pile et la met dans %ebx
        
            fld factor      # met la valeur a l'étiquette factor sur la pile
            fmulp           # multiplie la valeur de retour de AreaAsm() avec 2.0
            fld 12(%ebx)    # met mSides[2] sur la pile
            fdivrp          # (2.0*A)/mSides[2]

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
