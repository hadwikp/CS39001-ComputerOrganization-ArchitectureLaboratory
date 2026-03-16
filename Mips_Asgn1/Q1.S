# assgn 1
# problem 1
# semester 5 
# group no. 44
# Rithvik Thota(23CS10072)
# Hadwik (23CS10052)



.data  #data segement
prompt1 : 
    .asciiz "Enter the first positive number\n"
prompt2 : 
    .asciiz "Enter the second positive number\n"
neg_prompt : 
    .asciiz "The given number is negative"
res_prompt :
    .asciiz  "GCD of the two integers is : "

newline :
    .asciiz "\n"


.text
.globl main
main :
    la $a0,prompt1
    li $v0,4
    syscall

    li $v0, 5  # read int1
    syscall

    blt $v0,0,exit # check for negative input , if -ve then go to exit label
    move $t0,$v0

    la $a0,prompt2
    li $v0,4
    syscall

    li $v0,5
    syscall

    blt $v0,0,exit
    move $t1,$v0

    beq $t0,0,endb # if second number is zero then return b using endb

loop :
    beq $t1,0,enda
    bgt $t0,$t1,suba
    bge $t1,$t0,subb

exit :
    la $a0, neg_prompt
    li $v0,4
    syscall

    la $a0, newline
    li $v0,4
    syscall
    
    li $v0,10
    syscall


endb :
    la $a0,res_prompt
    li $v0,4
    syscall

    move $a0,$t1
    li $v0,1
    syscall

    la $a0, newline
    li $v0,4
    syscall

    li $v0,10
    syscall

enda :
    la $a0,res_prompt
    li $v0,4
    syscall

    move $a0,$t0
    li $v0,1
    syscall

    la $a0, newline
    li $v0,4
    syscall

    li $v0,10
    syscall

suba :                       # a = a-b
    sub $t0,$t0,$t1
    b loop


subb :                       # b = b-a
    sub $t1,$t1,$t0
    b loop



