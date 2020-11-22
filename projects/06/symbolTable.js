let table = {};

table.SP = 0;
table.LCL = 1;
table.ARG = 2;
table.THIS = 3;
table.THAT = 4;
table.SCREEN = 16384;
table.KBD = 24576;

let rNum = 16;
while (rNum--) {
    table[`R${rNum}`] = rNum;
}

let ramAddress = 16;
function addEntry(symbol) {
    table[symbol] = ramAddress++;
    return ramAddress - 1;
}

function addEntryByAddress(symbol, address) {
    table[symbol] = address;
}

function contains(symbol) {
    return table[symbol] !== undefined;
}

function getAddress(symbol) {
    return table[symbol];
}

module.exports = {
    addEntry,
    addEntryByAddress,
    contains,
    getAddress,
}