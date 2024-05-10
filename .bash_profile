#!/bin/bash

# Greet the user with "Hello <username>" message
echo Hello $USER

# Definition of an environment variable called COURSE_ID with value equals to DevOpsFursa
export COURSE_ID=DevOpsFursa

# check if there is a file called ".token" in the home directory of the user
if [ -f ~/.token ]; then
    # check if its permissions are just read and write for user only
    if [stat -c "%a" ~/.token -ne 600]; then
        echo Warning: .token file has too open permissions
    fi
fi

# change the umask value to be just read and write for user adn group only
umask 117

# adding "/home/<username>/usercommands" directory to PATH environment variables
export PATH=$PATH:/home/mohammadgh/usercommands

# print the current date in ISO 8601 format
date --iso-8601=seconds






