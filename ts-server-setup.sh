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

# Install TypeScript
npm install -D typescript

# Install other dev dependencies
npm install @types/node @types/express @types/body-parser @types/cors dotenv @types/bcrypt @types/jsonwebtoken @types/mongoose mongoose jsonwebtoken bcrypt joi express cors body-parser winston @types/winston uuid

# create tsconfig.json

echo '{
    "compilerOptions": {
      "target": "ES2020",
      "module": "commonjs",
      "outDir": "./dist",
      "strict": true,
      "esModuleInterop": true,
      "forceConsistentCasingInFileNames": true,
      "skipLibCheck": true,
      "resolveJsonModule": true
    },
    "include": [
      "./src/**/**/*.ts",
      "./src/**/*.ts",
      "src/server.ts"
    ],
    "exclude": [
      "./dist"
    ]
}' > tsconfig.json


# Create your src folder and subfolders
mkdir src
cd src

# create your server.ts file
echo 'import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import { config } from "dotenv";

config();

const app = express();
const port = process.env.PORT || 7000;

app.use(bodyParser.json());
app.use(cors());

app.get("/", (req, res) => {
  res.send("Hello, World!");
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
' > server.ts

cd ../

code ./