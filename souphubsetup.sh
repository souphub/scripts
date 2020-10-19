#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Certain things require privileges" 2>&1
    exit 1
fi

HUBADMINDIR="/home/hubadmin/SouphubSetup/scripts" 

# run a "grep function souphubsetup.sh" to get an idea 
# TODO: create usage function

# replace sources.list with ones using Catalyst's repositories
# for Google Chrome repo see 
# http://www.ubuntuupdates.org/ppa/google_chrome

function setup_repos() {
echo "* Replacing sources.list"
cp sources.list /etc/apt/
}
setup_repos

function run_apt_update() {
echo "* Updating packages"
apt-get update
}
run_apt_update


function setup_pkgs() {
# install extra software
echo "* Installing extra software"
cat souphub_ubuntu_packages.txt
apt-get install $(< souphub_ubuntu_packages.txt) 
}
setup_pkgs

function setup_include_google-chrome() {
if [ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]; then
echo "* Setting up Google Chrome"
/bin/bash ./setup_includes/setup_google-chrome.sh
fi
}
setup_include_google-chrome

function setup_unattended() {
# configure unattended-upgrades
# not sure when this file gets added: 
# /etc/apt/apt.conf.d/50unattended-upgrades
# might add a check to skip later
dpkg-reconfigure unattended-upgrades 
}
#setup_unattended

function setup_guest_prefs() {
# Guest Template setup
echo "* Unpacking Guest account template"
# TODO: fix with full path someday: 
# also how to skip if not changed?
./unpack_guest_prefs.sh
}
setup_guest_prefs

# More Guest Template setup stuff
# see https://help.ubuntu.com/community/CustomizeGuestSession

# add user guest-prefs to provide a guest template
# guest-prefs is an actual user 
# logging in as guest-prefs is an easy way to set up a user account 
# as a real user.  
# Once set up it can be copied into /etc/guest-session/skel 
# which is copied into a directory in /tmp for use by guest when guest
# logs in. 

function check_for_guest_prefs_user() {
id -u guest-prefs &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "* Setting up guest-prefs user" 
    useradd guest-prefs -m -s /bin/bash
    echo " * enter a password for guest-prefs"
    passwd guest-prefs
else
    echo "* Looks like the guest-prefs user is setup already" 
fi
}
check_for_guest_prefs_user

## link guest session's directory to guest-pref's home 

function link_guest_session() {
if [ ! -h "/etc/guest-session/skel" ]; then
    echo "* linking guest session skel to guest-prefs"
    #mkdir /etc/guest-session <- this is already getting setup somewhere else
    ln -s /home/guest-prefs /etc/guest-session/skel
else
    echo "* Looks like we linked the guest session skel to guest-prefs already" 
fi 
}
link_guest_session

function install_guest_prefs() {
  echo "* Installing /etc/guest-session/prefs.sh"
  cp ./prefs.sh /etc/guest-session/prefs.sh
}
install_guest_prefs

function install_auto_start() {
  echo "* Installing /etc/guest-session/auto.sh"
  cp ./auto.sh /etc/guest-session/auto.sh
}
install_auto_start

function create_guest_data() {
if [ ! -d "/var/guest-data" ]; then
 echo "* Creating persistent file share" 
 mkdir -m 0777 /var/guest-data
fi 
}
create_guest_data 

function setup_samba() {
if [ ! -f "/etc/samba/smb.conf.orig" ]; then
    echo "* Looks like Samba not setup, doing that now" 
    mv -v /etc/samba/smb.conf /etc/samba/smb.conf.orig
    cp -v $HUBADMINDIR/smb.conf /etc/samba/smb.conf
    /etc/init.d/smbd reload 
fi
}
setup_samba

# Depoly session timer script
function install_session_timer() {
   echo "* Installing guest timeout scripts"
   cp -v ./thirty-minute-warning.sh /usr/local/sbin/thirty-minute-warning.sh
   chmod +x /usr/local/sbin/thirty-minute-warning.sh
   cp -v ./three-minutes-left.sh /usr/local/sbin/three-minutes-left.sh
   chmod +x /usr/local/sbin/three-minutes-left.sh
}
install_session_timer

# Setup scanner clients 
function setup_scanner_clients() {
  echo "* Run commands from the setup_scanner directory,"
  echo "  if you want to setup a scanner client or server." 
}
setup_scanner_clients
