#!/bin/sh

# This is a comment
# Script description: This script will iterate over all spreadsheets under /DATA/Spreadsheets and look for words

cd /home/jupyter/IntroToBash/DATA/Spreadsheets/

echo "This script processes DATA files"

for x in *.csv;do grep "John" "$x";done

# Sample command to create and print variables
myVariable=DATA_1.csv
echo ${myVariable}

# Sample command to run a Python script
python scriptname.py variables 





