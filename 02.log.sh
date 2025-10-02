#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


logs_folders="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
log_files="$logs_floders/$script_name.lol"

mkdir -p $logs_folders
echo " Script  started executed at: $(date) " | tee -a $log_files

if [ $userid -ne 0 ]; then 
    echo -e "$R Eror:: Please run this script with root previlage $N"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
        echo -e " $R Error:: $2 installation is FAILED $N" | tee -a $log_files
        exit 1
    else
        echo -e  " $G $2 installation is SUCCESS $N"  |tee -a $log_files
    fi
}

dnf list installed mysql &>>$log_files

if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$log_files
    validate $? "mysql"
else
    echo -e " mysql is already exist ....$Y SKIPPING $N "|tee -a $log_files
fi

dnf list installed nginx &>>$log_files
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$log_files
    validate $? "nginx"
else
    echo -e " nginx already exist ....$Y SKIPPING $N "|tee -a $log_files
fi

dnf list installed python3 &>>$log_files
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$log_files
    validate $? "python3"
else
    echo -e "python3 already exist ....$Y SKIPPING $N " | tee -a $log_files
fi