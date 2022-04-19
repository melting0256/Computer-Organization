# This example shows an implementation of the mathematical
# factorial function (! function) to find the factorial value of !7 = 5040.

.data
argument: .word   10
data:     .word   5,3,6,7,31,23,43,12,45,1
str1:     .string "Array¡G¡@"
str2:     .string "Sorted¡G¡@"
str3:     .string " "
str4:     .string " \n "

.text
main:
        lw  s0, argument  
        la  s1, data  

        # Print the result to console
        la  a0, str1
        li  a7, 4
        ecall
        la  a0, str4
        li  a7, 4
        ecall

        jal ra, printArray
        
        jal ra, bubblesort
        
        la  a0, str2
        li  a7, 4
        ecall
        la  a0, str4
        li  a7, 4
        ecall
        
        jal ra, printArray
        # Exit program
        li a7, 10
        ecall

bubblesort:
        addi sp, sp, -48
        sw   ra, 40(sp)
        sw   t2, 32(sp)
        sw   t1, 24(sp)
        sw   s4, 16(sp)
        sw   s3, 8(sp)
        sw   s2, 0(sp)
        li   s2, 0
        forloop1:
            bge s2,s0, forloopexit1
            addi s3,s2, -1
        
        forloop2:
            blt s3,zero, forloopexit2
            slli a0,s3,2
            add  a0,a0, s1
            lw  t1,0(a0)
            lw  t2,4(a0)  
            bge t2,t1, forloopexit2
            mv  s4,s3
            jal ra, swap
            addi s3,s3, -1
            j forloop2
        
        forloopexit2:
            addi s2,s2, 1
            j forloop1
        
        forloopexit1:
            lw  s2,0(sp)
            lw  s3, 8(sp)
            lw  s4, 16(sp)
            lw  t1, 24(sp)
            lw  t2, 32(sp)
            lw  ra, 40(sp)
            addi sp,sp, 48
            ret

swap:
        slli a0,s4, 2
        add a0,a0, s1
        lw  t3,0(a0)
        lw  t4,4(a0)
        sw  t4,0(a0)
        sw  t3,4(a0) 
        ret

# --- printResult ---
# a0: Value which factorial number was computed from
# a1: Factorial result
printArray:
     li s5, 0
     loop:
       bge s5,s0, printexit
       slli a0,s5, 2
       add  a0,a0, s1
       lw  t0, 0(a0)
       mv  a0,t0 
       li  a7, 1
       ecall
       la  a0,str3
       li  a7,4
       ecall
       addi s5,s5,1
       j loop
     printexit:
       la  a0, str4
       li  a7, 4
       ecall
       ret
        
