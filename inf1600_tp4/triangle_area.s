.data
      factor: .float 2.0
      p:      .float 0.0

.text
.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        
      push %ebp      /* save old base pointer */
      mov %esp, %ebp /* set ebp to current esp */
         
      mov 8(%ebp),%ebx  # met l'adresse dans %ebx
      mov (%ebx),%ecx   # met la table virtuel dans %ecx
      push %ebx       # met l'adresse de l'objet sur la pile
      call *12(%ecx)  # appel la fonction perimeterAsm()
      pop %ebx        # enleve l'adresse de l'objet
        
      fld factor      # met la valeur a l'étiquette factor sur la pile
      fdivrp          # divise perimeters par 2.0
      fstp p          # enleve et sauvegarde le résultat dans la memoire
                      
      fld p           # met p sur la pile
      fld 4(%ebx)     # met mSides[0] sur la pile
      fsubrp          # p-mSides[0] 
      fld p           # met p sur la pile
      fmulp           # p*(p- mSides[0])

      fld p           # met p sur la pile
      fld 8(%ebx)     # met mSides[1] sur la pile
      fsubrp          # p-mSides[1]
      fmulp           # p*(p-mSides[0])*(p-mSides[1])

      fld p           # met p sur la pile
      fld 12(%ebx)    # met mSides[2] sur la pile
      fsubrp          # p-mSides[2]
      fmulp           # p*(p-mSides[0])*(p-mSides[1])*(p-mSides[2]) 
      fsqrt           # racine carrée de l'élément a la position st[0]

      leave          /* restore ebp and esp */
      ret            /* return to the caller */
