#! /bin/bash
# textmasher.bash - A program which initially takes 1 argument then repeats endlessly until the user enters a * somewhere within their string input
# author - Matthew Austwick, designed for Task 3 of the 1st Assignment of Studio1

if [ $# -lt 1 ] #This if statement merely checks to see if the user hasn't entered anything
then
	echo "Sorry, but this command can only have 1 initial argument. Please run the command again with 1 argument"
	exit
fi
echo "Welcome to the text masher!"
echo "You first value to check is $1"
echo "Please enter characters (digits, numbers or otherwise) and this program will count how many of each there are!"
echo "If you enter a '*' anywhere within the string, the program will terminate and display the aforementioned output"
echo "$1" >> text_mash.txt #This first creates  a file called text_mash.txt which is used to store the values of whatever the user enters
while true; 
do
	echo "Please enter more characters to be compared"
	read input
	if [[ $input == *"*"* ]]; then
		echo "$input" >> text_mash.txt #This, similar to the line below, appends to the text_mash.txt; however, for this line it also INCLUDES
					       #the terminating * character and what they entered before it 
		break
	else
		echo "$input" >> text_mash.txt
	fi
done
#The lines below just take the text_mash.txt file and search for the number of digits, alpha (letters) characters and punctuation marks
#It stores it in a variable which has an appropriate name then displays it out to the user
numberOfDigits=$(grep -o '[[:digit:]]' text_mash.txt | wc -l)
echo "The total number of entered digits is: "$numberOfDigits
numberOfLetters=$(grep -o '[[:alpha:]]' text_mash.txt | wc -l)
echo "The total number of entered letters is: "$numberOfLetters
numberOfPunct=$(grep -o '[[:punct:]]' text_mash.txt | wc -l)
echo "The total number of entered punctuation is: "$numberOfPunct
rm text_mash.txt #This deletes the file that was created at the beginning in order to save space but also to make sure it doesn't
		 #contaminate the results, the next time it is run
