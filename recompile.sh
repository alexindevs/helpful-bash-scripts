#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ./recompile.sh <file.c>"
    exit 1
fi

function cleanup() {
    echo "Stopping the script..."
    # Add any cleanup tasks here if needed
    exit 0
}

trap cleanup SIGINT

function compile_and_run() {
    gcc -o "${1%.c}" "$1"
    if [ $? -eq 0 ]; then
        echo "Compilation successful! Executable: ./${1%.c}"
    else
        echo "Compilation failed!"
    fi
}

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

compile_and_run "$1"

initial_time=$(stat -c %Y "$1")

while true; do
    sleep 1

    if [ ! -f "$1" ]; then
        echo "Error: File '$1' not found."
        exit 1
    fi

    current_time=$(stat -c %Y "$1")

    if [ "$current_time" != "$initial_time" ]; then
        initial_time="$current_time"
        compile_and_run "$1"
    fi
done