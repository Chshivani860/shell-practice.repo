

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Error:: Please run this script with root privelege"
    exit 1
fi

validate(){

    if [ $1 -ne 0 ]; then 
        echo "Error:: Installing $2 is failed"
        exit 1
    else
        echo "Installing $2 is SUCCESS"

    fi
}
dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"


dnf install python3 -y
validate $? "python3"