

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

if [ -z "$1" ]; then 
    echo "Usage: $0 <filename or directory>"
    exit 1
fi

target="$1"

if [ -e "$target" ]; then
    echo ""$target" exists."
else
    echo ""$target" does not exist."

fi

if [ -f "$target" ]; then 
    [ -r "$target" ] && echo "Readable" || echo "Not readable"

    [ -w "$target" ] && echo "writeable" || echo "Not writeable"

fi


if [-d "$traget" ]; then
    echo "'$traget' is adirectory."
fi
