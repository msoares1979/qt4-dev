#!/bin/sh -f

echo "Run XServer and Window Manager"

/usr/bin/Xvnc4 :10 -geometry 1920x1080 securitytypes=none &
/bin/dbus-daemon --system --fork
/bin/dbus-daemon --session --fork
/usr/bin/blackbox &
