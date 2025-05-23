#!/bin/bash

uid=$(id -u)
source_dir=$1
dest_dir=$2
days=${3:-14}

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logfolder="/var/log/shell_scriptlogs"
script_name=$(echo $0 | cut -d "." -f1)
logfile="$logfolder/$script_name.log"

mkdir -p $logfolder

echo "script starting at $(date)" | tee -a $logfile

if [ $uid -ne 0 ]
then
  echo "ERROR:: user have permisions to install" &>>$logfile
  exit 1
else
  echo "user  have permissions to install" &>>$logfile
fi
USAGE(){
    echo -e "$G USAGE:: $N Sh backup.sh <source_dir> <destination_dir> <days <days>(opt) "
}

if [ $# -lt 2 ]
  then
      USAGE
fi 
 if [ ! -d $source_dir ]
  then 
  echo " souce dir does not exist"
 fi 
 if [ ! -d $dest_dir ]
  then 
  echo " destination dir does not exist"
 fi 
  
 files=$(find $source_dir -name "*.log" -mtime +$days)

if [ ! -z $files  ]
 then
 echo " files to zip are : $files"
 else 
 echo " no files found older than 14 days "
fi 

