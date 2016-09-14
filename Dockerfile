FROM ubuntu
ENV QUASSEL_VER 0.12.4

MAINTAINER Omega  <omega@nimas.li>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
        wget bzip2 build-essential cmake clang qt4-dev-tools \
   	&& cd /opt && wget http://quassel-irc.org/pub/quassel-$QUASSEL_VER.tar.bz2 \
	&& tar xvf quassel-$QUASSEL_VER.tar.bz2 \
        && cd /opt/quassel-$QUASSEL_VER && mkdir build && cd build && cmake -DWANT_CORE=ON -DWANT_MONO=OFF -DWANT_QTCLIENT=OFF ..\
        && make && make install \
        && rm -rf /opt/quassel-$QUASSEL_VER && rm quassel-$QUASSEL_VER.tar.bz2 && mkdir -p /var/lib/quassel/ \
	&& apt-get purge wget bzip2 build-essential cmake clang qt4-dev-tools -y && apt-get autoremove -y

ENTRYPOINT ["quasselcore", "--configdir=/var/lib/quassel/"]

VOLUME ["/var/lib/quassel/"]
EXPOSE 4242

