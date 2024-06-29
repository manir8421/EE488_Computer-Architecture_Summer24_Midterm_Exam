.data
prompt1: .asciiz "Enter value of t2: "
prompt2: .asciiz "Enter value of s1: "
result:  .asciiz "The result of, s3 = t2 / (s1 - 54321) is: "
div_zero: .asciiz "Division by zero error!\n"

.text
.globl main

main:
    li $v0, 4            
    la $a0, prompt1      
    syscall              # print prompt1

    li $v0, 5            
    syscall              
    move $t2, $v0        # store input in t2

    li $v0, 4            
    la $a0, prompt2      
    syscall              # print prompt2

    li $v0, 5           
    syscall             
    move $s1, $v0        # store input in s1

    li $t0, 54321        # load 54321 into $t0

    # Calculation s1 - 54321
    sub $t1, $s1, $t0

    # Check
    beq $t1, $zero, div_by_zero # if (s1 - 54321 == 0), handle division by zero

    # Calculate t2 / (s1 - 54321)
    div $t2, $t1        
    mflo $s3   

    li $v0, 4            
    la $a0, result
    syscall              # print result

    move $a0, $s3
    li $v0, 1
    syscall              # print integer

    li $v0, 10
    syscall

div_by_zero:
    li $v0, 4            
    la $a0, div_zero     
    syscall             

    li $v0, 10
    syscall
