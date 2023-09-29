#!/bin/bash

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Please install it from https://nodejs.org/."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "npm is not installed. Please install it along with Node.js from https://nodejs.org/."
    exit 1
fi

# Prompt the user for the project name
echo "Enter a name for your Node.js project: "
read project_name

# Create the project directory
mkdir "$project_name"
cd "$project_name"

# Initialize a package.json file
npm init -y

# Install Express, body-parser, and cors
npm install express body-parser cors

# Create your server.js file with a basic setup
echo "const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

app.get('/', (req, res) => {
    res.send('Hello, World!');
});

app.listen(port, () => {
    console.log('Server is running on port ' + port);
});
" > index.js

# Start the server
node index.js