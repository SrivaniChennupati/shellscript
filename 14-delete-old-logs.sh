#!/bin/bash

#Created another directory just to practice purpose lets say our java application/any application log files are storing- we have to delete the log files from here
#create some files with the old time stamp just for practice purpose using touch with old date
#touch -d 20200801 Shipping-2023-08-01.log

App_Logs_Directory=/home/centos/app-logs
script_name=$0
DATE=$(date +%F-%H-%M-%S)
#created a directory to store all the logs which includes both systemerror and system output
Logfiles_Directory=/home/centos/shellscript/shellscriptlogs
Logfile=$Logfiles_Directory/$script_name-$DATE.log

files_to_delete=$(find $App_Logs_Directory -name "*.log" -type f -mtime +14)
echo $files_to_delete

#before deleting I want to store those files in to some location for future reference
#Read line by line of the logs

while read line
do
    echo "Deleting $line" &>>$Logfiles_Directory
    rm -rf*
done < $files_to_delete
