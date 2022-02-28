#!/bin/bash
AR=("file1.txt" "file2.txt" "file3.txt" "file4.txt")

NUMBER=$(shuf -i 0-3 -n 1)

RESOURCES_FILE=${AR[NUMBER]}

echo "File: $RESOURCES_FILE"

IFS=$'\n' read -d '' -r -a lines < $RESOURCES_FILE

for i in "${lines[@]}"
do
   echo "$i"
   export URL=$i
   docker run --platform linux/amd64 -d alpine/bombardier -c 300 -d 60000h -l $URL 
 done