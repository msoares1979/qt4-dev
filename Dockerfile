FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y qt4-qmake libqt4-dev
RUN apt-get install -y lcov
RUN apt-get install -y xinetd vnc4server xvfb openbox x11-apps x11-utils
RUN apt-get install -y dbus-x11
RUN mkdir /var/run/dbus

ENV DISPLAY :10

RUN echo "/usr/bin/Xvnc4 :10 -geometry 1920x1080 securitytypes=none &" >> ~/.bashrc
RUN echo "/bin/dbus-daemon --system --fork" >> ~/.bashrc
RUN echo "/bin/dbus-daemon --session --fork" >> ~/.bashrc
RUN echo "/usr/bin/openbox &" >> ~/.bashrc
