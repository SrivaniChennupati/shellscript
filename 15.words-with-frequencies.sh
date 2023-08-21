#!/bin/bash

Text_File_Path=/home/centos/shellscript/Testfile

# checks if the input file exists.
#tokenizes the text into words using tr.
#sorts the words.
#counts the frequency of each word using uniq -c.
#sorts the word-frequency pairs in descending order using sort -nr.
#prints the sorted word frequency list.

if [ ! -f "$Text_File_Path" ]
then
    echo "File not Found : " $Text_File_Path
    exit 1
fi    
   

word_frequency=$(cat $Text_File_Path | tr -s ' ' '\n' | sort | uniq -c | sort -nr | awk '{print $2"@"$1}')

echo "Word Frequency List :"
echo $word_frequency