# assgn 2
# problem 1
# semester 5
# group no. 44
# Rithvik Thota(23CS10072)
# Hadwik (23CS10052)

# we are storing the value to be added in the next loop in t2 and checking if it is zero, then we end the loop.

.data
prompt:     .asciiz "Enter an integer input : "
newline:    .asciiz "\n"
dott:       .asciiz "."
output:     .asciiz "e^x is approximately = "

.text
            .globl  main


main:
    #taking input
    la      $a0,    prompt
    li      $v0,    4
    syscall

    li      $v0,    5
    syscall
    move    $t0,    $v0                         # t0  = x


    move    $t1,    $zero                       #current sum
    addi    $t1,    $t1,        100
    move    $t2,    $zero                       #value to be added in every loop (x^i/i!)
    addi    $t2,    $t2,        100
    move    $t3,    $zero                       #power of x
    addi    $t3,    $t3,        1               #initialized to 1


loop:
    beq     $t2,    0,          end_loop        #end loop when the next added term is going to be "zero"
    mul     $t2,    $t2,        $t0
    div     $t2,    $t3                         # curr_elem = ( prev_elem * x )/(i)
    mflo    $t2
    add     $t1,    $t1,        $t2             # curr_sum = curr_sum + curr_elem
    addi    $t3,    $t3,        1               # i++
    b       loop

end_loop:
    move    $t4,    $zero
    addi    $t4,    $t4,        100             #saved 100 to divide
    div     $t1,    $t4
    mflo    $t5
    mfhi    $t4

    la      $a0,    output                      #output prompt
    li      $v0,    4
    syscall

    move    $a0,    $t5                         #output result, integer part
    li      $v0,    1
    syscall

    la      $a0,    dott
    li      $v0,    4
    syscall

    move    $t7,    $zero
    addi    $t7,    $t7,        10
    blt     $t4,    $t7,        print_zero      # if remainder <10 we need to print an extra "0"
    move    $a0,    $t4                         #output result, fractional part
    li      $v0,    1
    syscall

    la      $a0,    newline
    li      $v0,    4
    syscall

    b       exit

print_zero:
    move    $a0,    $zero
    li      $v0,    1
    syscall

    move    $a0,    $t4                         #output result, fractional part
    li      $v0,    1
    syscall

    la      $a0,    newline
    li      $v0,    4
    syscall

    b       exit

exit:
    li      $v0,    10
    syscall




