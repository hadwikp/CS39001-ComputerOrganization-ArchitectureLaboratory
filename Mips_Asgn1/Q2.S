# assgn 1
# problem 2
# semester 5 
# group no. 44
# Rithvik Thota(23CS10072)
# Hadwik (23CS10052)


.data
prompt1 :
    .asciiz "Enter a postive integer : "
res :
    .asciiz "Entered number is a perfect number.\n"
no_res :
    .asciiz "Entered number is not a perfect number.\n"
neg_input :
    .asciiz "The given number is not positive.\n"

.text
.globl main

main :
    
    la $a0,prompt1
    li $v0,4
    syscall

    li $v0,5
    syscall
    move $s0,$v0

    ble $s0,0,ex
    jal isPerfect

isPerfect :
    li $s2,0 #sum
    li $s1,0 #index
    addi $s1,$s1,1 
    loop :
        beq $s1,$s0,end
        div $s0, $s1
        mfhi $t2
        beq $t2,0,addme
        bne $t2,0,add2
ex :
    la $a0,neg_input
    li $v0,4
    syscall

    li $v0,10
    syscall

end :
    beq $s2,$s0,ok
    
    la $a0,no_res
    li $v0,4
    syscall

    li $v0,10
    syscall
    jr $ra

ok :
    la $a0,res
    li $v0,4
    syscall

    li $v0,10
    syscall

    jr $ra

addme :
    add $s2 ,$s2,$s1
    b add2
add2: 
    addi $s1,$s1,1
    b loop

