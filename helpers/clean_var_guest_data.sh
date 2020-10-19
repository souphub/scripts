#!/bin/bash
GUEST_DATA="/var/guest-data/"
find $GUEST_DATA* -mtime +365 -delete
