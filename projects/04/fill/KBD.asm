

@SCREEN
D = A
@address
M = D			// address = 16384 (base address of the Hack screen)

@i
M = 0			// i = 0. need to do this every time the key
                    // status is changed. put inside loop


(LISTENING)
@KBD
D = M
@PRESSED
D;JGT     // if key is depressed, scan code appears
@LISTENING
0;JMP

// fill
(PRESSED)

   @i
   D = M        // D = i

   @address
   A = D+M		// A = @SCREEN + i
   M = -1		// RAM[A] = -1 (16 pixels)
 
   @i
   M = M + 1	// i = i + 1

   @LISTENING
   0;JMP


