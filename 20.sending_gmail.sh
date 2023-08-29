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

validate(){
 
 if [ $1 -ne 0 ]
then
        echo  -e "$2 ....$R FAILURE $N"
        exit 1
    else 
        echo  -e "$2 ....$G SUCCESS $N" 
 fi       

}

if [ $user_id -ne 0 ]
then
    echo  -e " $R ERROR:This should be Executed with sudo access $N"
    exit 1
fi

  yum update -y --exclude=kernel* &>>$Log_File

 validate $? "Updating yum repo"

 yum -y install postfix cyrus-sasl-plain mailx &>>$Log_File

validate $? "Installing Postfix"

systemctl restart postfix &>>$Log_File

validate $? "Restaring Postfix"

systemctl enable postfix &>>$Log_File

validate $? "Enabling Postfix"

cat /home/centos/main.cf >> /etc/postfix/main.cf &>>$Log_File

sed -i -e '$a\relayhost = [smtp.gmail.com]:587' -e '$a\smtp_use_tls = yes' -e '$a\smtp_sasl_auth_enable = yes' -e '$a\smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd' -e '$a\smtp_sasl_security_options = noanonymous' -e '$a\smtp_sasl_tls_security_options = noanonymous' /etc/postfix/main.cf

validate $? "Appending the file"

cp /home/centos/shellscript/sasl_passwd  /etc/postfix/sasl_passwd

validate $? "Adding gmail Credentials for Authentication"

postmap /etc/postfix/sasl_passwd 

validate $? "Creating a Postfix lookup table"

echo "This is a test mail & Date $(date)" | mail -s "message" read -p "Enter Gmail" 





































