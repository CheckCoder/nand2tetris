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

    // 初始化
    @R0 // R0 为 0 表示空白屏幕，为1表示为黑色屏幕
    M = 0;
    @24575 // R1 为屏幕最大地址
    D = A
    @R1
    M = D

// 循环检测
(loop)
    @KBD
    D = M
    // 为 0 ，清屏幕
    @clear
    D;JEQ
    @fill
    D;JNE
    (clear)
        @R0
        D = M
        @loop
        D;JNE // 为 0 跳转循环
        // 不为 0 清除屏幕
        @R0
        M = 0
        @set
        0;JMP
    (fill)
        @R0
        D = M - 1
        @loop
        D;JEQ // 为 1 跳转循环
        // 不为 0 填满屏幕
        @R0
        M = 1
        @set
        0;JMP
    (set)
        @R1
        D = M
        @R2
        M = D
        (setLoop)
            @R2
            D = M
            @SCREEN
            A = D - A
            D = A
            @loop
            D;JLT
            @R0
            D = M
            @R2
            M = D
            @R2
            M = M - 1
            @set
            0;JMP
            



        

