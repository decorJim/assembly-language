.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
               push %ebp      /* save old base pointer */
               mov %esp, %ebp /* set ebp to current esp */
        
               mov 8(%ebp),%ebx  # %ebx=adresse de l'objet
               fld 4(%ebx)       # met mSides[0] sur la pile
               fld 8(%ebx)       # met mSides[1] sur la pile
               faddp             # mSides[0]+msides[1]

               fld 12(%ebx)      # met mSides[2] sur la pile
               faddp             # mSides[0]+mSides[1]+mSides[2]
        
               leave          /* restore ebp and esp */
               ret            /* return to the caller */
