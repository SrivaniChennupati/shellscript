#!/bin/bash

Logfiles_Directory=/tmp
script_name=$0
DATE=$(date +%F-%H-%M-%s)
Log_File=$Logfiles_Directory/$script_name-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

RAM_Usage=$(free -m | awk '{print $3}' | sed -n '3p')

RAM_threshold_value=10

if [ $RAM_Usage -gt $RAM_threshold_value ]
then
    echo " $R ERROR : HIGH RAM USAGE $N:$RAM_Usage"
    $message="High RAM Usage :$RAM_Usage"
    echo $message
fi    


#sh mail.sh srivanichennupati@gmail.com "High RAM Usage" $message "Devops Team" "High RAM Usage"

echo "$message $(date)" | mail -s "High RAM Usage" srivanichennupati@gmail.com

