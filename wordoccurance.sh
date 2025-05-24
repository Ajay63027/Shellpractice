#!/bin/bash

filename=$1

for word in $(cat "$filename"); do
  echo "Word: $word"
  wordcount=$(grep -o -w "$word" "$filename" | wc -l)
  echo "Count: $wordcount"
done

