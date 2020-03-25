.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:

          push %ebp      /* save old base pointer */
          mov %esp, %ebp /* set ebp to current esp */
        
          mov 8(%ebp),%eax  # met l'adresse de l'objet dans %eax
       
          fld 4(%eax) # sauvegarder la valeur de this-­>mRadius sur la pile
          fld 4(%eax) # sauvegarder la valeur de this->mRadius une autre 
                      # fois sur la pile
          fmulp # va multiplier l'élément sur la pile à la position[0] et 
                # à la position[1] ensemble et sauvegarde le résultat 
                # dans ces 2 positions
          fldpi # mettre la constante pi sur la pile
          fmulp # va multiplier l'élément à la position[0] (pi) et à la position[1] 
                # (mRadius*mRadius) et va sauvegarder le résultat à ces positions
          leave          /* restore ebp and esp */
          ret            /* return to the caller */
