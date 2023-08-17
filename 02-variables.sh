#!/bin/bash
# calculating sum of 2 numbers via command line arguemnts
#$1 and $2 refers to the first and second argument passed as command-line arguments
a=$1
b=$2
sum=$(($a+$b))
echo "sum is $sum"