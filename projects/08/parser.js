const codeWriter = require('./codeWriter');
let commands;
let nowCommand;
let output;

function parser(inCommands, fileName) {
    commands = inCommands;
    output = '';
    codeWriter.setFileName(fileName);
    while (hasMoreCommands()) {
        advance();
        if (isCommandVaild()) {
            removeAnnotation();
            // 翻译
            if (commandType() === 'C_ARITHMETIC') {
                output += codeWriter.writeArithmetic(nowCommand);
            } else if (commandType() === 'C_LABEL') {
                output += codeWriter.writeLabel(nowCommand);
            } else if (commandType() === 'C_GOTO') {
                output += codeWriter.writeGoto(nowCommand);
            } else if (commandType() === 'C_IF') {
                output += codeWriter.writeIf(nowCommand);
            } else if (commandType() === 'C_FUNCTION') {
                output += codeWriter.writeFunction(nowCommand);
            } else if (commandType() === 'C_RETURN') {
                output += codeWriter.writeReturn(nowCommand);
            } else if (commandType() === 'C_CALL') {
                output += codeWriter.writeCall(nowCommand);
            } else {
                output += codeWriter.writePushPop(nowCommand);
            }
        }
    }
    return output;
}

function hasMoreCommands() {
    return commands.length > 0;
}

function advance() {
    // console.log(commands);
    nowCommand = commands.shift().trim();
}

function isCommandVaild() {
    return nowCommand !== '' && nowCommand.indexOf('//') !== 0;
}

// 去除注释
function removeAnnotation() {
    nowCommand = nowCommand.split('//')[0].trim();
}

const regExpPush = /^(push)/;
const regExpPop = /^(pop)/;
function commandType() {
    if (regExpPush.test(nowCommand)) {
        return 'C_PUSH';
    } else if (regExpPop.test(nowCommand)) {
        return 'C_POP';
    } else if (nowCommand.includes('label')) {
        return 'C_LABEL';
    } else if (nowCommand.includes('if-goto')) {
        return 'C_IF';
    } else if (nowCommand.includes('goto')) {
        return 'C_GOTO';
    } else if (nowCommand.includes('function')) {
        return 'C_FUNCTION';
    } else if (nowCommand.includes('return')) {
        return 'C_RETURN';
    } else if (nowCommand.includes('call')) {
        return 'C_CALL';
    } else {
        return 'C_ARITHMETIC';
    }
}

module.exports = {
    parser
}