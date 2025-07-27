#!/bin/bash
USERDID=$(id -u)

if [ $USERDID -ne 0 ]
   then 
   echo " you must have sudo privileges"
   exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
  then
      dnf install mysql -y
        if [ $? ne 0 ]
        then
        echo "Installing Mysql FAILED"
        exit 1
        else
        echo "Mysql installed successfully..."
        fi   
    else
    echo "mysql installed already"
fi     
   