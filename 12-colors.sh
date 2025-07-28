#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
VALIDATE() {

            if [ $1 -ne 0 ]
            then    
                echo -e "$2 .... $R FAILURE"
                exit 1
            else
                echo -e "$2 .... $G SUCCESS"    
            fi
            }

if [ $USERID -ne 0 ]
 then
 echo -e "User must have sudo privileges"
    exit 1
fi


dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installin mysql"
else
    echo -e "mysql is already $Y installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installin git"
else
    echo -e "git is already $Y installed"
fi