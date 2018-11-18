#! /bin/bash
# listwaste - A command which is used to display the names of the files inside of the
# .waste directory and lists their size in bites

echo Here are your files and their sizes in bytes
ls -l ~/.waste/ | awk '{print $5, $9}'
