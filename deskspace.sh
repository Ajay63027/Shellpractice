#!/bin/usr

diskusage=$(df -hT | grep -v Filesystem) 
threshold=1

while IFS= read line
do
 USAGE=$(echo $line | awk '{print $6F}'|cut -d '%' -f1)
 Partision=$(echo $line | awk '{print $7F}') 
  if [ $USAGE -ge $threshold ] 
  then
      MSG+="High disk usage: $Partision :$USAGE \n"
  fi
done <<< $diskusage
echo "$MSG"