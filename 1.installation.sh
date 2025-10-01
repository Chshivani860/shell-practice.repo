#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then 
    echo "Error:: Please run this script with root previlage"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "Error:: Mysql installation is FAILED"
else
    echo "Mysql installation is SUCCESS"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error :: nginx installation FAILED"
else 
    echo "Nginx installation is SUCCESS"
fi

dnf install python3 -y

if [ $? -ne 0 ]; then 
    echo "Error :: python3 installation is FAILED"
else 
    echo "python3 installation is SUCCESS"
fi
