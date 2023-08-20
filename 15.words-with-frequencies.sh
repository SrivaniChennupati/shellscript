#!/bin/bash

Text_File_Path=/home/centos/shellscript/Testfile
#sort command sorts the contents of the text file line by line - Sorts in ASCII
#uniq Identify and deletes the adjucent dupliacte lines from the input file , it should use with sort , -c will helps how many times a line was repeated by displaying number as a prefix with the line 
#uniq -c to count the frequency of each word
#sort -nr to sort the word frequency list in descending order by frequency

word_frequency=$(cat $Text_File_Path | tr -s ' ' '\n' | sort | uniq -c | sort -nr | awk '{print $2"@"$1}')

echo "Word Frequency List : "
echo $word_frequency