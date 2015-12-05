#!/bin/bash
# This will wait one second and then steal focus and make the Zenity dialog box always-on-top (aka. 'above').


(sleep 1 && /usr/bin/wmctrl -F -a "3 Minute Warning" -b add,above) &
(/usr/bin/zenity --warning --title="3 Minute Warning" --text='<span font="20">You have 3 minutes left. \n\n After 3 minutes, you will be logged out. \n\n You must save anything you want to keep <b>now</b>.</span>')
