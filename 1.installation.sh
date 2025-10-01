#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]; then 
    echo -e "$R Eror:: Please run this script with root previlage $N"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
        echo -e " $R Error:: $2 installation is FAILED $N"
    else
        echo -e  " $G $2 installation is SUCCESS $N"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e " mysql is already exist ....$Y SKIPPING $N "
fi

dnf list installed nginx
if [$? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e " nginx already exist ....$Y SKIPPING $N "
fi

dnf list installed python3

if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python3 already exist ....$Y SKIPPING $N "
fi