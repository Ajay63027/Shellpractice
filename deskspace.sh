#!/bin/usr

diskusage=$(df -hT | grep -v Filesystem) 
threshold=1

while IFS= read -r line
do
 USAGE=$(echo $diskusage | awk '{print $6F}'|cut -d '%' -f1)
 Partision=$(echo $diskusage | awk '{print $7F}')
 echo "$USAGE $partision""
done <<< $diskusage