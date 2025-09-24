

userid=$(id -u)

if [ $userid -ne 0]; then
    echo "Error:: Please run this script with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0]; then 
    echo "Error:: Installing mysql is failed"
else
    echo "Installation is SUCCESS"

fi