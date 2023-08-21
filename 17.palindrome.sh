#!/bin/bash

echo "Enter a String"

read input_string


reversed_string=$(echo "$input_string" | rev)

if [ $reversed_string eq $input_string ]
then
    echo "Given string is palindrome"

else 

    echo "Given string is not palindrome"
fi    


