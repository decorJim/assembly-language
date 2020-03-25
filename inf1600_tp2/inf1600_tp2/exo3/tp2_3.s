.data

	i:
      
      int 0

.global func_s

func_s:	
	
    INSIDELOOP:
       
       mov d,%eax 
       add e,%eax
       sub b,%eax
       mov %eax,a

          IF:
            mov b,%eax
            subl $1000,%eax
            mov c,%ebx
            addl $500,ebx
            cmp %ebx,%eax
            jae ELSE
            
            subl $500,c
            
            IF2:
             mov b,%eax
             mov c,%ebx
             cmp %ebx,eax
             jae ELSE
             subl $500,b
             
             ENDIF2:
              jmp ENDIF
             
         ELSE:
            mov e,%eax
            sub %eax,b
            addl $500,d
         ENDIF:

     TESTLOOP:
           addl $1,i
           cmpl $10,i
           ja INSIDELOOP
            
                
	
	ret
