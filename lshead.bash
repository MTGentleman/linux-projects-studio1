#!/bin/bash
# lshead.bash - A program which reads the first X lines or the last X lines of all files in a given directory
#author - Matthew Austwick, 2018

if [ $# -ne 3 ] #This checks the number of arguments the user has entered
then
	echo "Error. Usage of the command is [lshead.bash <head/tail> <#no of lines> <directory>"
	exit
fi
if [ -d $3 ]
then
	echo " "
else
	echo "Your directory is invalid. Please try again"
	exit
fi
dir_content=$(ls $3)
if (( "$(ls $3 | wc -w)" >= 1 ))
#This line of code checks as to whether or not there is AT LEAST 1 file/directory inside of the specified directory
then
	for file in $dir_content
	#This line repeats the below section of code as many times as there are files in the directory
	do
		if [ -d $file ] #If the selected file is a directory, it cannot be worked with in this program, so it skips it.
		then
			echo "This file ($file) is a directory, the program will not process this directory, but will continue"
			continue
		fi
		if [ $1 == "head" ]
		#If the user inputted "head" into one of their arguments
		then
			file_content=$($1 -$2 $3/$file)
		elif [ $1 == "tail" ] #If they have entered "tail" into their first argument
		then
			file_content=$($1 -$2 $3/$file)
		else
			echo "Your arguments are invalid, please try again"
			exit
		fi
		echo Your file $file contains $file_content #This then displays the first N lines of each file
		echo " "
	done
else
	echo "Your given directory is empty and cannot be worked with. Please try again"
	exit
fi
