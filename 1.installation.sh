#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then 
    echo "Error:: Please run this script with root previlage"
    exit 1
fi
