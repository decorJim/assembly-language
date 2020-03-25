.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        mov 8(%ebp),%eax # sauvegarde l'adresse de l'objet dans %eax
        fld 4(%eax)      # met la valeur obj->mRadius sur la pile
        fldpi            # met la constante pi sur la pile
        fmulp            # multiplie la valeur sur la pile à la position[0] (pi)
                         # avec la valeur sur la pile à la position[1] (mRadius)
                         # sauvegarde le résultat à ces positions

        fld factor       # met la valeur à l'étiquette factor sur la pile
        fmulp            # multiplie la valeur à la position[0] (factor) avec la
                         # valeur à la position[1] et sauvegarde le résultat à ces 
                         # positions
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
