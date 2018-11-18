#!/bin/bash
# wastesize - A command which, when used, reports and displays the number of files/directories within .waste


number_of_files=$(ls ~/.waste | wc -w)
echo "There are $number_of_files file(s) in the waste directory"
