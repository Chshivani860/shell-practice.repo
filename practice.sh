

: <<'END_COMMENT'
# Everything between these lines is ignored by the shell
person1="riya"
person2="karan"

echo "$person1: $person2, did you finish the assignment?"
echo "$person2: Not yet $person1. I got stuck on the last question."
echo "$person1: Want me to take a look?"
echo "$person2: That'd be awesome $person1. Thanks!"
END_COMMENT


#!/bin/bash
target="$1"
if [ -z "$target" ]; then 
    echo "Usage: $0 <filename or directory>"
    exit 1
fi
if [ -e "$target" ]; then
    echo "\"$target\" exxists."
    if  [ -f "$target" ]; then 
        echo "\"$target\"regular file."
        [ -r "$target" ] && echo "Readable" || echo "Not readable"
        [ -w "$target" ] && echo "writeable" || echo "Not writeable"


    elif [ -d "$target" ]; then
        echo "\"$target\" is a directory."
        echo "contents:"
        ls  -l "$target"
    else 
        echo " "$target" is not a directory."
    fi

else
    echo "\"$target\" doest not exist."
fi