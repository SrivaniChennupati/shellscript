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

VALIDATE(){
 
 if [ $1 -ne 0 ]
then
        echo "$2 ....FAILURE"
        exit 1
    else 
        echo "$2 ....SUCCESS" 
 fi       

}

SERVICES(){

    if [ $3 eq "restart" ]
    then
    echo " Restarting the POSTFIX Service......"
    systemctl restart postfix &>>$Log_File
     if [ $3 eq "enable" ]
    then
    echo " Enabling the POSTFIX Service......"
    systemctl enable postfix  &>>$Log_File
    fi 
    fi
}

if [ $user_id -ne 0 ]
then
    echo "ERROR : This command has to be run with superuser privileges"
    exit 1
fi   

repo_status=$(yum history | grep update -y --exclude=kernel* | awk '{print $10}'| sed -n '1P')

if [ "$repo_status" = "Upgrade" ]
then
echo "Yum Repo has updated already...."
   
 else 
     echo "Updating the Yum Repo......."
     yum update -y --exclude=kernel* &>>$Log_File

     VALIDATE $? "Repo Updation"
fi 

yum list installed postfix &>>$Log_File

if [ $? -ne 0 ]
then
    echo "POSTFIX is not Installed.Lets Install it......"
    yum -y install postfix cyrus-sasl-plain mailx &>>$Log_File
 else

 echo "POSTFIX is Already .....Installed"
fi

SERVICES restart





