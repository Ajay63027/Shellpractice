#!/bin/bash
uid=$(id -u)

if [ $uid -ne 0 ]
then
  echo "ERROR:: user have permisions to install"
  exit 1
else
  echo "user  have permissions to install"
fi
dnf list installed mysql

if [ $?-ne 0]
then 
echo "mysql not installed "
dnf instal mysql -y 
  if [ $? -eq 0 ]
  then
    echo "mysql installed successfully"
  else 
    echo "mysql installed failed"
  fi
else 
    echo "mysql is already installed"
fi
# dnf instal mysql -y 
# if [ $? -eq 0 ]
# then
#  echo "mysql installed successfully"
# else 
#   echo "mysql installed failed"
# fi