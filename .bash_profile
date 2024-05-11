#!/bin/bash

TOKEN=~/.token
USER_COMMANDS=/home/$USER/usercommands
TXT_ALIAS="ls *.txt"

# Greet the user with "Hello <username>" message
echo Hello $USER

# Definition of an environment variable called COURSE_ID with value equals to DevOpsFursa
export COURSE_ID=DevOpsFursa

# check if there is a file called ".token" in the home directory of the user
if [ -f ~/.token ]; then
    # check if its permissions are just read and write for user only
    if [ $(stat -c "%a" "$TOKEN") -ne 600 ]; then
        echo Warning: .token file has too open permissions
    fi
fi

# change the umask value to be just read and write for user and group only
umask 117

# adding "/home/<username>/usercommands" directory to PATH environment variables
export PATH=$PATH:$USER_COMMANDS

# print the current date in ISO 8601 format
date --iso-8601=seconds

# definition of a command alias that when "ltxt" command executed all the file with ".txt" extension will be printed
alias ltxt=$TXT_ALIAS

# check if there is a directory named "tmp" in the home directory of the user
if [ -f ~/tmp ]; then
    rm -r ~/tmp/*
else
    mkdir ~/tmp
fi

# killing the process that is bound to port 8080 (if it exists)
fuser -k 8080/tcp

