#!/bin/bash
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
(sleep 1 && /usr/bin/wmctrl -F -a "30 Minute Warning" -b add,above) &
(/usr/bin/zenity --warning --title="30 Minute Warning" --width=$W --height=$H --text='<span font="20">You have been using the computer for 30 minutes: \n\n• Please check with the volunteer hub supervisor if anyone else needs to use the computer. \n\n• If not you can have another 15 minutes before this session will end. \n\n• Please save any files you are working on before the session ends and logout. \n\n(If no one else needs to use the computer, you can start a new 30 minute session by logging out and logging back in.) </span>')
