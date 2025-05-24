#!/bin/bash
word=$1
word=$2
file=$3
dir=$4

for file in $dir;do
sed -i 's/word1/word2/g' "$file"
done