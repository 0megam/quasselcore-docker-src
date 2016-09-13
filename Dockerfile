FROM ubuntu
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	libqt4-sql-psql \
	libqca2-plugin-ossl libicu55 \
        wget bzip2 build-essential cmake clang qt4-dev-tools
RUN cd /opt && wget http://quassel-irc.org/pub/quassel-0.12.4.tar.bz2 &&\
         tar xvf quassel-0.12.4.tar.bz2
RUN cd /opt/quassel-0.12.4 && mkdir build && cd build && cmake .. && make && make install


