#!/bin/bash

if [ $# -lt 3 ]
then
	echo "Error. Usage of the command is [lshead.bash <head/tail> <#no of lines> <directory>"
	exit
fi
dir_content=$(ls $3)
for file in $dir_content
do
	if [ -d $file ]
	then
		echo "This file is a directory, the program will not process this directory, but will continue"
		continue
	fi
	if [ $1 == "head" ]
	then
		file_content=$(head -$2 $3/$file)
	elif [ $1 == "tail" ]
	then
		file_content=$(tail -$2 $3/$file)
	fi
	echo Your file $file contains $file_content
	echo " "
done
