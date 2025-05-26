#!/bin/usr

diskusage=$(df -hT | grep -v Filesystem) 
threshold=1
IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

while IFS= read line
do
 USAGE=$(echo $line | awk '{print $6F}'|cut -d '%' -f1)
 Partision=$(echo $line | awk '{print $7F}') 
  if [ $USAGE -ge $threshold ] 
  then
      MSG+="High disk usage on : $Partision :$USAGE <br>"
  fi
done <<< $diskusage
echo -e "$MSG"

sh mail.sh DevOpsTeam  High_Diskspace "$IP" "$MSG" ajaymanthurthi6@gmail.com High_Disk_usage
