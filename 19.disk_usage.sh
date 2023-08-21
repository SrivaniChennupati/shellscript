#!/bin/bash

#logs redirection
#colors
#validations

Logfiles_Directory=/tmp
script_name=$0
DATE=$(date +%F-%H-%M-%s)
Log_File=$Logfiles_Directory/$script_name-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
message=

Disk_usage=$( df -hT | grep -vE 'tmpfs|Filesystem')
Disk_Threshold_value=1

while IFS= read line
do
 #echo "Disk Usage:"$line
 #This command will give us usage in number format for comparision
 usage=$(echo $line| awk '{print $6}'| cut -d % -f  1)
 #This command will give us the partition
 partition=$(echo $line | grep -vE 'tmpfs|Filesystem' | awk '{print $1}')

 if [ $usage -gt $Disk_Threshold_value ]
 then
 echo "HIGH DISK USAGE on "$partition : $usage
 message+="HIGH DISK USAGE on $partition : $usage \n"

 fi

done <<< $Disk_usage

#now we need to send an email

#echo "$message $(date)" | mail -s "High Disk Usage" srivanichennupati@gmail.com

mail.sh srivanichennupati@gmail.com "High Disk Usage" $message "Devops Team" "High Disk Usage"

