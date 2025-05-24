#!/bin/bash

# Check if filename is given
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

filename="$1"

# Check if file exists
if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi

# Process the file:
# - Convert to lowercase
# - Replace non-alphanumeric chars with newline
# - Sort and count
# - Sort by frequency
# - Show top 5
tr '[:upper:]' '[:lower:]' < "$filename" | \
tr -c '[:alnum:]' '[\n*]' | \
grep -v '^$' | \
sort | \
uniq -c | \
sort -nr | \
head -n 5
