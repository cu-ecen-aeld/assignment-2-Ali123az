#!/bin/sh

# check arguments
filesdir="$1"
searchstr="$2"

if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
  echo "Error: missing parameters. Usage: finder.sh <filesdir> <searchstr>"
  exit 1
fi

if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir is not a directory"
  exit 1
fi

# count files
num_files=$(find "$filesdir" -type f 2>/dev/null | wc -l)

# count matching lines
num_matches=$(grep -R -F -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"

exit 0
