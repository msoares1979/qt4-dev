FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y qt4-qmake libqt4-dev
RUN apt-get install -y lcov
RUN apt-get install -y xinetd vnc4server xvfb openbox x11-apps x11-utils

CMD /usr/bin/Xvnc4 :10 -geometry 1920x1080 securitytypes=none
CMD DISPLAY=:10 openbox
