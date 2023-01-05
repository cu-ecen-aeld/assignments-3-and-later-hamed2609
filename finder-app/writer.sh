#! /bin/bash
writefile=$1
writestr=$2

if [ $# -eq 2 ] # check for valid number of arguments
then
    if [ -f $writefile ] # check for the existing the file
    then
        echo "the string has been written into the file"
        echo "${writestr}" > $writefile
        
    else
        echo "this path was not available. It has been created and the string has been written into it"
        echo "${writefile}">a.txt # put the desired directory in a temp a.txt file
        grep -ro ".*/" a.txt >b.txt #extract the directory's name from the file's name and put it in a temp file
        read -r dir < b.txt # read the directory from temp b.txt file
        mkdir -p $dir #creat the directory
        echo "${writestr}" > $writefile # put the string into the file
    fi
exit 0
else 
    echo "ERROR: Invalid Number of Arguments.
Total number of arguments should be 2.
The order of the arguments should be:
  1)File Directory Path.
  2)String to be searched in the specified path."
    exit 1
fi
