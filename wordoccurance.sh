#!/bin/bash

filename=$1

for word in $(cat "$filename"); do
  wordcount=$(grep -o -w "$word" "$filename" | wc -l)
  echo " Word: $word     Count: $wordcount"
done

