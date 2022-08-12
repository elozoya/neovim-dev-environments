#!/bin/bash

# This user has a password an is sudoer
# because I like to get inside the container and install new temporary tools just to play with them
apt-get update
apt-get -y install sudo zsh
groupadd -g $GROUP_ID $USER_GROUP_NAME
useradd -rm -d /home/$USER_NAME -s /bin/zsh -g $USER_GROUP_NAME -G sudo -u $USER_ID $USER_NAME
echo "$USER_NAME:$USER_PASS" | chpasswd
