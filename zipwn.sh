#!/bin/bash

# Green text because... obviously.
echo -e "\e[32m"
echo "Zipwn - Linux Edition"
echo "---------------------"

# Check for 7z
if ! command -v 7z &> /dev/null; then
    echo "7z missing. Run: sudo apt install p7zip-full"
    exit 1
fi

read -p "Archive Path: " archive
[[ ! -f "$archive" ]] && echo "File not found!" && exit 1

read -p "Wordlist Path: " wordlist
[[ ! -f "$wordlist" ]] && echo "Wordlist not found!" && exit 1

echo "Cracking..."

while IFS= read -r pass; do
    echo "ATTEMPT : $pass"
    
    # Run 7z quietly and check the return code
    7z x -p"$pass" "$archive" -o"cracked" -y > /dev/null 2>&1
    
    # In Linux, $? captures the last exit status
    if [ $? -eq 0 ]; then
        echo -e "\n================================="
        echo "Success! Password Found: $pass"
        echo "================================="
        exit 0
    fi
done < "$wordlist"

echo "Password not found."