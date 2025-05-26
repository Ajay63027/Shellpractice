#!/bin/usr

diskusage=$(df -hT | grep -v Filesystem|awk '{print $6F}'|cut -d '%' -f1) 
filename=$(df -hT | grep -v Filesystem|awk '{print $7F}'|cut -d '%' -f1)

echo "filename: $filename diskusage:$diskusage"