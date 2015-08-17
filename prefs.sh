#!/bin/bash 
# this should be copied to /etc/guest-session/prefs.sh

if [[ -r /usr/share/applications/google-chrome.desktop ]] ; then
mkdir -p "$HOME"/.local/share/applications
sed -e '/Exec/s/google[a-z-]\+/& --password-store=basic/' -e '/^Name=/s/=/&Guest /' \
< /usr/share/applications/google-chrome.desktop > "$HOME"/.local/share/applications/google-chrome.desktop
fi
