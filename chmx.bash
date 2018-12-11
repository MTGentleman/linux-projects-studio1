#! /bin/bash
#chmx - A command that takes filenames as its arguments and and makes those files executable to every user
#author - Matthew Austwick, 2018

if [ $# -lt 1 ]
#Like all of my programs, this line of code makes sure that they user has entered the correct amount of arguments
then
	echo "Sorry, there has been an error; please enter at least one argument which is a filename in your current directory"
	exit
fi
for var in $@
#This repeats as many times as there are files in the directory, and for each program
do
	if [ -w $var ]
	#This checks if there are write permissions
	then 
		chmod +x $var #This adds the execute permissions to the program
		echo "The command $var is now executable, thank you"
		echo " "
	else
		echo "Sorry, that file called $var either does not exist or you do not have write permissions to that file. Please try again with a different file"
		exit
	fi
done
