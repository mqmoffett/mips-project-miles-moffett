.data
prompt_msg:    .asciiz "Enter an integer N (N >= 22): "
error_msg:     .asciiz "Illegal Number!\n"
fib_label:     .asciiz "Fibonacci sequence:\n"
space_str:     .asciiz " "
newline_str:   .asciiz "\n"

.text
.globl main

main:

input_loop:
    li $v0, 4
    la $a0, prompt_msg
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       # store input N in $t0

    slti $t1, $t0, 22   # if N < 22, t1 = 1
    bne  $t1, $zero, illegal

    j start_fib
illegal:
    li $v0, 4
    la $a0, error_msg
    syscall
    j input_loop
start_fib:
    li $v0, 4
    la $a0, fib_label
    syscall
   li $t2, 0        # fib_prev = 0
    li $t3, 1        # fib_curr = 1
    li $t1, 1        # counter = 1 
 # print first number: 0
    li $v0, 1
    move $a0, $t2
    syscall
# print space
    li $v0, 4
    la $a0, space_str
    syscall
# print second number
    li $v0, 1
    move $a0, $t3
    syscall