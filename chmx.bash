#! /bin/bash
#chmx - A command that takes filenames as its arguments and and makes those files executable to every user

if [ $# -lt 1 ]
then
	echo "Sorry, there has been an error; please enter at least one argument which is a filename in your current directory"
	exit
fi
for var in $@
do
	if [ -w $var ]
	then 
		chmod +x $var
		echo "The command $var is now executable, thank you"
		echo " "
	else
		echo "Sorry, that file either does not exist or you do not have write permissions to that file. Please try again with a different file"
		exit
	fi
done
