    # assgn 3
    # problem 1
    # semester 5
    # group no. 44
    # Rithvik Thota(23CS10072)
    # Hadwik (23CS10052)
    
.data
prompt_nc1: .asciiz "Enter number of cycles in first permutation: "
prompt_nc2: .asciiz "Enter number of cycles in second permutation: "
prompt_cl:  .asciiz "Enter length of cycle: "
prompt_el:  .asciiz "Enter elements of cycle (letters a-f, space-separated): "
perm1:      .word   6:6                                                         # Array for first permutation (a-f → 0-5)
perm2:      .word   6:6                                                         # Array for second permutation
result:     .word   6:6                                                         # Composed result of perm2 o perm1
visited:    .space  6                                                           # Flags to track visited elements (1 byte per element)
cycle_buf:  .space  6                                                           # Temporary buffer to hold cycle elements (max 6)
labels:     .asciiz "abcdef"                                                    # Character labels
space:      .asciiz " "
lparen:     .asciiz "("
rparen:     .asciiz ")"
newline:    .asciiz "\n"

.text
            .globl  main

main:
    # Initialize perm1 as identity permutation (i.e., perm1[i] = i)
    la      $a1,            perm1
    li      $t0,            0
fill1:
    li      $t1,            6
    beq     $t0,            $t1,        read1
    mul     $t2,            $t0,        4
    add     $t3,            $a1,        $t2
    sw      $t0,            0($t3)
    addi    $t0,            $t0,        1
    j       fill1

    # Read first permutation from user input
read1:
    # Ask for number of cycles in first permutation
    li      $v0,            4
    la      $a0,            prompt_nc1
    syscall
    li      $v0,            5
    syscall
    move    $s0,            $v0                                                 # $s0 stores number of cycles
    li      $s1,            0                                                   # Cycle index

read1_loop:
    beq     $s1,            $s0,        setup2                                  # Done reading all cycles
    # Ask for length of this cycle
    li      $v0,            4
    la      $a0,            prompt_cl
    syscall
    li      $v0,            5
    syscall
    move    $t4,            $v0                                                 # $t4 = length of current cycle

    # Prompt to enter cycle elements
    li      $v0,            4
    la      $a0,            prompt_el
    syscall

    li      $t5,            0                                                   # Index in current cycle
read1_elems:
    beq     $t5,            $t4,        store1_cycle
    li      $v0,            12                                                  # Read character
    syscall
    li      $t8,            97                                                  # ASCII of 'a'
    sub     $v0,            $v0,        $t8                                     # Convert char to index (a→0, b→1, ..., f→5)
    blt     $v0,            $zero,      read1_elems
    bgt     $v0,            5,          read1_elems
    la      $t6,            cycle_buf
    add     $t7,            $t6,        $t5
    sb      $v0,            0($t7)
    addi    $t5,            $t5,        1
    j       read1_elems

    # Store mapping from input cycle into perm1
store1_cycle:
    li      $v0,            4
    la      $a0,            newline
    syscall

    li      $t5,            0
store1_k:
    add     $t6,            $t5,        1
    beq     $t6,            $t4,        store1_last
    la      $t7,            cycle_buf
    add     $t8,            $t7,        $t5
    lb      $t9,            0($t8)
    add     $t8,            $t7,        $t6
    lb      $s2,            0($t8)
    mul     $s3,            $t9,        4
    la      $s4,            perm1
    add     $s5,            $s4,        $s3
    sw      $s2,            0($s5)
    addi    $t5,            $t5,        1
    j       store1_k

    # Handle wraparound mapping in cycle (last→first)
store1_last:
    li      $t5,            0
    add     $t6,            $t4,        -1
    la      $t7,            cycle_buf
    add     $t8,            $t7,        $t6
    lb      $t9,            0($t8)
    la      $t7,            cycle_buf
    lb      $s2,            0($t7)
    mul     $s3,            $t9,        4
    la      $s4,            perm1
    add     $s5,            $s4,        $s3
    sw      $s2,            0($s5)
    addi    $s1,            $s1,        1
    j       read1_loop

    # Repeat process for second permutation
setup2:
    # Identity perm2
    la      $a1,            perm2
    li      $t0,            0
fill2:
    li      $t1,            6
    beq     $t0,            $t1,        read2
    mul     $t2,            $t0,        4
    add     $t3,            $a1,        $t2
    sw      $t0,            0($t3)
    addi    $t0,            $t0,        1
    j       fill2

read2:
    li      $v0,            4
    la      $a0,            prompt_nc2
    syscall
    li      $v0,            5
    syscall
    move    $s0,            $v0
    li      $s1,            0

read2_loop:
    beq     $s1,            $s0,        compose
    li      $v0,            4
    la      $a0,            prompt_cl
    syscall
    li      $v0,            5
    syscall
    move    $t4,            $v0

    li      $v0,            4
    la      $a0,            prompt_el
    syscall

    li      $t5,            0
read2_elems:
    beq     $t5,            $t4,        store2_cycle
    li      $v0,            12
    syscall
    li      $t8,            97
    sub     $v0,            $v0,        $t8
    blt     $v0,            $zero,      read2_elems
    bgt     $v0,            5,          read2_elems
    la      $t6,            cycle_buf
    add     $t7,            $t6,        $t5
    sb      $v0,            0($t7)
    addi    $t5,            $t5,        1
    j       read2_elems

store2_cycle:
    li      $v0,            4
    la      $a0,            newline
    syscall

    li      $t5,            0
store2_k:
    add     $t6,            $t5,        1
    beq     $t6,            $t4,        store2_last
    la      $t7,            cycle_buf
    add     $t8,            $t7,        $t5
    lb      $t9,            0($t8)
    add     $t8,            $t7,        $t6
    lb      $s2,            0($t8)
    mul     $s3,            $t9,        4
    la      $s4,            perm2
    add     $s5,            $s4,        $s3
    sw      $s2,            0($s5)
    addi    $t5,            $t5,        1
    j       store2_k

store2_last:
    li      $t5,            0
    add     $t6,            $t4,        -1
    la      $t7,            cycle_buf
    add     $t8,            $t7,        $t6
    lb      $t9,            0($t8)
    la      $t7,            cycle_buf
    lb      $s2,            0($t7)
    mul     $s3,            $t9,        4
    la      $s4,            perm2
    add     $s5,            $s4,        $s3
    sw      $s2,            0($s5)
    addi    $s1,            $s1,        1
    j       read2_loop

    # Compose result = perm2 o perm1
compose:
    la      $t0,            perm1
    la      $t1,            perm2
    la      $t2,            result
    li      $t3,            0
comp_loop:
    li      $t4,            6
    beq     $t3,            $t4,        print_all
    mul     $t5,            $t3,        4
    add     $t6,            $t0,        $t5
    lw      $t7,            0($t6)
    mul     $t8,            $t7,        4
    add     $t9,            $t1,        $t8
    lw      $s0,            0($t9)
    add     $s1,            $t2,        $t5
    sw      $s0,            0($s1)
    addi    $t3,            $t3,        1
    j       comp_loop

    # Display composed permutation in cycle notation
print_all:
    # Clear visited flags
    la      $t0,            visited
    li      $t1,            0
clr_vis:
    li      $t2,            6
    beq     $t1,            $t2,        walk
    add     $t3,            $t0,        $t1
    sb      $zero,          0($t3)
    addi    $t1,            $t1,        1
    j       clr_vis

walk:
    li      $t0,            0                                                   # Current index
next_i:
    li      $t1,            6
    beq     $t0,            $t1,        done_print

    # Skip singleton cycle
    mul     $t5,            $t0,        4
    la      $t6,            result
    add     $t7,            $t6,        $t5
    lw      $t8,            0($t7)
    beq     $t8,            $t0,        mark_and_next

    # Skip if already visited
    la      $t2,            visited
    add     $t3,            $t2,        $t0
    lb      $t4,            0($t3)
    bne     $t4,            $zero,      inc_i_p

    # Begin printing a cycle
    move    $s7,            $t0
    li      $t8,            0
    li      $v0,            4
    la      $a0,            lparen
    syscall

cw_loop:
    # Mark as visited
    la      $t2,            visited
    add     $t3,            $t2,        $t0
    li      $t5,            1
    sb      $t5,            0($t3)

    # Print letter
    la      $t6,            labels
    add     $t7,            $t6,        $t0
    lb      $a0,            0($t7)
    li      $v0,            11
    syscall

    # Move to next in cycle
    mul     $t9,            $t0,        4
    la      $t2,            result
    add     $t3,            $t2,        $t9
    lw      $t0,            0($t3)
    addi    $t8,            $t8,        1
    bne     $t0,            $s7,        print_sp_p

    # Close current cycle
    li      $v0,            4
    la      $a0,            rparen
    syscall
    li      $v0,            4
    la      $a0,            space
    syscall
    j       inc_i_p

print_sp_p:
    li      $v0,            4
    la      $a0,            space
    syscall
    j       cw_loop

mark_and_next:
    # Mark single element as visited
    la      $t2,            visited
    add     $t3,            $t2,        $t0
    li      $t5,            1
    sb      $t5,            0($t3)

inc_i_p:
    addi    $t0,            $t0,        1
    j       next_i

done_print:
    li      $v0,            4
    la      $a0,            newline
    syscall
    li      $v0,            10
    syscall
