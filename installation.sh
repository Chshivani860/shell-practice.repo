

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"




logs_floders="/var/lod/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
log_files="$logs_folders/$script_name.log"


mkdir -p $logs_folder
echo "script started excuted at: $(date)"



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
    echo -e "mysql is already exist ............ $Y skipping $N"
fi

dnf list install nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else    echo -e "nginx is already exist............. $Y skipping  $N"
fi


dnf list install python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python3 already exist............ $Y skipping $N"
fi