
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
        (Main.fibonacci)
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
                @2
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        @SP
        AM=M-1
        D=M
        A=A-1 //XYtoMD
        D=M-D
        @TRUE0
        D;JLT
        @SP
        A=M-1
        M=0
        @CONTINUE0
        0;JMP
        (TRUE0)
        @SP
        A=M-1
        M=-1
        (CONTINUE0)
        
        @SP
        AM=M-1
        D=M
        @IF_TRUE
        D;JNE
        @IF_FALSE
        0;JMP
        (IF_TRUE)
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
        (IF_FALSE)
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
                @2
                D=A
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
        // push return-address
        @Main.fibonacciRETURN_ADDRESS1
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
        @1
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
        @Main.fibonacci
        0;JMP
        (Main.fibonacciRETURN_ADDRESS1)
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
                @1
                D=A
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
        // push return-address
        @Main.fibonacciRETURN_ADDRESS2
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
        @1
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
        @Main.fibonacci
        0;JMP
        (Main.fibonacciRETURN_ADDRESS2)
                @SP
                AM=M-1
                D=M
                A=A-1
                    M=M+D
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
                @4
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1
        // push return-address
        @Main.fibonacciRETURN_ADDRESS3
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
        @1
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
        @Main.fibonacci
        0;JMP
        (Main.fibonacciRETURN_ADDRESS3)
        (WHILE)
        @WHILE
        0;JMP