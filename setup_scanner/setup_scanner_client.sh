#!/bin/bash
# this should do it: 
#echo "Copy the configs in to place" 
#echo "See: https://help.ubuntu.com/community/SaneDaemonTutorial"
#sudo cp -v net.conf /etc/sane.d/net.conf
# restart service
# This is not used anymore ^
# To setup the current Brother scanner, requires brscan package: 
#
# sudo dpkg -i brscan4-0.4.9-1.amd64.deb 
# 
# And a config command like: 
#
# sudo brsaneconfig4 -a name=DCP7065DN model=DCP7065DN ip=172.16.3.164
# 
# You can check config w/:
# 
# root@souphub03:~/SouphubSetup/scripts/setup_scanner# brsaneconfig4 -q 
# * *DCP7065DN   [   172.16.3.164]  DCP7065DN
#
# So I guess that is the printers IP, which you can discover in various ways
# 
# Not sure if this will work on future versions of Ubuntu ^ 
