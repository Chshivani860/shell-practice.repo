

userid=$(id -u)

R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

if [ $userid -ne 0 ]; then
    echo "Error:: Please run this script with root privelege"
    exit 1
fi

validate(){

    if [ $1 -ne 0 ]; then 
        echo  -e "Installing $2............. $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2.............. $G SUCCESS $N"

    fi
}

dnf list install mysql
if [ $? -ne 0 ]; then

    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "mysql is already exist ............ $G skipping $N"
fi

dnf list install nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else    echo -e "nginx is already exist............. $G skipping  $N"
fi


dnf list install python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python3 already exist............ $G skipping $N"
fi