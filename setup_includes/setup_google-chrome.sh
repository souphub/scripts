#!/bin/bash
set -e
# Possibly will be called from souphubsetup.sh
# Setup google chrome repo and browswer 

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
