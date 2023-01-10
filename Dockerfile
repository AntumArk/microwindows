FROM ubuntu:latest AS prepare-stage
# Copies over rc.d which runs ar system startup to start display server
COPY build .
# -y is for accepting installs
WORKDIR /home/src
ADD ./src /home/src
# Update system
RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	build-essential \
	libfreetype-dev \
	libfreetype6 \
	libfreetype6-dev\
	libx11-dev \
	liballegro5-dev

FROM prepare-stage AS displaysetup-stage
# Source https://github.com/makerspacelt/pcb-mill/blob/master/workstation/Dockerfile
ENV XAUTHORITY /home/project/.Xauthority
## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y --no-install-recommends \
	libx11-xcb1 \
	libxtst6 \
	libasound2 \
	x11-apps \
	xvfb \
	xauth \
	xterm 
# Change user so you could run GUI
#USER project