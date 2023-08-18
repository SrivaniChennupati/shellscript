#!/bin/bash
#Check if the number is greater than 10
number=$1

if [ $number -gt 10 ]
then
    echo "Given number $number is Greater than 10"
else
    echo "Given number $number is not greater than 10"
fi