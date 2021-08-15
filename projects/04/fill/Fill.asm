// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// while (true)
// if KBD then fill else unfill

// 




// @R0
// D = M
// @n
// M = D			// n = RAM[0]. 

@8191
D = A
@R0
M = A                // RAM[0] = 8191




@SCREEN
D = A
@address
M = D			// address = 16384 (base address of the Hack screen)


(LISTENING)
@KBD
D = M
@LISTENING
0;JMP

//@PRESSED
//D;JGT     // if key is depressed, scan code appears




// unfill
// fill
(NOTPRESSED)
   @i
   M = 0			// i = 0. need to do this every time the key
                    // status is changed. put inside loop
   @i
   D = M
   @n
   D = D - M
   @END
   D;JGT		// if i > n goto END

   @address
   A = M		// writing to memory using a pointer
   M = -32767		// RAM[address] = -(2^15-1) (16 pixels)
 
   @i
   M = M + 1	// i = i + 1
   @1
   D = A
   @address
   M = D + M	// address = address + 32
   @NOTPRESSED
   0;JMP		// goto LOOP

@LISTENING
0;JMP



// fill
(PRESSED)
   @i
   M = 0			// i = 0. need to do this every time the key
                    // status is changed. put inside loop
   @i
   D = M
   @n
   D = D - M
   @END
   D;JGT		// if i > n goto END

   @address
   A = M		// writing to memory using a pointer
   M = -1		// RAM[address] = -1 (16 pixels)
 
   @i
   M = M + 1	// i = i + 1
   @1
   D = A
   @address
   M = D + M	// address = address + 32
   @PRESSED
   0;JMP		// goto LOOP

// instead of END, will need to LISTEN
 // (END)
  //   @END		// program's end
  //   0;JMP		// infinite loop
@LISTENING
0;JMP