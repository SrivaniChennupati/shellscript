#!/bin/bash

input_file=/home/centos/shellscript/reverseorder

output_file=/home/centos/shellscript/output_reverseorder

while read line
do  
    Reversed_line= $(echo "$line" | rev)

    echo "Reversed line : "$Reversed_line > $output_file

 done <<< $input_file   
  