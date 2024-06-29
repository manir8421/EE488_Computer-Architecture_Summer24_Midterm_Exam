.data
prompt: .asciiz "Please type string: "
result: .asciiz "You typed: "
input:  .space  256    # allocate space for the input string

.text
.globl main

main:
    li $v0, 4            
    la $a0, prompt      
    syscall              # print prompt

    li $v0, 8           
    la $a0, input       
    li $a1, 256          
    syscall        
    move $t0, $a0   

    li $v0, 4           
    la $a0, result     
    syscall     

    move $a0, $t0        
    li $v0, 4           
    syscall              # print the string

    li $v0, 10           
    syscall            
