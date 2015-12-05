#!/bin/bash
# This will wait one second and then steal focus and make the Zenity dialog box always-on-top (aka. 'above').


(sleep 1 && /usr/bin/wmctrl -F -a "30 Minute Warning" -b add,above) &
(/usr/bin/zenity --warning --title="30 Minute Warning" --text='<span font="20">Hi, you have been using the computer for 30 minutes: \n\n• Please check with the hub supervisor and see if anyone else needs to use the computer. \n\n• If not you can have another 15 minutes before this session will end. \n\n• Please save any files you are working on before the session ends.  \n\n(If no one else needs to use the computer, you can start a new 30 minute session by logging out and logging back in.) </span>')