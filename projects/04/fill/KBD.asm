@SCREEN
D = A
@address
M = D			// address = 16384 (base address of the Hack screen)

(LISTENING)
@KBD
D = M

@PRESSED
D;JGT     // if key is depressed, scan code appears

@UNPRESSED
D;JMP

(UNPRESSED)
   @0
   D=A          // D = 8191
   @address
   A=M         // A = 16354 (M[address])
   M = D		// RAM[16354] = M[@SCREEN] = + 2^15-1 (16 pixels)
   @LISTENING
   0;JMP

(PRESSED)
   @address
   A=M         // A = 16354
   M = -1		// RAM[A] = -1 (16 pixels)
   @LISTENING
   0;JMP











