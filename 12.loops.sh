#!/bin/bash
user_id=$(id -u)

#date along with time stamp
DATE=$(date +%F-%H-%M-%S)
# $0 gives the script name
script_name=$0
logfile=/tmp/$DATE-$script_name.log

# to add the colors
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

# Function to validate the packages are installed or not

validate(){

if [ $1 -ne 0 ]
then
        echo -e  "$2.....$R FAILURE $N"
        exit 1
else
        echo -e "$2......$G SUCCESS $N"
fi        

}
 

#validate the Root user or not , if user id not 0 then exit

if [ $user_id -ne 0 ]
then
    echo "ERROR:This command has to be run with superuser privileges"
    exit 1
fi

# all the arguments in $@
 
 for i in $@
do 
   package_status=$(rpm -q $i | awk -F "-" '{print $1F}')
if [ $package_status == $i ]
then
    echo -e "Package $i ....... $Y already installed $N"
else    
    echo "Package $i is not installed.Lets install it........"
    yum install $i -y &>>$logfile
    validate $? "Installation of $i"
 fi 
done 



#yum install git -y &>>$logfile

#calling validate function to check the packages installed or not

#validate $? "Installation of GIT"

