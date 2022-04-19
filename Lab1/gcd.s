# This example shows an implementation of the mathematical
# factorial function (! function) to find the factorial value of !7 = 5040.

.data
argument1: .word   4
argument2: .word   8
str1:     .string "GCD value of "
str2:     .string " and "
str3:     .string " is "

.text
main:
        lw  a0, argument1   # Load argument from static data
        lw  a1, argument2
        jal ra, gcd       # Jump-and-link to the 'fact' label

        # Print the result to console
        mv  a2, a0
        lw  a0, argument1
        lw  a1, argument2
        jal ra, printResult

        # Exit program
        li a7, 10
        ecall

gcd:
        addi sp, sp, -24
        sw   ra, 16(sp)
        sw   a1, 8(sp)
        sw   a0, 0(sp)
        addi t0, a1, -1
        bge  t0, zero, ngcd

        add a0, zero, a0
        addi sp, sp, 24
        jr x1

ngcd:
        addi  t1,a1, 0
        rem  a1,a0, t1
        addi  a0,t1, 0
        jal  ra, gcd

  #     lw   a0, 0(sp)
  #     lw   a1, 8(sp)
        lw   ra, 16(sp)
        addi sp, sp, 24
        ret

# --- printResult ---
# a0: Value which factorial number was computed from
# a1: Factorial result
printResult:
        mv t0, a0
        mv t1, a1
        mv t2, a2
        la a0, str1
        li a7, 4
        ecall
        mv a0, t0
        li a7, 1
        ecall
        la a0, str2
        li a7, 4
        ecall
        mv a0, t1
      # lw a0, argument2  
        li a7, 1
        ecall
        la a0, str3
        li a7, 4
        ecall
        mv a0, t2
        li a7, 1
        ecall
        ret
