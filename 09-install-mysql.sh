#!/bin/bash
#install mysql on the server 
#if root user id (id -u) =0 , then install

user_id=$(id -u)
DATE=$(date +%F-%H-%M-%S)
script_name=$0
logfile=/tmp/$script_name-$DATE.log
Red=\e[31m
green=\e[32m
normal=\e[0m
#its our responsibility again to check installation is succuss or not
validate(){
if [ $1 -ne 0 ]
 then 
    echo -e "$2......$Red FAILURE $normal"
    exit 1
 else
    echo -e "$2..... $green SUCCESS $normal"   
 fi 
}

if [ $user_id -ne 0 ]
then
    echo "ERROR : This command has to be run with superuser privileges"
    exit 1
fi
 yum install mysql -y

validate $? "Installation of MYSQL" &>>$logfile
