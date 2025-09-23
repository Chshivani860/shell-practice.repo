
#!/bin/bash

number=$1

if [ $number -lt 10 ]; then
   echo "$number is less tha 10"
elif [ $number -gt 10 ]; then 
    echo "$number is greater than 10"
else
    echo "$number is equal to 10"
fi