#!/bin/bash
user_id=$(id -u)

if [ $user_id -ne 0 ]
then
    echo "ERROR:This should be Executed with sudo access"
    exit 1
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "Installation of git..........FAILURE"
    exit 1
 else 
    echo "Installation of git..........SUCCESS"
 fi       
