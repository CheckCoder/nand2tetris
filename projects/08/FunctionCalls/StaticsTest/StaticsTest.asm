
        @256
        D=A
        @SP
        M=D
        
        // push return-address
        @Sys.initRETURN_ADDRESS0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push 
            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
        @undefined
        D=A
        @5
        D=D+A
        @SP
        D=M-D
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @Sys.init
        0;JMP
        (Sys.initRETURN_ADDRESS0)
        (Class1.set)
                    @ARG
                        D=M
                        @0
                        A=D+A
                        D=M
                        @SP
                        A=M
                        M=D
                        @SP
                        M=M+1
                    @SP
                    AM=M-1
                    D=M
                    @Class1.0
                    M=D
                    @ARG
                        D=M
                        @1
                        A=D+A
                        D=M
                        @SP
                        A=M
                        M=D
                        @SP
                        M=M+1
                    @SP
                    AM=M-1
                    D=M
                    @Class1.1
                    M=D
                @0
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        @LCL
        D=M
        @R13
        M=D
        @5
        A=D-A
        D=M
        @R14 // 返回地址
        M=D
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        @ARG
        D=M+1
        @SP
        M=D
        
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
        @R14
        A=M
        0;JMP
        (Class1.get)
                    @Class1.0
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1
                    @Class1.1
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1
                @SP
                AM=M-1
                D=M
                A=A-1
                    M=M-D
        @LCL
        D=M
        @R13
        M=D
        @5
        A=D-A
        D=M
        @R14 // 返回地址
        M=D
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        @ARG
        D=M+1
        @SP
        M=D
        
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
        @R14
        A=M
        0;JMP
        (Class2.set)
                    @ARG
                        D=M
                        @0
                        A=D+A
                        D=M
                        @SP
                        A=M
                        M=D
                        @SP
                        M=M+1
                    @SP
                    AM=M-1
                    D=M
                    @Class2.0
                    M=D
                    @ARG
                        D=M
                        @1
                        A=D+A
                        D=M
                        @SP
                        A=M
                        M=D
                        @SP
                        M=M+1
                    @SP
                    AM=M-1
                    D=M
                    @Class2.1
                    M=D
                @0
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        @LCL
        D=M
        @R13
        M=D
        @5
        A=D-A
        D=M
        @R14 // 返回地址
        M=D
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        @ARG
        D=M+1
        @SP
        M=D
        
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
        @R14
        A=M
        0;JMP
        (Class2.get)
                    @Class2.0
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1
                    @Class2.1
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1
                @SP
                AM=M-1
                D=M
                A=A-1
                    M=M-D
        @LCL
        D=M
        @R13
        M=D
        @5
        A=D-A
        D=M
        @R14 // 返回地址
        M=D
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        @ARG
        D=M+1
        @SP
        M=D
        
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
        @R14
        A=M
        0;JMP
        (Sys.init)
                @6
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
                @8
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        // push return-address
        @Class1.setRETURN_ADDRESS1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push 
            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
        @2
        D=A
        @5
        D=D+A
        @SP
        D=M-D
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @Class1.set
        0;JMP
        (Class1.setRETURN_ADDRESS1)
                    @R5
                    D=A
                    @0
                    D=D+A
                    @R13
                    M=D
                    @SP
                    AM=M-1
                    D=M
                    @R13
                    A=M
                    M=D
                @23
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
                @15
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        // push return-address
        @Class2.setRETURN_ADDRESS2
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push 
            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
        @2
        D=A
        @5
        D=D+A
        @SP
        D=M-D
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @Class2.set
        0;JMP
        (Class2.setRETURN_ADDRESS2)
                    @R5
                    D=A
                    @0
                    D=D+A
                    @R13
                    M=D
                    @SP
                    AM=M-1
                    D=M
                    @R13
                    A=M
                    M=D
        // push return-address
        @Class1.getRETURN_ADDRESS3
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push 
            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
        @0
        D=A
        @5
        D=D+A
        @SP
        D=M-D
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @Class1.get
        0;JMP
        (Class1.getRETURN_ADDRESS3)
        // push return-address
        @Class2.getRETURN_ADDRESS4
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push 
            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
        @0
        D=A
        @5
        D=D+A
        @SP
        D=M-D
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @Class2.get
        0;JMP
        (Class2.getRETURN_ADDRESS4)
        (WHILE)
        @WHILE
        0;JMP