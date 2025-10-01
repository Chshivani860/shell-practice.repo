#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then 
    echo "Error:: Please run this script with root previlage"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
        echo "Error:: $2 installation is FAILED"
    else
        echo "$2 installation is SUCCESS"
    fi
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install python3 -y
validate $? "python3"