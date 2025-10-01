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

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install python3 -y
validate $? "python3"