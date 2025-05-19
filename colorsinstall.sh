#!/bin/bash
uid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logfolder="/var/log/shell_scriptlogs"
script_name=$(echo $0 | cut d "." f1)
logfile="$logfolder/$script_name.log"

mkdir -p $logfolder

echo "script starting at $(date)" &>>logfile

if [ $uid -ne 0 ]
then
  echo "ERROR:: user have permisions to install" &>>logfile
  exit 1
else
  echo "user  have permissions to install" &>>logfile
fi

VALIDATE(){
    if [ $1 -eq 0 ]
  then
    echo -e "$2 installed  $G successfully $N" &>>logfile
  else 
    echo -e "$2 installed $R failed $N" &>>logfile
  fi

}

dnf list installed mysql &>>logfile

if [ $? -ne 0 ]
then 
echo -e "mysql $R not installed  $N" &>>logfile
dnf install mysql -y  &>>logfile
  VALIDATE $? "mysql" &>>logfile
else 
    echo -e "mysql is $Y already installed $N" &>>logfile
fi
 

dnf list installed python3 &>>logfile

if [ $? -ne 0 ]
then 
echo -e  "pythin3 $R not installed $N" &>>logfile
dnf install python3 -y  &>>logfile
VALIDATE $? "python3" &>>logfile
  
else 
    echo -e "python3 is $Y already installed $N" &>>logfile
fi


dnf list installed nginx &>>logfile

if [ $? -ne 0 ]
then 
echo -e  "nginx $R not installed $N" &>>logfile
dnf install nginx -y &>>logfile
  VALIDATE $? "nginx" &>>logfile
else 
    echo -e "nginx is $Y  already installed $N" &>>logfile
fi
