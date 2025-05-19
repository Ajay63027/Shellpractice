#!/bin/bash
uid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $uid -ne 0 ]
then
  echo "ERROR:: user have permisions to install"
  exit 1
else
  echo "user  have permissions to install"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
  then
    echo -e "$2 installed  $G successfully $N"
  else 
    echo -e "$2 installed $R failed $N"
  fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then 
echo -e "mysql $R not installed  $N"
dnf install mysql -y 
  VALIDATE $? "mysql"
else 
    echo -e "mysql is $Y already installed $N"
fi
 

dnf list installed python3

if [ $? -ne 0 ]
then 
echo -e  "pythin3 $R not installed $N"
dnf install python3 -y 
VALIDATE $? "python3"
  
else 
    echo -e "python3 is $Y already installed $N"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
echo -e  "nginx $R not installed $N"
dnf install nginx -y 
  VALIDATE $? "nginx"
else 
    echo -e "nginx is $Y  already installed $N"
fi
