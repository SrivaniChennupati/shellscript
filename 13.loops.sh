#!/bin/bash
user_id=$(id -u)
script_name=$0
DATE=$(date +%F-%H-%M-%S)
logfile=/tmp/$script_name-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

validate(){
 
if [ $1 -ne 0 ]
then
    echo -e  "$2..........$R FAILURE $N"
    exit 1
 else 
    echo -e  "$2..........$G SUCCESS $N"
 fi   

}

if [ $user_id -ne 0 ]
then
    echo "ERROR:This should be Executed with sudo access"
    exit 1
fi

for i in $@
do
yum list installed $i &>>/dev/null
if [ $? -ne 0 ]
then
    echo "Package $i is not Installed.Lets Install it..........."
     yum install $i -y &>>$logfile 
      validate $? "Installation of $i"
else
    echo -e "Package $i is .........$Y already Installed $N"
fi    
done







    
