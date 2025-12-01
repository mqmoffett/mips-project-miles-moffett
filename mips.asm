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