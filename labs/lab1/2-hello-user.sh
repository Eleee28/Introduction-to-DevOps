#! /bin/bash
# Greet user with a message (use read command to read from stdin)
# man: https://phoenixnap.com/kb/bash-read

read -p "Enter your name: " name
echo "Hello $name"
