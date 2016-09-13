FROM ubuntu
ENV QUASSEL_VER 0.12.4

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
         wget bzip2 build-essential cmake clang qt4-dev-tools

RUN cd /opt && wget http://quassel-irc.org/pub/quassel-$QUASSEL_VER.tar.bz2 &&\
         tar xvf quassel-$QUASSEL_VER.tar.bz2

RUN cd /opt/quassel-$QUASSEL_VER && mkdir build && cd build && cmake ..\
         && make && make install


