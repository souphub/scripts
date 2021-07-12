#!/bin/bash
# this should do it: 
#echo "Copy the configs in to place" 
#echo "See: https://help.ubuntu.com/community/SaneDaemonTutorial"
#sudo cp -v saned.conf /etc/sane.d/saned.conf
#sudo cp -v saned /etc/default/saned
# restart service
# ^ that was for old scanner we have a different one now
# New printer setup script: 
PRINTER_IP=172.16.3.164
# install:
dpkg -i brscan4-0.4.9-1.amd64.deb
sudo brsaneconfig4 -a name=DCP7065DN model=DCP7065DN ip=$PRINTER_IP
# Just rerun this after 20.04 upgrade
