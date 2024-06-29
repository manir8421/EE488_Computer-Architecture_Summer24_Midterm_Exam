.data
prompt: .asciiz "Enter a value of a0: "
result_msg: .asciiz "Memory value loaded into t8: "
memory_value: .word 0

.text
.globl main

main:
    li $v0, 4            
    la $a0, prompt       
    syscall            

    li $v0, 5            
    syscall             
    move $t0, $v0        

    sw $t0, memory_value 


    lw $t8, memory_value 

    li $v0, 4            
    la $a0, result_msg   
    syscall              

    move $a0, $t8        
    li $v0, 1            
    syscall              

    li $v0, 10           
    syscall           
