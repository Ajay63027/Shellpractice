#!/bin/bash
uid=$(id -u)

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
    echo "$2 installed successfully"
  else 
    echo "$2 installed failed"
  fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then 
echo "mysql not installed "
dnf install mysql -y 
  VALIDATE $? "mysql"
else 
    echo "mysql is already installed"
fi
 

dnf list installed python3

if [ $? -ne 0 ]
then 
echo "pythin3 not installed "
dnf install python3 -y 
VALIDATE $? "python3"
  
else 
    echo "python3 is already installed"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
echo "nginx not installed "
dnf install nginx -y 
  VALIDATE $? "nginx"
else 
    echo "nginx is already installed"
fi
