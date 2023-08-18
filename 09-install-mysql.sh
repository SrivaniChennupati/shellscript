#!/bin/bash
#install mysql on the server 
#if root user id (id -u) =0 , then install

user_id = $(id -u)
#its our responsibility again to check installation is succuss or not
validate(){
if [ $1 -ne 0 ]
 then 
    echo "$2......FAILURE"
    exit 1
 else
    echo "$2..... SUCCESS"   
 fi 
}

if [ $user_id -ne 0 ]
then
    echo "ERROR : This command has to be run with superuser privileges"
    exit 1
fi
 yum install mysql -y

validate $? "Installation of MYSQL"
