#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]
   then 
   echo " you must have sudo privileges"
fi

dnf list installed mysql

if [ $? ne 0]
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
   