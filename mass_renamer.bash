#! /bin/bash
#mass_copier.bash - A program which takes all files in a given directory
#and moves them into a specified directory and renames them all in a given format and with the numbers 1,2,3 etc. after them
#author - Matthew Austwick, 2018

if [ $# -ne 2 ] #This checks to make sure that the user has entered 2 arguments into the command
then
	echo "This program needs 2 arguemnts in the following format [mass_copier.bash <target directory> <desired name format>]"
	echo "Example usage would be [mass_copier.bash ~/testfiles File]"
	echo "This would rename all of the files in testfiles to be File1, File2, File3 etc."
	echo "Directories will be ignored"
	exit
fi
if [ -d $1 ]
then
	files=$(ls $1)
else
	echo "That directory does not exist. Please try again"
	exit
fi
#This assigns the results of the ls command of the directory into the files variable
count=1000
content=$(ls $1 | wc -w)
if [ $content = 0 ]
then
	echo "Your directory is empty; the program cannot continue"
	exit
fi
echo "Your files to be changed are"
echo $files
for file in $files
do
	if [ -d $1/$file ]
	#If the chosen file is a directory, the program does nothing and just continues
	then
		echo "The command has found a directory $file and will ignore it"
		continue
	fi
		count=`expr $count + 1`
		mv $1/$file $1/$2_${count:1}
		#This formats the text to have the first character if the count variable cut off
		#This is so that the numbers appear as 001, 002 etc.

done
echo "Your files are now listed as"
echo " "
ls $1
