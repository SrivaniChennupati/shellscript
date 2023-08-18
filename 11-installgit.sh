#!/bin/bash
user_id=$(id -u)

# Function to validate the package (git) is installed or not

validate(){

if [ $1 -ne 0 ]
then 
    echo "Installation......FAILURE"
    exit 1
else
    echo "Installation.......SUCCESS"
fi 
   

}

if [ $user_id -ne 0 ]
then
    echo "ERROR:This command has to be run with superuser privileges"
    exit 1
fi

yum install git -y

validate $?



   
