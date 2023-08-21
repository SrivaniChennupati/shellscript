#!/bin/bash

Input_file=/home/centos/shellscript/Testfile1
old_word="stars"
new_word="Earth"
output_file=/home/centos/shellscript/Testoutput


if [ ! -f $Input_file ]
then
    echo "File not found :" $Input_file
    exit 1
fi   

output_file=/home/centos/shellscript/Testoutput

$(cat $Input_file | sed "s/$old_word/$new_word/g" >$output_file)

 echo "Replacement is done , Results saved in " $output_file