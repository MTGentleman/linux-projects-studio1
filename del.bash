#! /bin/bash
# del.bash - A command which copies files to a hidden .waste directory ready for future use
#author - Matthew Austwick, 2018
dir=~/.waste
if [ $# -lt 1 ]
then
	echo "Please try again; this command takes 1 argument and you entered none"
	exit
fi
if [ -d $dir ]
then
	echo " "
else
	echo "Your .waste directory does not exist; it will be created for you"
	mkdir ~/.waste
fi
for var in $@
do
	if [ -e $var ] #Tests if the file/directory actually exists in the first place
	then
		echo "$var has now been moved to the .waste directory"
		mv $var ~/.waste/ #If it does exist, it gets moved to the .waste directory
	else
		echo Sorry, your file/directory called $var  does not exist and therefore cannot be processed. Please try again with a valid file or directory #If it doesn#t exist, the program cannot continue further; ergo, it 
																			       #kicks out this friendly error message and then exits rather than just crashing altogether.
		exit
	fi
done
