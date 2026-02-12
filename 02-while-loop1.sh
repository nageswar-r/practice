#!/bin/bash

MESSAGE=""
DISK_USAGE=$(df -hT | grep -v Filesystem )
USAGE_THRESHOLD=3

while IFS= read -r line 
do 
    USAGE=$( echo $line | awk '{print $6}' | cut -d "%" )
    PARTITION=$( echo $line | awk '{print $7}')

    if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
        MESSAGE+="High disk usage on $PARTITION: $USAGE% <br>"
    fi
done <<< $DISK_USAGE

echo "$MESSAGE"