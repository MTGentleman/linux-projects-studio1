#!/bin/bash
# wastesize - A command which, when used, reports and displays the number of files/directories within .waste
#author - Matthew Austwick, 2018

number_of_files=$(ls ~/.waste | wc -w)
#The line above  searches the .waste directory and assigns the number of words (files) to the variable
#called number_of_files
echo "There are $number_of_files file(s) in the waste directory"
