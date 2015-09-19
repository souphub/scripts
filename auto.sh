# some things from:
# http://blog.schlomo.schapiro.org/2015/02/ubuntu-guest-user-lockdown.html
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set com.canonical.indicator.session suppress-restart-menuitem true
gsettings set com.canonical.indicator.session suppress-shutdown-menuitem true
gsettings set com.canonical.indicator.session suppress-suspend-menuitem true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-seconds true
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-week-numbers true
gsettings set com.canonical.indicator.datetime show-year true
# TODO set a time app to start here