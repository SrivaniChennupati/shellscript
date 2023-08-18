#!/bin/bash
user_id=$(id -u)
script_name=$0
DATE=$(date +%F-%H-%M-%S)
logfile=/tmp/$script_name-$DATE.log

validate(){
 
if [ $1 -ne 0 ]
then
    echo "$2..........FAILURE"
    exit 1
 else 
    echo "$2..........SUCCESS"
 fi   

}

if [ $user_id -ne 0 ]
then
    echo "ERROR:This should be Executed with sudo access"
    exit 1
fi

yum install git -y &>>$logfile

validate $? "Installation of GIT"

yum install mysql -y &>>$logfile

validate $? "Installation of MySQL"

    
