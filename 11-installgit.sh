#!/bin/bash
user_id=$(id -u)
script_name=$0
DATE=$(date +%F-%H-%M-%S)
logfile=/tmp/$script_name-$DATE.log
Red="\e[31m"
Green="\e[32m"
Normal="\e[0m"

# Function to validate the package (git) is installed or not

validate(){

if [ $1 -ne 0 ]
then 
    echo -e "$2......$RED FAILURE $Normal"
    exit 1
else
    echo "$2.......$GREEN SUCCESS $Normal"
fi 
   

}

if [ $user_id -ne 0 ]
then
    echo "ERROR:This command has to be run with superuser privileges"
    exit 1
fi

yum install git -y &>>$logfile

validate $? "Installation of GIT" 

yum install mysql -y &>>$logfile

validate $? "Installation of MYSQL"



   
