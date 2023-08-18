#!/bin/bash
user_id=$(id -u)

if [ $user_id -ne 0 ]
then
    echo "ERROR:This command has to be run with superuser privileges"
    exit 1
fi

yum install git -y