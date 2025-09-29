DISK_USAGE=$(dh -hT | grep -v filesystem)
while IFS= read -r line
do 
    echo "line: $line"

done >>$DISK_USAGE