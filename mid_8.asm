.data
prompt_s0: .asciiz "Enter the value of $s0: "
prompt_s1: .asciiz "Enter the value of $s1: "
prompt_s2: .asciiz "Enter the value of $s2: "
result: .asciiz "Result is: "

.text
.globl main

main:
    li $t3, 1            
    beq $t3, $zero, skip_input_s0  
    li $v0, 4          
    la $a0, prompt_s0    
    syscall              # print prompt
    li $v0, 5            
    syscall              # read integer
    move $s0, $v0        
skip_input_s0:
    li $t3, 1           
    beq $t3, $zero, skip_input_s1  
    li $v0, 4            
    la $a0, prompt_s1    
    syscall              # print prompt
    li $v0, 5          
    syscall              # read integer
    move $s1, $v0       
skip_input_s1:
    li $t3, 1            
    beq $t3, $zero, skip_input_s2  
    li $v0, 4            
    la $a0, prompt_s2    
    syscall              # print prompt
    li $v0, 5            
    syscall              # read integer
    move $s2, $v0        
skip_input_s2:
    sra $t0, $s0, 3     

    # Calculatation $t0 = $t0 - 2 * $s1
    sll $t1, $s1, 1      
    sub $t0, $t0, $t1    

    # Calculatation $t0 = $t0 + $s2
    add $t0, $t0, $s2 

    li $v0, 4            
    la $a0, result       
    syscall              # print result string

    move $a0, $t0        
    li $v0, 1            
    syscall              # print integer

    li $v0, 10           
    syscall              
