#!/bin/bash
# wastesize - A command which, when used, reports and displays the number of files/directories within .waste
#author - Matthew Austwick, 2018
dir=~/.waste
if [ -d $dir ]
#These two lines above make sure that the .waste directory exists in the first place
then
	echo " "
else
	echo "Sadly, your  .waste directory does not exist and the program cannot continue"
	exit
fi
number_of_files=$(ls ~/.waste | wc -w)
#The line above  searches the .waste directory and assigns the number of words (files/directories) to the variable
#called number_of_files
echo "There are $number_of_files file(s) in the waste directory"
