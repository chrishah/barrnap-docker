FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install -y \
		wget language-pack-en \
		git=1:2.17.1-1ubuntu0.7 \
		build-essential=12.4ubuntu1 \
		perl=5.26.1-6ubuntu0.3 \
		hmmer=3.1b2+dfsg-5ubuntu1 

#RUN apt-get install -y libhts2=1.7-2

#Set language
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8 
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

#install bedtools
WORKDIR /usr/bin
RUN wget -O bedtools https://github.com/arq5x/bedtools2/releases/download/v2.29.2/bedtools.static.binary && \
	chmod a+x bedtools

#install barrnap
WORKDIR /usr/src
RUN git clone https://github.com/tseemann/barrnap.git && \
	cd barrnap && \
	git checkout 0.9 && \
	ln -s $(pwd)/bin/barrnap /usr/bin/

