#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then 
    echo "Error:: Please run this script with root previlage"
    exit 1
fi

apt install mysql -y

if [ $? -ne 0 ]; then 
    echo "Error:: Mysql installation is FAILED"
else
    echo "Mysql installation is SUCCESS"
fi
