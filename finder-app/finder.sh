#! /bin/bash
# Two arguments "filesdir" and "searchstr" pass to
#the program from the command line 
filesdir=$1;
searchstr=$2;

if [ $# -eq 2 ] #condition comment to check the valid numbers of argument
then
    if [ -d "$filesdir" ]
    then
        grep -r "$searchstr" $filesdir -l |wc -l > a.txt # searching for the number of lines and put them in a temp file named a.txt.
        grep -r "$searchstr" $filesdir -o |wc -l > b.txt # searching for the number of files and put them in a temp file named b.txt.
        read -r X < a.txt # extract the valuse from a.txt
        read -r Y < b.txt # extract the valuse from b.txt
        echo "The number of files are $X and the number of matching lines are $Y" 
    else
        # Error command for the wrong directory
        echo "$1 does not represent a directory on the filesystem"
        exit 1
    fi

exit 0
else
    # Error command for the wrong number of arguments
    echo "ERROR: Invalid Number of Arguments.
Total number of arguments should be 2.
The order of the arguments should be:
  1)File Directory Path.
  2)String to be searched in the specified path."
    exit 1
fi
