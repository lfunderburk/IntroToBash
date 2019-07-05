#!/bin/sh
# This is a comment
# Script description: This script will iterate over all spreadsheets under /DATA/Spreadsheets and look for words


# Download Workshop Material
#git clone https://github.com/lfunderburk/IntroToBash

echo "This script processes DATA files"
echo "" 
echo "Changing directories to the Spreadsheets folder"

# Your path to the IntroToBask workshop material goes here - note it will be different from my path
cd /home/lgutierr/Documents/Notebooks/SciProgWorkshops/IntroToBash/DATA/Spreadsheets/

echo "" 
echo "Show us our current directory"

pwd

echo ""
echo "List all files in directory"

ls

echo ""
echo "What is the content of these files"

cat README.md

echo ""
echo "Show us all files containing the word "John"" 

# This is a for loop - it will iterate over all files under the Spreadsheets Directory
for x in *.csv;do grep -Hrn "John" "$x";done


echo ""
echo "Create a new file called 'Helloworld.txt'"

touch Helloworld.txt

echo ""
echo "List all files in directory"

ls

echo ""
echo "Remove Helloworld.txt"

rm Helloworld.txt

echo ""
echo "List all files in directory"

ls

echo "" 
echo "Changing directories to the Sequences folder"

# Your path to the IntroToBask workshop material goes here - note it will be different from my path
cd /home/lgutierr/Documents/Notebooks/SciProgWorkshops/IntroToBash/DATA/Sequences/

echo "" 
echo "Show us our current directory"

pwd

echo ""
echo "List all files in directory"

ls

echo ""
echo "What is the content of these files"

cat README.md


echo ""
echo "What is the Assembly name associated to these sequences?"

grep "Assembly name" GCF_002993025.1_ASM299302v1_assembly_report.txt

echo ""
echo "What is the Biosample associated to these sequences?"

grep "BioSample" GCF_002993025.1_ASM299302v1_assembly_report.txt


echo ""
echo "Print header of each sequence file"

for x in *.fasta;do grep ">" "$x";done


echo ""
echo "Print the first few lines of sequences for each file"

for x in *.fasta;do head "$x";done


echo ""
echo "Check if the substring ctg exists in  NXGI01000010.1.fasta"

if grep -Fq "CTG"  NXGI01000010.1.fasta; then 
	echo "CTG found in file"
else
	echo "CTG not found in file"
fi

echo ""
echo "Iterate over all fasta files searching for CTG"

for x in *.fasta;do 
	if grep -FHq "CTG"  "$x"; then 
        	echo "CTG found in file"
	else
        	echo "CTG not found in file"
	fi;
done




