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
    # for now, just exit the program
    li $v0, 10
    syscall