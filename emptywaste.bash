#!/bin/bash
# emptywaste.bash - A command which permanently deletes everything in the waste bin
#author - Matthew Austwick, 2018

dir=~/.waste/
if [ -d $dir ]
#This if statement makes sure that the .waste directory actually exists
then
	echo " "
else
	echo "Your .waste directory does not exist and the program cannot continue"
	exit
fi
contents=$(ls ~/.waste | wc -w)
if [ $contents = 0 ]
then
	echo "Sorry, your directory is empty and the program cannot continue"
	exit
fi
rm -r ~/.waste/*
#The line above deletes everything inside of the .waste directory including
#any sub directories, forever.
echo "...All files have now been deleted..."
echo "The .waste directory now contains.."
ls ~/.waste
