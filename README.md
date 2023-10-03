# Playing in Assembly

Playing with Assembly to make my inner child happy!

## References

- [Some Assembly Required](https://github.com/hackclub/some-assembly-required/blob/main/guide/table-of-contents.md)
- [Understanding Windows x64 Assembly](https://sonictk.github.io/asm_tutorial/) - For help getting this running on Windows since the guide/code was written for Mac

## Thinking in Assembly

- Control flow is with compare and jump. Symbols: `cmp`, `jump`, `jl`

## Math

### Convert binary "1011001" to base 10:
    1 * 2^0 = 1
    0 * 2^1 = 0
    0 * 2^2 = 0
    1 * 2^3 = 8
    1 * 2^4 = 16
    0 * 2^5 = 0
    1 * 2^6 = 64

    1011001 (base 2) = 89 (in base 10)

### Base can be any number:
    Base 2 - binary
    Base 10 - decimal, our typical number system
    Base 16 - hexadecimal or hex for short

Using Programming calculator is really nice!

### Logic Gates:
    AND - always false unless both inputs are true
    OR - always true unless both inputs are false
    NOT - flips the input
    NAND - always true unless both inputs are true, opposite of AND
    NOR - always false unless both inputs are false, opposite of OR
    XOR - true if the inputs are different, false is they're the same
    XNOR - true if inputs are the same, false, if they're different, XNOR is the opposite of XOR

## Dictionary

### CPU

CPU - central processing unit, can only do a few things (1) Read data (2) Write data (3) perform simple math calculations via logic gates, everything in the CPU is just numbers, CPU also have a set of instructions physically built into the chip used for `opcodes`, a 64-bit CPU can hold 64 bits of data in it's registers which is 8-bytes
RAM - Random Access Memory, short-term (ephemeral) data that has a much larger capacity than the CPU's registers
Register - CPU's small storage, generally you get around 16 general use registers depending on the CPU, there are more than than but they are only used internally by the CPU
Instruction Categories - (1) opcodes, `add` (2) numeric value, `4` (3) letter, `"A"` (4) register, `rax` (5) memory address, `0x12345678`
Processor clock - a material that oscillates electricity running through the CPU at a certain frequency giving the CPU a "clock tick" which keep the CPU in sync as each tick is an execute of another instruction, today's CPU are measured in gigahertz (GHz) which are approximately *one billion cycles per second*

### Instruction Cycle

1. `Fetch` - grabs data from RAM
2. `Decode` - translates the data into an instruction CPU can understand, the first part of the data is the opcode and the rest are arguments
3. `Execute` - performs instruction, if arithmetic or logic instruction then performs extra work in the ALU (arithmetic-logic unit)

opcode - unique identifier for an action the CPU can execute, `add` which is really a number `4` (not actually 4)
arithmetic-logic unit aka. ALU - performs math or logic and returns value to register

### Data

bit - one unit of data, a 1 or 0
byte - a group of bits, the smallest collection of bits, 8 bits, fun fact it's 8-bits because of ASCII fitting all characters in the 255 size (technically a `nybble` is smaller but it isn't used often)
word - group of bytes, single word is 2 bytes, double word is 4 bytes, and quadruple word is 8 bytes
qword - shorthand for quadruple word

### Registers

Usually, 32-bit processor registers start with `e` (eax) whereas 64-bit processors start with `r` (rax)

General purpose but some instructions automatically set these:

rax - accumulator
rbx - base
rcx - counter
rdx - data
rdi - destination
rsi - source

General purpose:

r8 - user defined
r9 - user defined
r10 - user defined
r11 - user defined
r12 - user defined
r13 - user defined
r14 - user defined
r15 - user defined

Auto-set:

rbp - stack base pointer
rsp - stack pointer
rip - instruction pointer
eflags - status / condition

### Stack

A place to store data for later use, last-in first-out data structure.

1. Push - place a register value in the stack on top of all the previous values
2. Pop - retrieve a value from the top and put it in a register

Conventions for x86-64:

1. Arguments get pushed on the stack to "pass" into the "function"
2. Arguments get popped off the stack and into registers to access inside of our "function" (stored in r8-r15)
3. "Return" values get saved in rax
4. General purpose registers can be "callee-owned" or "caller-owned"

### Syntax

mov dest, source - store data in a register
add dest, source - addition, dest + source = stored in dest
sub dest, source - subtraction, dest - source = stored in dest
mul dest, source - multiplication, dest * source = stored in dest
jmp label - moves the instruction pointer via a label `.addNumbers`
cmp dest, source - compares two values and stores results in eflags register
jl label - stands for, *jump if less than*, by looking in the eflags register
call label - how assembly implements functions combined with `ret`
ret - returns to line after call
push source - store data on the stack and increment the stack pointer
pop dest - retrieve data off the stack and decrement the stack pointer