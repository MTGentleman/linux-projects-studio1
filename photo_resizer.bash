#! /bin/bash
# photo_resizer.bash - A program to be used to resize all files in a given directory to given dimensions.

if [ $# -lt 3 ]
#This if statement checks if the number of arguments is less than 3; if it is, the program quits
then
	echo "Please enter the command with the proper syntax"
	echo "The correct format is [photo_resizer.bash <directory> <width> <height>]"
	exit
fi
if [[ $2 != [0-9]* ]]
#This if statement makes sure that their two other arguments (the width and height) are integers; if they contain symbols or letters,
#the program displays an error and quits.
then
	echo "Error, you have entered an invalid width"
	exit
elif [[ $3 != [0-9]* ]]
then
	echo "Error, you have entered an invalid height"
	exit
fi

#The below if statement checks if the directory is empty AND if it exists; if it is, the program displays an error and quits.
#If it isn't empty, then the program can continue.
if [ -d $1 ]
then
	if [ "$(ls -A $1)" ]
	then
		dir=$(ls $1)
		for files in $dir
		do
			convert $1/$files -resize $2x$3 $1/$files
		done
	else
		echo Error, the directory is empty
	fi
fi
