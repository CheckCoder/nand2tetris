const code = require('./code');
const { destBinary, compBinary, jumpBinary } = code;
const symbolTable = require('./symbolTable');
const { addEntry, addEntryByAddress, contains, getAddress } = symbolTable;

let instuctions;
let nowInstruction;

function parser(inInstructions) {
    instuctions = [...inInstructions];
    let pc = -1;
    // 第一遍
    while (hasMoreCommands()) {
        advance();
        if (isInstructionVaild()) {
            removeAnnotation();
            let type = commandType();
            if (type === 'A' || type === 'C') {
                pc++;
            } else {
                addEntryByAddress(symbol(), pc + 1);
            }
        }
    }
    // 第二遍
    instuctions = inInstructions;
    let binaryOut = '';
    while (hasMoreCommands()) {
        advance();
        if (isInstructionVaild()) {
            removeAnnotation();
            let type = commandType();
            if (type === 'A') {
                let token = symbol();
                if (isNaN(parseInt(token))) {
                    if (contains(token)) {
                        token = getAddress(token);
                    } else {
                        token = addEntry(token);
                    }
                }
                binaryOut += `${int2Binary(token)}\r\n`;
            } else if (type === 'C') {
                let comp = compBinary(compString());
                let dest = destBinary(destString());
                let jump = jumpBinary(jumpString());
                binaryOut += `111${comp}${dest}${jump}\r\n`;
            }
        }
    }
    return binaryOut;
}

function hasMoreCommands() {
    return instuctions.length > 0;
}

function advance() {
    nowInstruction = instuctions.shift().trim();
}

function isInstructionVaild() {
    return nowInstruction !== '' && nowInstruction.indexOf('//') !== 0;
}

// 去除注释
function removeAnnotation() {
    nowInstruction = nowInstruction.split('//')[0].trim();
}

function commandType() {
    if (nowInstruction.charAt(0) === '@') {
        return 'A';
    } else if (nowInstruction.charAt(0) === '(') {
        return 'L';
    } else {
        return 'C';
    }
}

function symbol() {
    let type = commandType();
    if (type === 'A') {
        return nowInstruction.substring(1);
    } else if (type === 'L') {
        return nowInstruction.substring(1, nowInstruction.length - 1);
    }
}

function destString() {
    if (nowInstruction.includes('=')) {
        return nowInstruction.split('=')[0].trim();
    } else {
        return 'null';
    }
}

function compString() {
    let comp = nowInstruction;
    if (nowInstruction.includes('=')) {
        comp = comp.split('=')[1];
    }
    if (nowInstruction.includes(';')) {
        comp = comp.split(';')[0];
    }
    return comp.split(' ').join('');
}

function jumpString() {
    if (nowInstruction.includes(';')) {
        return nowInstruction.split(';')[1].trim();
    } else {
        return 'null';
    }
}

function int2Binary(num) {
    let str = parseInt(num).toString(2);
    while(str.length !== 16) {
        str = '0' + str;
    }
    return str;
}

module.exports = parser;