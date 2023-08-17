#!/bin/bash
# Take input from user and calculate sum.
read -p "Enter Fisrt Number": a
read -p "Enter Second Number": b
sum=$(($a+$b))
echo "sum of the 2 given numbers is $sum"