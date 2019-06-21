#!/bin/sh

# This is a comment


cd /home/jupyter/IntroToBash/DATA/Spreadsheets/

echo "This script processes DATA files"

myVariable=DATA_1.csv
echo ${myVariable}

for x in *.csv;do grep "John" "$x";done

python scriptname.py variables 



