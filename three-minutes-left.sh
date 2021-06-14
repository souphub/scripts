#!/bin/bash
# This will wait one second and then steal focus and make the Zenity dialog box always-on-top (aka. 'above').
# resizes the window to full height and 50% width and moves into upper right corner

#define the height in px of the top system-bar:
TOPMARGIN=27

#sum in px of all horizontal borders:
RIGHTMARGIN=10

# get width of screen and height of screen
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# new width and height
W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT - 2 * $TOPMARGIN ))


# This will wait one second and then steal focus and make the Zenity dialog box always-on-top (aka. 'above').
(sleep 1 && /usr/bin/wmctrl -F -a "3 Minute Warning" -b add,above) &
(/usr/bin/zenity --warning --title="3 Minute Warning" --width=$W --height=$H --text='<span font="20">You have 3 minutes left. \n\n After 3 minutes, you will be logged out. \n\n Save anything you want to keep <b>now</b>.</span>')
