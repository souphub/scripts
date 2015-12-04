#!/bin/bash
# This will wait one second and then steal focus and make the Zenity dialog box always-on-top (aka. 'above').

(sleep 1 && wmctrl -F -a "30 Minute Warning" -b add,above) &
(DISPLAY=:0.0 /usr/bin/zenity --warning --title="30 Minute Warning" --text="Hi you have been using the computer for 30 minutes. Please check with the hub supervisor and see if anyone else needs to use the computer.  If not you can have another 15minutes before this session will end.  Please save any files you are working on before the session ends.  If no one else needs to use the computer, you can start a new 30 minute session by logging out and logging back in")