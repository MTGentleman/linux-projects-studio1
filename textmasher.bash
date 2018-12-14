#! /bin/bash
# textmasher.bash - A program which initially takes 1 argument then repeats endlessly until the user enters a * somewhere within their string input
# author - Matthew Austwick, designed for Task 3 of the 1st Assignment of Studio1
test=1
if [ $# -lt 1 ] #This if statement merely checks to see if the user hasn't entered anything
then
	echo "Sorry, but this command can only have 1 or more  initial arguments. Please run the command again with 1 or more arguments"
	echo "This program processes text entered; ergo, it needs one or more stringed arguments. Please try again"
	exit
fi
text="$1" # This first saves the user's input into a variable which is used to compare and store other entered text
if [[ "$text" == *"*"* ]]
then
	test=2
fi
#This if statement checks as to whether or not their initial string as a * in it; if it does, it changes the value of test so the while loop doesn't run and it just skips to where it counts up the total number of each type of character in the string
echo "Welcome to the text masher!"
echo "You first value to check is $1"
echo "If any (digits, numbers or otherwise) have been entered, this program will count how many of each there are!"
echo "If you enter (or have entered) a '*' anywhere within the string, the program will terminate and display the aforementioned output"

while [ $test -eq 1 ]
#This only happens if the user did not enter a "*" in their initial argument 
do
	echo "Please enter more characters to be compared"
	read input
	curnum=$(echo "$input" | grep -o "[[:digit:]]" | wc -l)
	currentalpha=$(echo "$input" | grep -o "[[:alpha:]]" | wc -l)
	curpunct=$(echo "$input" | grep -o "[[:punct:]]" | wc -l)
	#These lines just calculate the last entered number of letters, numbers and symbols in the string the user JUST entered
	if [[ "$input" == *"*"* ]]; then
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
