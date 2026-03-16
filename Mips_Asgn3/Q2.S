    # assgn 3
    # problem 2
    # semester 5
    # group no. 44
    # Rithvik Thota(23CS10072)
    # Hadwik (23CS10052)


.data
prompt_input:   .asciiz "Enter 8 integers to sort:\n"
prompt_sorted:  .asciiz "Sorted array:\n"
space:          .asciiz " "
newline:        .asciiz "\n"
                .align  2
array:          .word   0, 0, 0, 0, 0, 0, 0, 0              # reserve 8 words aligned

.text
                .globl  main

main:

    li      $v0,            4
    la      $a0,            prompt_input
    syscall

    la      $a0,            array
    li      $a1,            8
    jal     form_array

    la      $a0,            array
    li      $a1,            0
    li      $a2,            7
    jal     quicksort

    # print sorted
    li      $v0,            4
    la      $a0,            prompt_sorted
    syscall
    la      $a0,            array
    li      $a1,            8
    jal     print_array

    # exit
    li      $v0,            10
    syscall

form_array:
    li      $t0,            0                               # index i
read_loop:
    bge     $t0,            $a1,            read_done
    li      $v0,            5
    syscall                                                 # read integer
    sll     $t1,            $t0,            2
    add     $t2,            $a0,            $t1
    sw      $v0,            0($t2)
    addi    $t0,            $t0,            1
    j       read_loop
read_done:
    jr      $ra

    # quicksort(base, low, high)
quicksort:
    # reserve stack space and save registers
    addiu   $sp,            $sp,            -16             # make space for 4 registers
    sw      $ra,            12($sp)                         # save return address
    sw      $s0,            8($sp)                          # save s0
    sw      $s1,            4($sp)                          # save s1
    sw      $s2,            0($sp)                          # save s2

    # save args
    move    $s0,            $a0
    move    $s1,            $a1
    move    $s2,            $a2

    # if low < high
    slt     $t0,            $s1,            $s2
    beq     $t0,            $zero,          quicksort_end

    # partition
    move    $a0,            $s0
    move    $a1,            $s1
    move    $a2,            $s2
    jal     partition
    move    $t1,            $v0                             # pivot idx

    # sort left
    move    $a0,            $s0
    move    $a1,            $s1
    addi    $a2,            $t1,            -1
    jal     quicksort

    # sort right
    move    $a0,            $s0
    addi    $a1,            $t1,            1
    move    $a2,            $s2
    jal     quicksort

quicksort_end:
    #restore registers and stack
    lw      $ra,            12($sp)
    lw      $s0,            8($sp)
    lw      $s1,            4($sp)
    lw      $s2,            0($sp)
    addiu   $sp,            $sp,            16
    jr      $ra

    # partition(base, low, high): returns pivot index
partition:
    # calculate address of A[high]
    # sll shifts high index left by 2 bits (multiplies by 4) to get byte offset
    sll     $t0,            $a2,            2               # t0 = (high * 4)
    add     $t0,            $a0,            $t0             # t0 = address of A[high]
    lw      $t3,            0($t0)                          # t3 = pivot = A[high]

    # initialize i = low - 1
    addi    $t1,            $a1,            -1              # t1 = i
    move    $t2,            $a1                             # t2 = j = low

part_loop:
    # loop j from low to high - 1
    bge     $t2,            $a2,            part_after      # if j >= high, exit loop

    # load A[j]
    sll     $t4,            $t2,            2               # t4 = j * 4
    add     $t5,            $a0,            $t4             # t5 = &A[j]
    lw      $t6,            0($t5)                          # t6 = A[j]

    # if A[j] <= pivot, increment i and swap A[i] and A[j]
    ble     $t6,            $t3,            part_do         # branch if A[j] <= pivot
    j       part_next                                       # else skip swap

part_do:
    addi    $t1,            $t1,            1               # i++
    # compute address of A[i]
    sll     $t7,            $t1,            2               # t7 = i * 4
    add     $t8,            $a0,            $t7             # t8 = &A[i]
    lw      $t9,            0($t8)                          # t9 = A[i]
    # swap: A[i] = A[j]
    sw      $t6,            0($t8)
    sw      $t9,            0($t5)

part_next:
    addi    $t2,            $t2,            1               # j++
    j       part_loop

part_after:
    # place pivot in correct position: swap A[i+1] and A[high]
    addi    $t1,            $t1,            1               # i = i + 1
    sll     $t7,            $t1,            2               # t7 = i* 4
    add     $t8,            $a0,            $t7             # t8 = &A[i]
    lw      $t9,            0($t8)                          # t9 = A[i]
    lw      $t6,            0($t0)
    sw      $t6,            0($t8)                          # A[i] = pivot
    sw      $t9,            0($t0)                          # A[high] = A[i]

    move    $v0,            $t1
    jr      $ra

print_array:
    #save ra and s0
    addiu   $sp,            $sp,            -8              # reserve 2 words on stack
    sw      $ra,            4($sp)
    sw      $s0,            0($sp)

    move    $s0,            $a0                             # s0 = base address
    li      $t0,            0                               #i = 0
print_loop:
    bge     $t0,            $a1,            print_done
    sll     $t1,            $t0,            2
    add     $t2,            $s0,            $t1             # t2 = address
    lw      $t3,            0($t2)                          # t3 = A[i]

    move    $a0,            $t3
    li      $v0,            1
    syscall

    li      $v0,            4
    la      $a0,            space
    syscall

    addi    $t0,            $t0,            1
    j       print_loop
print_done:
    li      $v0,            4
    la      $a0,            newline
    syscall

    lw      $ra,            4($sp)
    lw      $s0,            0($sp)
    addiu   $sp,            $sp,            8               # release stack space
    jr      $ra
