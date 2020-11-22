// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// 3*2 换算成 2个3相加
// R0 * R1 = R2（R1个R0相乘）

    // 初始化
    @R2
    M = 0

    // 判断R1是否为负数
    @R1
    D = M
    @END
    D;JLT

// 循环+
(loop)
    // 判断是否为0，为0则跳出
    @R1
    D = M
    @END
    D;JEQ
    // R1--
    @R1
    M = M -1
    // 累加
    @R0
    D = M
    @R2
    M = D + M
    // 跳回
    @loop
    0;JMP

// 标准结束语句
(END)
    @END
    0;JMP