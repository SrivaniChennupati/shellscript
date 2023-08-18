#!/bin/bash
user_id=$(id -u)
DATE=$(date +%F-%H-%M-%S)
script_name=$0
logfile=/tmp/$DATE-$script_name.log

# Function to validate the packages are installed or not

validate(){

if [ $1 -ne 0 ]
then
        echo "$2.....SUCCESS"
else
        echo "$2......FAILURE"
fi        

}

#validate the Root user or not , if user id not 0 then exit

if [ $user_id -ne 0 ]
then
    echo "ERROR:This command has to be run with superuser privileges"
    exit 1
fi

yum install git -y &>>$logfile

validate $? "Installation of GIT"

