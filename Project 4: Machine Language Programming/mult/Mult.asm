// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    @i 
    M = 1 // RAM[i] = 1; i = 1
    @sum 
    M = 0 // RAM[sum] = 0; sum = 0

(LOOP)
    @i
    D = M // D = RAM[i]
    @R0 
    D = D - M // D = D - RAM[R0]; load R0
    @STOP
    D; JGT // if i > R0 goto STOP 

    @R1
    D = M // D = RAM[R1]; load R1
    @sum
    M = D + M // RAM[sum] = D + RAM[sum]; sum = R1 + sum  
    @i
    M = M + 1 // i = RAM[i] + 1; i = i + 1
    @LOOP 
    0; JMP // goto LOOP 

(STOP)
    @sum 
    D = M // D = RAM[sum]
    @R2 
    M = D // RAM[R2] = sum

(END)
    @END
    0; JMP