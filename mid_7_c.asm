.data
prompt: .asciiz "Enter value for t3: "
error:  .asciiz "Error: Invalid input (negative value)! Please enter a non-negative value.\n"
result: .asciiz "The value of t3 is: "

.text
.globl main

main:
input_loop:
    li $v0, 4            
    la $a0, prompt       
    syscall              # print prompt

    li $v0, 5            
    syscall              
    move $t3, $v0        

    # Check
    bltz $t3, input_error # if t3 < 0, jump to input_error

    li $v0, 4            
    la $a0, result       
    syscall             

    move $a0, $t3        
    li $v0, 1            
    syscall              # print integer

    li $v0, 10           
    syscall              

input_error:
    li $v0, 4            
    la $a0, error        
    syscall              # print error message

    # Jump back to input_loop to prompt user again for type input
    j input_loop
