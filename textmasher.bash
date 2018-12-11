#! /bin/bash
# textmasher.bash - A program which initially takes 1 argument then repeats endlessly until the user enters a * somewhere within their string input
# author - Matthew Austwick, designed for Task 3 of the 1st Assignment of Studio1

if [ $# -ne 1 ] #This if statement merely checks to see if the user hasn't entered anything
then
	echo "Sorry, but this command can only have 1 initial argument. Please run the command again with 1 argument"
	exit
fi
echo "Welcome to the text masher!"
echo "You first value to check is $1"
echo "Please enter characters (digits, numbers or otherwise) and this program will count how many of each there are!"
echo "If you enter a '*' anywhere within the string, the program will terminate and display the aforementioned output"
#The line above assigns a file to a variable; this saves time because this file will need to be written to and read from multiple times; this saves me from writing out the file name multiple times and over and over again.
text=$1 #This first saves the user's input into a variable  which is used to store the values of whatever the user enters
while true; 
do
	echo "Please enter more characters to be compared"
	read input
	curnum=$(echo $input | grep -o "[[:digit:]]" | wc -l)
	currentalpha=$(echo $input | grep -o "[[:alpha:]]" | wc -l)
	curpunct=$(echo $input | grep -o "[[:punct:]]" | wc -l)
	if [[ $input == *"*"* ]]; then
		text="$text$input" #This, similar to the line below, appends to the textmash_results.txt; however, for this line it also includes the terminating * character and what they entered before it. 
		echo "You had $curnum digits in your last entered string"
		echo "You have $currentalpha letters in your last entered string"
		echo "You had $curpunct non alpha-numeric characters in your last entered string"
		break
	fi
	text="$text$input" #This line just means that the command will append the user's input to the variable created at the start of the program.
done
#The lines below just take the text_mash.txt file and search for the number of digits, alpha (letters) characters and the different types of punctuation.
#It stores it in a variable which has an appropriate name then displays it out to the user
num=$(echo $text | grep -o '[[:digit:]]'| wc -l) #This searches the variable for any digits after splitting it up into many different lines
echo "The total number of entered digits is: "$num #This then displays that result and neatens up the code a bit.
alpha=$(echo $text | grep -o '[[:alpha:]]' | wc -l)
echo "The total number of entered letters is: "$alpha
punct=$(echo $text | grep -o '[[:punct:]]' | wc -l)
echo "The total number of entered punctuation is: "$punct
