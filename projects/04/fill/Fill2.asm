    // 24576为键盘的地址 16384-24575 刚好8K 为屏幕的地址
    @24575
    D = A

    // R0存储屏幕最大地址
    @0
    M = D

    // R1存储屏幕当前地址
    @SCREEN
    D = A
    @1
    M = D
(LOOP)
    @KBD
    D = M
    @FILL
    D;JGT

    @CLEAR
    0;JMP
(FILL)
    // 判断屏幕是否为满
    @0
    D = M
    @1
    D = D - M
    @LOOP
    D;JLT

    @1
    // 缓存当前地址
    D = M
    // 将当前地址推入A
    A = M
    // 将地址对应的屏幕位置变黑
    M = -1

    // 当前地址+1
    @1
    M = D + 1

    @LOOP
    0;JMP
(CLEAR)
    // 判断屏幕是否为空
    @SCREEN
    D = A
    @1
    D = D - M
    @LOOP
    D;JGT

    @1
    // 缓存当前地址
    D = M
    // 将当前地址推入A
    A = M
    // 将地址对应的屏幕位置变白
    M = 0

    // 当前地址-1
    @1
    M = D - 1

    @LOOP
    0;JMP