#!/bin/bash

search=$1      # Word to find
replace=$2     # Word to replace it with
dir=$3         # Directory path

# Loop through all .txt files in the directory (modify pattern as needed)
for file in "$dir"/*.txt; do
  if [ -f "$file" ]; then
    sed -i "s/${search}/${replace}/g" "$file"
    echo "Updated $file"
  fi
done
