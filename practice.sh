

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

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename or directory>"
  exit 1
fi

target="$1"

# Check if file or directory exists
if [ -e "$target" ]; then
  echo "✅ '$target' exists."

  # Check if it's a file
  if [ -f "$target" ]; then
    [ -r "$target" ] && echo "📖 Readable" || echo "🚫 Not readable"
    [ -w "$target" ] && echo "✍️ Writable" || echo "🚫 Not writable"
  
  # Check if it's a directory
  elif [ -d "$target" ]; then
    echo "📁 '$target' is a directory. Listing contents:"
    ls -l "$target"
  else
    echo "⚠️ '$target' is neither a regular file nor a directory."
  fi

else
  echo "❌ '$target' does not exist."
fi