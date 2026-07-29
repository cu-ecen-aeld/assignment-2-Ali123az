#!/bin/sh

writefile="$1"
writestr="$2"

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: missing parameters. Usage: writer.sh <writefile> <writestr>"
    exit 1
fi

writedir=$(dirname "$writefile")

mkdir -p "$writedir" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Error: cannot create directory $writedir"
    exit 1
fi

echo "$writestr" > "$writefile" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Error: cannot create file $writefile"
    exit 1
fi