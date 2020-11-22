let fileName;
let index = 0;

function setFileName(inFileName) {
    fileName = inFileName;
}

function writeInit() {
    return `
        @256
        D=A
        @SP
        M=D
        ${writeCall('call Sys.init 0')}`;
}

function writeArithmetic(command) {
    let letXYToMD = `
                @SP
                AM=M-1
                D=M
                A=A-1`;
    let letYToM = `
                @SP
                A=M-1`;
    switch (command) {
        case 'add':
            return letXYToMD + `
                    M=M+D`;
        case 'sub':
            return letXYToMD + `
                    M=M-D`;
        case 'neg':
            return letYToM + `
                    M=-M`;
        case 'eq':
            return createJudgementString('JEQ', index++);
        case 'gt':
            return createJudgementString('JGT', index++);
        case 'lt':
            return createJudgementString('JLT', index++);
        case 'and':
            return letXYToMD + `
                M=M&D`;
        case 'or':
            return letXYToMD + `
                M=M|D`;
        case 'not':
            return letYToM + `
                M=!M`;
    }
}

function writePushPop(command) {
    let args = command.split(' ');
    let type = args[0];
    let arg1 = args[1];
    let arg2 = args[2];

    switch (arg1) {
        case 'constant':
            return `
                @${arg2}
                D=A
                @SP
                A=M
                M=D
                @SP
                M=M+1`
        case 'static':
            if (type === 'push') {
                return `
                    @${fileName}.${arg2}
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1`;
            } else { // pop
                return `
                    @SP
                    AM=M-1
                    D=M
                    @${fileName}.${arg2}
                    M=D`;
            }
        case 'pointer':
            if (arg2 == 0) {
                arg1 = 'THIS';
            } else {
                arg1 = 'THAT'
            }
            if (type === 'push') {
                return `
                    @${arg1}
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1`;
            } else {
                return `
                    @SP
                    AM=M-1
                    D=M
                    @${arg1}
                    M=D`;
            }
        case 'temp':
            if (type == 'push') {
                return `
                    @R5
                    D=A
                    @${arg2}
                    A=D+A
                    D=M
                    @SP
                    A=M
                    M=D
                    @SP
                    M=M+1`;
            } else {
                return `
                    @R5
                    D=A
                    @${arg2}
                    D=D+A
                    @R13
                    M=D
                    @SP
                    AM=M-1
                    D=M
                    @R13
                    A=M
                    M=D`;
            }
        default:
            let str = '';
            if (arg1 === 'local') {
                str = `
                    @LCL`;
            } else if (arg1 === 'argument') {
                str = `
                    @ARG`;
            } else { // this that
                str = `
                    @${arg1.toUpperCase()}`;
            }
            if (type === 'push') {
                return str + `
                        D=M
                        @${arg2}
                        A=D+A
                        D=M
                        @SP
                        A=M
                        M=D
                        @SP
                        M=M+1`;
            } else {
                return str + `
                        D=M
                        @${arg2}
                        D=D+A
                        @R13
                        M=D
                        @SP
                        AM=M-1
                        D=M
                        @R13
                        A=M
                        M=D`;
            }
    }
}

function createJudgementString(judge, index) {
    return `
        @SP
        AM=M-1
        D=M
        A=A-1 //XYtoMD
        D=M-D
        @TRUE${index}
        D;${judge}
        @SP
        A=M-1
        M=0
        @CONTINUE${index}
        0;JMP
        (TRUE${index})
        @SP
        A=M-1
        M=-1
        (CONTINUE${index})
        `;
}

function writeLabel(command) {
    let label = arg1(command);
    return `
        (${label})`;
}

function writeGoto(command) {
    let label = arg1(command);
    return `
        @${label}
        0;JMP`;
}

function writeIf(command) {
    let label = arg1(command);
    return `
        @SP
        AM=M-1
        D=M
        @${label}
        D;JNE`;
}

let callIndex = -1; // 保证return address是label唯一的
const callArray = ['LCL', 'ARG', 'THIS', 'THAT'];
function writeCall(command) {
    callIndex++;
    let functionName = arg1(command);
    let argumentNum = arg2(command);
    let output = `
        // push return-address
        @${functionName}RETURN_ADDRESS${callIndex}
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        // push `;
    callArray.forEach(label => {
        output += `
            @${label}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1`;
    });
    return output + `
        @${argumentNum}
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
        @${functionName}
        0;JMP
        (${functionName}RETURN_ADDRESS${callIndex})`;
}

const pointerArray = ['THAT', 'THIS', 'ARG', 'LCL'];
function writeReturn() {
    let str = '';
    pointerArray.forEach(label => {
        str += `
            @R13
            D=M-1
            AM=D
            D=M
            @${label}
            M=D`;
    });

    return `
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
        ${str}
        @R14
        A=M
        0;JMP`;
}

function writeFunction(command) {
    let functionName = arg1(command);
    let localNum = arg2(command);
    let output = `
        (${functionName})`;
    while (localNum--) {
        output += `
            ${writePushPop('push constant 0')}`;
    }
    return output;
}

function arg1(command) {
    let args = command.split(' ');
    return args[1];
}

function arg2(command) {
    let args = command.split(' ');
    return args[2];
}

module.exports = {
    writeInit,
    writeLabel,
    writeGoto,
    writeIf,
    writeCall,
    writeReturn,
    writeFunction,
    writePushPop,
    writeArithmetic,
    setFileName
};