#!/bin/bash
word=$1
word=$2
file=$3

for file in '*txt';do
sed -i 's/word1/word2/g' "$file"
done