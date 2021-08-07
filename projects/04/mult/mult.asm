// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// loop and addition

// for (i=0; i<M[0]; i++) {
//    acc += M[1]
// }

// @sum: M[sum] will be the accumulator. initialized to 0


@R0
D=M    //D = M[0]


@sum
M=0          // initialize accumulator to 0


(STOP)       // set the final value of accumulator to RAM[2]
    @sum
    D=M      // temporarily store M[sum] in D register
    @R2
    M=D       // set M[2] = M[sum]


(END)
    @END
    0;JMP





