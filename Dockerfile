FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y build-essential git
RUN apt-get install -y qt4-qmake libqt4-dev
RUN apt-get install -y gcovr lcov
RUN apt-get install -y doxygen graphviz mscgen
RUN apt-get install -y xinetd vnc4server xvfb blackbox x11-apps x11-utils
RUN apt-get install -y dbus-x11
RUN mkdir -p /var/run/dbus

ENV DISPLAY :10

COPY runserver.sh /bin

CMD [ "/bin/runserver.sh" ]
