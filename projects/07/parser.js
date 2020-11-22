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
    } else {
        return 'C_ARITHMETIC';
    }
}

module.exports = {
    parser
}