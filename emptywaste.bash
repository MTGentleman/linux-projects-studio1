#!/bin/bash
# emptywaste.bash - A command which permanently deletes everything in the waste bin
#author - Matthew Austwick, 2018

echo "The program will now delete everything inside of your secret .waste directory"
echo "...Deleting files now..."
rm -r ~/.waste/*
#The line above deletes everything inside of the .waste directory including
#any sub directories, forever.
echo "...All files have now been deleted..."
