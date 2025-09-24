

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Error:: Please run this script with root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "Error:: Installing mysql is failed"
    exit 1
else
    echo "Installation is SUCCESS"

fi


dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Error:: Installing nginx is failed"
    exit 1
else
    echo "Installation is SUCCESS"

fi


dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then 
    echo "Error:: Installing mongodb-mongosh is failed"
    exit 1
else
    echo "Installation is SUCCESS"

fi