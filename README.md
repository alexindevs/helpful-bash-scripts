# Helpful Shell Scripts
A compilation of helpful bash scripts. 

## Scripts included
1. Recompile
2. Node-server-start

## Recompile.sh

This bash script is designed to automate the process of compiling and running a C program whenever the source code is modified. It's particularly useful during development to save time on manual compilation.

### Prerequisites

Before using this script, ensure you have the following prerequisites:

- **GCC (GNU Compiler Collection):** Make sure you have GCC installed on your system, as this script relies on it to compile C code.

### Usage

To use this script, follow these steps:

1. Download the script and save it to the directory where you wish to use it.
2. Run the script with the C file you want to compile as an argument. To execute it in the background, add an ampersand at the end of the command:

```bash
./recompile.sh your_program.c &
```
The script will start execution in the background, leaving your shell terminal free to handle other tasks.

3. If you prefer to execute it in the foreground without running it in the background:

```bash
./recompile.sh your_program.c
```

4. It will then compile the C file, and run the generated executable. 

If executing in the foreground:

5. If compilation is successful, it will display a message indicating the success and the name of the executable. If compilation fails, it will display an error message.

6. The script will then monitor the C file for changes. Whenever you make changes to the file and save it, the script will automatically detect the modifications and recompile and run the updated code.

7. To stop the script, press `Ctrl + C`. It will execute the cleanup function and exit gracefully.

If executing in the background:

8.  To stop the script, run `fg` to bring the background job to the foreground. Then press `Ctrl + C`. It will execute the cleanup function and exit gracefully.

### Example

Here's an example of how to use the script:

```bash
./recompile.sh my_program.c
```

This will compile `my_program.c`, run the resulting executable, and continuously watch for changes to the file.

Feel free to customize the script or add additional cleanup tasks as needed.

## Node-server-start

This bash script simplifies the process of setting up a Node.js server with Express, body-parser, and cors. It also creates a basic project structure for your Node.js application.

### Prerequisites

Before using this script, ensure you have the following prerequisites:

- **Node.js and npm:** Make sure you have Node.js and npm installed on your system. If not, you can download and install them from [https://nodejs.org/](https://nodejs.org/).

### Usage

To use this script, follow these steps:

1. Download the script and save it to the directory where you want to create your Node.js project.

2. Open your terminal and navigate to the directory where you saved the script.

3. Make the script executable by running the following command:

   ```bash
   chmod u+x node-server-start.sh
    ```
Run the script by executing the following command:

```
./node-server-start.sh
```
The script will prompt you to enter a name for your Node.js project. Enter a suitable name when prompted and press Enter.

It will create a directory with the project name, initialize a package.json file with default values, and install the required dependencies (Express, body-parser, and cors).

The script will generate a index.js file with a basic setup for your Node.js server, including a simple "Hello, World!" route.

Finally, it will start the Node.js server, and you'll see a message indicating that the server is running on a specific port.

### Example
Here's an example of how to use the script:

```bash
./node-server-start.sh
```
This will create a new Node.js project, set up the server, and start it, all with just a few simple steps.

Feel free to customize the generated server file and add more routes and functionality to your Node.js application as needed.
