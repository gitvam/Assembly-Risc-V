    .data 
    .align 2
nl: .asciz "\n" 
prompt: .asciz "Give an integer:"
inv: .asciz "Negative number  given!"
nonext: .asciz "End of list reached!"

         .text

main: 

        jal node_alloc		# Create dummy node
        sw x0, 0(a0)            # Initialize dummy's data to zero
        sw x0, 4(a0)		# Initialize dummy's pointer to zero
        add s0, a0, x0          #head of the list 
        add s1, a0, x0          #tail of the list
reading_loop:  
        jal read_int		#jump sto read_int
        add t1, a0,x0		
        bge x0,a0,Exit       	#exit if number <= 0  
        jal node_alloc
        sw t1, 0(a0)
        sw a0, 4(s1)            #tail->next = the new node
        add s1, a0, x0          #tail = tail->next
        j reading_loop
Exit:
        sw x0, 4(s1)            #tail->next = NULL
new_int:        
        addi x17, x0, 4
        la x10, prompt		#fortwnoume to string prompt ston a0
        ecall			#to tupwnoume
        jal read_int       
        add s1, a0, x0        
        slt t0, s1, x0		#vazei asso ston t0 an to x0 einai mikrotero tou a0, alliws 0
        bne t0, x0, wrong_num   #an exei valei ton arithmo 0 h apo panw grammh tote wrong number
        add s2, s0, x0
        lw  t1, 4(s0)           #s2->next = s0->next
        add s2, x0, t1          #s2  = s2->next
search_loop:
        lw a0, 0(s2)           	#s2 address  
        add a1, s1, x0          #integer with whom we compare with   
        jal search_list
        
check_next:
        lw t2, 4(s2)
        add s2, x0, t2          #s2  = s2->next
        bne s2, x0, search_loop # an s2!=0 pame sti sunartisi search loop
no_next:
        addi x17, x0, 4
        la x10, nonext		#fortwnoume to string nonext ston a0
        ecall			#to tupwnoume
        addi x17, x0, 4
        la  x10, nl		#fortwnoume to new line prompt ston a0
        ecall			#to tupwnoume
        j new_int

wrong_num:
        addi x17, x0, 4
	la   x10, inv  		#fortwnoume to string inv ston a0
	ecall			#tupwnoume to string tou a0
        addi x17, x0, 4
        la  x10, nl		#fortwnoume to new line sto x10
        ecall			#tupwnoume to new line
        addi x17, x0, 10
        ecall
        jr ra,0    		#return 0/ ston return address kataxwrhth

node_alloc:
        addi x10, x0, 8
        addi x17, x0, 9
        ecall                
        jr ra,0     		#return 0 ston return address kataxwrhth

read_int:
        addi x17, x0, 5          
        ecall			#kaloume to leitourgiko na tupwsei thn timi to a0-x10, diladi twra to prompt
        add a0, x10, x0         #apothikeuoume ston a0 o,ti pairnoume input
        jr ra,0           	#return 0 ston return address kataxwrhth

print_node:
        add t0, a0, x0		#arxikopoioume me 0 ton temp kataxwrhth t0
        slt  t1, a1, t0		#compare to find the greater
        beq  t1, x0, check_next	#an t1==0 pame na stin check next gia na doume to epomeno
        add  x10, x0, t0	#x10 = t0
        addi x17, x0, 1		#x17+1
        ecall			#print to node
        addi x17, x0, 4		#x14+4	
        la  x10, nl		#vazoume to new line sto x10
        ecall			#tupwnoume to new line
        jr ra,0			#vazoume 0 sto return address kataxwriti

search_list:
        add t0, a0, x0		#arxikopoioume ton t0 me 0
        addi sp, sp, -12	#metakinoume ton stack pointer 3(3 4aria) theseis katw giati tha apothikeusoume tis 3 parakatw times
        sw ra, 0(sp)		#third thesi ap ton stack pointer
        sw a0, 4(sp)		#deuteri thesi ap ton stack pointer(restore from stack)
        sw a1, 8(sp)		#first thesi ap ton stack pointer
        jal print_node		#jump and link sthn sunartisi print node
        lw ra ,0(sp)		#restore ra from stack 
        jr ra,0 		#return to return auto pou vrisketai ston kataxwriti ra
