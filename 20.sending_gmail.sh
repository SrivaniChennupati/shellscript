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

    action="$1"

    case "$action" in
    restart)
            $(systemctl restart postfix)
            ;;
        enable)

            $(systemctl enable postfix)
            ;;
        *)
            echo "Usage: $0 {restart|enable}"
            ;;
    esac
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

SERVICES "restart"

VALIDATE $? "Restaring of POSTFIX is"

SERVICES "enable" &>>$Log_File

VALIDATE $? "Enabling of POSTFIX is"

vi /etc/postfix/main.cf 

content_to_append="relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous"

echo "$content_to_append" >> vi /etc/postfix/main.cf





