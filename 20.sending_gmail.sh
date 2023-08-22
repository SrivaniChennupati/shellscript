#!/bin/bash

Logfiles_Directory=/tmp
script_name=$0
DATE=$(date +%F-%H-%M-%S)
Log_File=$Logfiles_Directory/$script_name-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

user_id=$(id -u)

if [ $user_id -ne 0 ]
then
    echo "ERROR : This command has to be run with superuser privileges"
    exit 1
fi   

yum history | grep update -y --exclude=kernel*

if [ $? -ne 0 ]
then
    echo "Updating the Yum Repo......."
     yum update -y --exclude=kernel* &>>$Log_File

 else 

    echo "Yum Repo has updated already...."
fi    



