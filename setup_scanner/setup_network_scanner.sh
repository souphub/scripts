#!/bin/bash
# this should do it: 
echo "Copy the configs in to place" 
echo "See: https://help.ubuntu.com/community/SaneDaemonTutorial"
sudo cp -v saned.conf /etc/sane.d/saned.conf
sudo cp -v saned /etc/default/saned
# restart service
