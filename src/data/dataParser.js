const fs = require('fs');
const path = require('path');

function loadData(filenameJSON)
{
    return JSON.parse(fs.readFileSync(path.join(__dirname, filenameJSON.toLowerCase()), 'utf-8'));
}

function saveData(data, filenameJSON)
{
    fs.writeFileSync(path.join(__dirname, filenameJSON), JSON.stringify(data), 'utf-8');
}

module.exports = { loadData, saveData };