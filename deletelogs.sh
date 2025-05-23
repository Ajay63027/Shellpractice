#!/bin/bash

uid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logfolder="/var/log/shell_scriptlogs"
script_name=$(echo $0 | cut -d "." -f1)
logfile="$logfolder/$script_name.log"
source_path=/home/ec2-user/app-logs

mkdir -p $logfolder

if [ $uid -ne 0 ]
then
  echo "ERROR:: user have permisions to install" | tee -a $logfile
  exit 1
else
  echo "user  have permissions to install" | tee -a $logfile

VALIDATE(){
    if [ $1 -eq 0 ]
  then
    echo -e "$2 installed  $G successfully $N"  | tee -a $logfile
  else 
    echo -e "$2 installed $R failed $N"  | tee -a $logfile
  fi
}
    

files_old= $(find $source_path -name "*.log" -mtime "+14")


while IFS= read -r file
do
rm -rf $file
done <<< $files_old