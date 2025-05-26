#!/bin/usr

diskusage=$(df -hT | grep -v Filesystem|awk '{print $6F}'|cut -d '%' -f1) 
filename=$(df -hT | grep -v Filesystem|awk '{print $7F}')

echo "filename: $filename diskusage:$diskusage"

while IFS= read -r line
do
 USAGE=$(echo $diskusage | awk '{print $6F}'|cut -d '%' -f1)
 Partision=$(echo $diskusage | awk '{print $7F}')
 echo "diskusage :: $USAGE filename :: $partision"
done <<< $diskusage