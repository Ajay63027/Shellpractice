#!/bin/bash
filename=$1

for word in $(cat $filename)
 do 
 echo $word
 done 

 wordcount='grep -o $word $file | wc-l'