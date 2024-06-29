.data
prompt1: .asciiz "Enter value of t4: "
prompt2: .asciiz "Enter value of t5: "
prompt3: .asciiz "Enter value of t6: "
result:  .asciiz "The result of, t3 = t4 + t5 - t6 is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall              # print prompt1

    li $v0, 5
    syscall              
    move $t4, $v0        # store input in t4

    li $v0, 4 
    la $a0, prompt2
    syscall              # print prompt2

    li $v0, 5         
    syscall         
    move $t5, $v0        # store input in t5

    li $v0, 4            
    la $a0, prompt3     
    syscall              # print prompt3

    li $v0, 5   
    syscall
    move $t6, $v0        # store input in t6

    # Compute calculation t3 = t4 + t5 - t6
    add $t3, $t4, $t5    # t3 = t4 + t5
    sub $t3, $t3, $t6    # t3 = t3 - t6

   
    li $v0, 4            
    la $a0, result  
    syscall              # print result 
    
    move $a0, $t3        
    li $v0, 1            
    syscall              # print integer


    li $v0, 10           
    syscall              
