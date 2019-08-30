FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y build-essential git
RUN apt-get install -y qt4-qmake libqt4-dev libqt4-sql-sqlite
RUN apt-get install -y cmake ninja-build
RUN apt-get install -y gcovr lcov
RUN apt-get install -y doxygen graphviz mscgen
RUN apt-get install -y xinetd vnc4server xvfb blackbox x11-apps x11-utils dbus-x11
RUN apt-get install -y clang clang-format clang-tidy
RUN apt-get install -y git ccache sshpass
RUN apt-get install -y python-minimal python-tornado python-gevent python-yaml python-pexpect

RUN apt-get install -y llvm-dev libclang-dev
RUN git clone -b v1.5 https://github.com/KDE/clazy.git /var/tmp/clazy
RUN cd /var/tmp/clazy; cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
RUN make -C /var/tmp/clazy all install

RUN apt-get install -y curl
RUN apt-get install -y python3.6 python3-websockets

RUN mkdir -p /var/run/dbus
RUN echo "QMAKE_CXX = ccache g++" >> /usr/share/qt4/mkspecs/linux-g++-64/qmake.conf

ENV DISPLAY :10

COPY runserver.sh /bin

CMD [ "/bin/runserver.sh" ]
