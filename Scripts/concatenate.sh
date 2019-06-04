#!/bin/bash
# This bash script adds the name of csv files to the beginning of each row in the csv file, creating a column with a file "ID"
# It then concatenates the files.
# Store all files to process as a csv file in the directory "Files_to_analyze"
# To run, type: $ sh concatenate.sh

echo "... File concatenation begun"

cp -r Files_to_analyze Processing

first=1
for cell in Processing/Files_to_analyze/*
do
	fileID=$cell
	fileID=$(echo $fileID | sed 's/Processing\/Files_to_analyze\///' | sed 's/.csv//')
	if [ $first -eq 1 ]
	then
		cat $cell | sed "s/^/$fileID,/" > Concatenated_to_analyze.csv
		first=2
		echo $fileID.csv processed first
	else
		cat $cell | sed "s/^/$fileID,/" >> Concatenated_to_analyze.csv
                echo $fileID.csv processed
	fi
done

echo "... All files processed"
echo "... Outputting head of concatenated file:"
head Concatenated_to_analyze.csv

echo "... Removing temp files"
rm -r Processing/Files_to_analyze/

echo "... Concatenation complete"
