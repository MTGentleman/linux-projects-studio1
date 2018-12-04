#!/bin/bash
#mvfile.bash - A command which, when given two directories, moves all files from directory 1 to directory 2 without disturbing the file structure. Also, if there are any sub-folders inside of the directory, then those are ignored and will not be moved - even if THEY have files in them.
#author - Matthew Austwick, 2018.

if [ $# -lt 2 ] #Like most of the programs I have made, this just makes sure that the user
then
	echo "Sorry,you have entered too few arguments; the usage for the command is: $0 <directory1> <directory2>"
	exit
echo "Now validating the existence of the two directories..."
fi
if [ -d $1 ]
#The line above tests if the directory in the user's first argument actually exists
then
	validation=$(ls $1 | wc -w) #This counts the number of "words" (files/directories) that there are in the given directory.
	if (( $validation >= 1 ))
	#This line above tests if the user's first target directory actually contains any files (this is to make sure there are no "file does not exist" errors later in the code. If there are files, the program continues as normal, if there are not, then the program displays a message and exits.
	then
		echo "Your directory $1 is valid and contains files, the code will continue"
	else
		echo "Your directory $1 is empty and cannot be used, please try again with a directory containing files"
		exit
	fi
else
	echo "$1 is not a valid directory. Please try again" #This occurs ONLY if the user's first directory does not exist
fi
if [ -d $2 ] #Similar to the code above, this just makes sure that the user's second argument (directory) actually exists; if it doesn't, then the program displays a message and exits.
then
	echo "Your directory $2 is valid, the code will continue"
else
	echo "$2 is not a valid directory. Please try again"
fi
dirList=$(ls $1)
for files in $dirList #This repeats the below section code as many times as there are files/directories in the first argument (first directory)
do
	if [ -d $1/$files ] #If the located file is a directory, then it is not used and the program ignores it
	then
		echo "This is a sub-directory; it cannot be proceseed, the program will ignore it"
	elif [ -e $1/$files ] #This makes sure that the remaining file actually exists and is valid; if it is, then it gets moved to the 2nd specified directory.
	then
		mv $1/$files $2
		echo "The file $1/$files has been moved to the directory $2"
	else #If it fails the above checks, then the program will simply just ignore the file and make the user check if there is a substantial error.
		echo "There has been an error and the program will ignore the file"
	fi
done
echo "The contents of $1 is now"
ls $1
echo " "
echo "The contents of $2 is now" 
ls $2

