#!/bin/bash
uid=$(id -u)

if [ $uid -eq 0 ]
then
  echo "user have permisions to install"
  dnf install mysql 
else
  echo "user does'nt have permissions to install"
fi
