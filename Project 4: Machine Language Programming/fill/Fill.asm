// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e.  writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//while true {
  //  if keyDown {
    //    pixel = black 
    // } else {
        // pixel = white 
    // }
//}

(LOOP)
    @SCREEN 
    D = A // get the screen start location and load it into data register 
    @R0
    M = D // store screen start location in RAM[R0]
(KBDCHECK)
    @KBD 
    D = M // load the value from KBD register into data register 
    @BLACK
    D; JGT // if key > 0, paint screen black 
    @WHITE 
    D; JEQ // paint screen white 
    @KBDCHECK 
    0; JMP 
(BLACK)
    @R1 
    M = -1
    @UPDATE // update the screen color 
    0; JMP
(WHITE)
    @R1
    M = 0
    @UPDATE // update the screen color 
    0; JMP
(UPDATE)
    @R1 
    D = M // load pixel color data from memory 
    @R0 
    A = M // get screen pixel address from memory 
    M = D // set screen pixel color
    @R0 
    D = M + 1 // go to next pixel
    @KBD 
    D = A - D // KBD - SCREEN = next pixel address 
    @R0 
    M = M + 1 // go to next pixel
    A = M // load the next pixel address 
    @UPDATE
    D; JGT // if A = 0, then entire screen is painted black 
@LOOP 
0; JMP
