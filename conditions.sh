
#!/bin/bash

echo "Enter the number:"
read number

if [ $((number % 2))  -eq  0 ]; then 
    echo "The given number is EVEN"

else 
    echo "The given number is ODD"
fi