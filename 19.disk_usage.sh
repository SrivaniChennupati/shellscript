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

Disk_usage=$( df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}'| cut -d % -f  1)
Disk_Threshold_value=1

while IFS= read line
do
 echo "Disk Usage:"$line

done <<< $Disk_usage