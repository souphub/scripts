#!/bin/bash
set -e
# Called from souphubsetup.sh
# Setup google chrome repo and browser plus unattended updates for it

function setup_google() {
if [ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]; then
echo "* Setting up Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install google-chrome-stable
fi
}
setup_google

function setup_unattended_google() {
if [ ! "/etc/apt/apt.conf.d/google-chrome" ]; then
echo "* Setting up unattended updates for Google Chrome" 
echo "Unattended-Upgrade::Origins-Pattern:: \"origin=Google LLC\";" > /etc/apt/apt.conf.d/google-chrome
fi
}
setup_unattended_google
