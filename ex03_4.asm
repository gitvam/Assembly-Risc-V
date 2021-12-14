.data
        a: .space 32			#allocate 32 bytes
        new_line: .asciz "\n"
        space: .asciz " "
        prompt: .asciz "Input 8 integers, one by one:\n"
        skata: .asciz "skata"
        
        .text
       
main: 
        la      x16, a   		# pseudo-instruction: address of array        
        addi    x15, x16, 32    
        addi    x17, x0, 4      	 
        la      x10, prompt  
        ecall               		# print the string from prompt

rd_loop:

        addi    x17, x0, 5       
        ecall
        sw      x10, 0(x16)      
        addi    x16, x16, 4     
        bne     x16, x15, rd_loop     	#while(x16 != x15)
      	la      x16, a
multiply_loop:

        lw      x19, 0(x16)      
        add     x18, x19, x19    
        add     x19, x19, x19    
        add     x19, x19, x19    
        add     x19, x18, x19    
        sw      x19, 0(x16)      
        addi    x16, x16, 4      
        bne     x15, x16, multiply_loop  #while(x15!=x16)
    		
    	addi    x15, x15, -36       
   	addi    x16, x16, -4        
   	addi    x17,x0,4                
   	la x10,new_line              
   	ecall
	                     
reverse_loop:				

        addi    x17, x0, 1       
        lw      x10, 0(x16)    
        ecall                 
        addi x17,x0,4            
	la x10,space            
	ecall               
        addi x16,x16,-4	        
	bne x15,x16,reverse_loop       
    	addi x17,x0,4                
	la x10,new_line                
	ecall                    
    	j main                      
   
