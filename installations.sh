#!/bin/bash

if [ uid -eq 0 ]{
  echo "user have permisions to install"
  dnf install mysql 
  }
else{
  echo "user does'nt have permissions to install"
  }
