# Playing in Assembly

Playing with Assembly to make my inner child self happy!

## References

- [Some Assembly Required](https://github.com/hackclub/some-assembly-required/blob/main/guide/table-of-contents.md)
- [Understanding Windows x64 Assembly](https://sonictk.github.io/asm_tutorial/) - For help getting this running on Windows since the guide/code was written for Mac

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
