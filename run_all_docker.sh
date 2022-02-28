#!/bin/bash
if [ -z "$1" ]
  then
    RESOURCES_FILE="resources.txt"
else
    RESOURCES_FILE=$1
fi

# AR=("file1.txt" "file2.txt" "file3.txt" "file4.txt")
AR=(0 50 100 150 200 250 300 350 400)


NUMBER=$(shuf -i 0-8 -n 1)

ARR_INDEX=${AR[NUMBER]}
# RESOURCES_FILE=${AR[NUMBER]}

echo "File: $RESOURCES_FILE"

IFS=$'\n' read -d '' -r -a lines < $RESOURCES_FILE

# for i in "${lines[@]}"
for ((i=$ARR_INDEX;i<=$ARR_INDEX+50;i++));
do
   echo "$i"
   export URL=$i
   docker run --platform linux/amd64 -d alpine/bombardier -c 300 -d 60000h -l $URL 
 done