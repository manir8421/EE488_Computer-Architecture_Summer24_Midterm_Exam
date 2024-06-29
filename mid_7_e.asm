.data
  result_msg: .asciiz "Value 32768 stored at memory address: "

.text
.globl main

main:
  addi $t0, $a0, 16      
  andi $t0, $t0, -4      

  li $t1, 32768          
  sw $t1, 0($t0)        


  li $v0, 4              
  la $a0, result_msg     
  syscall                


  li $v0, 1              
  move $a0, $t0          
  syscall             

  li $v0, 10             
  syscall            
