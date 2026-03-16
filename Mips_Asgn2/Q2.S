    # assgn 2
    # problem 2
    # semester 5
    # group no. 44
    # Rithvik Thota(23CS10072)
    # Hadwik (23CS10052)

.data
prompt1:    .asciiz "Enter first non-negative integer: "
prompt2:    .asciiz "Enter second non-negative integer: "
error:      .asciiz "Error: Inputs must be non-negative integers.\n"
result_msg: .asciiz "The GCD is: "
newline:    .asciiz "\n"

.text
            .globl  main

main:
    la      $a0,                        prompt1                         # Prompt and read first integer
    li      $v0,                        4
    syscall

    li      $v0,                        5
    syscall
    move    $s0,                        $v0                             # s0 = first number

    la      $a0,                        prompt2                         # Prompt and read second integer
    li      $v0,                        4
    syscall

    li      $v0,                        5
    syscall
    move    $s1,                        $v0                             # s1 = second number

    move    $a0,                        $s0
    move    $a1,                        $s1
    jal     check_non_negative_values                                   # Call check_non_negative_values($s0, $s1)

    # If return value is 0 (invalid), exit
    beq     $v0,                        $zero,          exit_with_error

    move    $a0,                        $s0
    move    $a1,                        $s1
    jal     find_gcd
    move    $s2,                        $v0                             # s2 = result

    la      $a0,                        result_msg
    li      $v0,                        4
    syscall

    move    $a0,                        $s2                             # Print GCD
    li      $v0,                        1
    syscall

    la      $a0,                        newline                         # Print newline
    li      $v0,                        4
    syscall

    b       exit

check_non_negative_values:
    #checks the value of a0,a1 if it is zero then loads 0 in v0 and 1 if they are not.
    bltz    $a0,                        return_zero
    bltz    $a1,                        return_zero
    li      $v0,                        1
    jr      $ra

return_zero:
    li      $v0,                        0
    jr      $ra

exit:
    li      $v0,                        10
    syscall

find_gcd:
    beq     $a1,                        $zero,          gcd_base_case   # Base case: if $a1==0, return $a0

    addi    $sp,                        $sp,            -8              
    sw      $ra,                        4($sp)                         
    sw      $a0,                        0($sp)                           # Save $ra, $a0 on stack

    div     $a0,                        $a1
    mfhi    $t0                                                         # t0=a%b

    move    $a0,                        $a1                             # a=b
    move    $a1,                        $t0                             # b=a%b
    jal     find_gcd

    lw      $ra,                        4($sp)
    lw      $a0,                        0($sp)                          # Restore $ra, $a0 from stack
    addi    $sp,                        $sp,            8

    jr      $ra

gcd_base_case:
    move    $v0,                        $a0
    jr      $ra

exit_with_error:
    la      $a0,                        error
    li      $v0,                        4
    syscall

    b       exit
