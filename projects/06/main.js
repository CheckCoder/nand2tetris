const parser = require('./parser');
const fs = require('fs');

let fileName = process.argv[2];

fs.readFile(fileName, 'utf-8', (err, data) => {
    if (err) {
        throw err;
    }
    
    let instructions = data.split('\r\n');
    let binaryOut = parser(instructions);
    let outFileName = `${fileName.split('.')[0]}.hack`;
    fs.writeFile(outFileName, binaryOut, (err) => {
        if (err) {
            throw err;
        }
    });

});

