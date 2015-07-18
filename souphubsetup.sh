#!/bin/bash

# replace sources.list with ones using Catalyst's repositories
# for Google Chrome repo see 
# http://www.ubuntuupdates.org/ppa/google_chrome

echo "using Catalyst's Ubuntu repositories, and Google's one for Chrome. "

echo "Replacing sources.list"

cp sources.list /etc/apt/


echo "fetching keys for Google's repo"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 

echo "updating packages"
apt-get update 

# install extra software
echo "installing extra software" 
cat souphub_ubuntu_packages.txt
apt-get install $(< souphub_ubuntu_packages.txt) 

# configure unattended-upgrades
dpkg-reconfigure unattended-upgrades 

# Guest Template setup
echo "unpacking Guest account template" 
./unpack_guest_prefs.sh

# More Guest Template setup stuff
# see https://help.ubuntu.com/community/CustomizeGuestSession

# add user guest-prefs to provide a guest template
# guest-prefs is an actual user 
# logging in as guest-prefs is an easy way to set up a user account 
# as a real user.  
# Once set up it can be copied into /etc/guest-session/skel 
# which is copied into a directory in /tmp for use by guest when guest
# logs in. 

# uncomment the following to create guest-prefs user 

# useradd guest-prefs -m -s /bin/bash
# echo "enter a password for guest-prefs"
# passwd guest-prefs

## link guest session's directory to guest-pref's home 

echo "linking guest session skel to guest-prefs"

mkdir /etc/guest-session
ln -s /home/guest-prefs /etc/guest-session/skel



