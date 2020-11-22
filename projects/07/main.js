const fs = require('fs');
const { parser } = require('./parser');

const fileName = process.argv[2];

const isDirectory = fs.lstatSync(fileName).isDirectory();

let output = '';
let outputFileName = '';

if (isDirectory) {
    outputFileName = fileName;
    fs.readdir(fileName, (err, files) => {
        if (err) {
            throw err;
        } else {
            files.forEach(file => {
                let tempArray = file.split('.');
                if (tempArray.pop() === 'vm') {
                    let outputFilename = tempArray.join('.');
                    let fileData = fs.readFileSync(`${fileName}/${file}`, 'utf-8');
                    parseFileData(fileData, outputFilename);
                }
            });
        }
    });
    outputData();
} else {
    let tempArray = fileName.split('.');
    tempArray.pop();
    outputFileName = tempArray.join('.');
    let fileData = fs.readFileSync(`${fileName}`, 'utf-8');
    parseFileData(fileData, outputFileName);
    outputData();
}

function parseFileData(fileData, outputFilename) {
    fileData = fileData.split('\r\n');
    output += parser(fileData, outputFilename);
}

function outputData() {
    fs.writeFile(outputFileName + '.asm', output, (err) => {
        if (err) {
            throw err;
        }
    });
}