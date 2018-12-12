#! /bin/bash
# listwaste - A command which is used to display the names of the files inside of the
# .waste directory and lists their size in bites

if [ -d ~/.waste ]
then
	echo " "
else
	echo "The .waste directory does not exist and the program cannot continue"
	exit
fi
echo "Here are your files and their sizes in bytes"
ls -l ~/.waste/ | awk '{print $5, $9}'
#The line above gets a long list of all the files with the details about the file
#It then pipes it into the "awk" command which is used to splice off the unnecessary sections so it only displays the columns which display the file name and the size ijnn bytes
