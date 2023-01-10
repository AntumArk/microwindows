FROM ubuntu:latest AS prepare-stage
# Copies over rc.d which runs ar system startup to start display server
COPY build .
# -y is for accepting installs
WORKDIR /home/src
ADD ./src /home/src
# Update system
RUN apt-get update && apt-get upgrade -y --no-install-recommends \
	git \
	build-essential \
	libfreetype-dev \
	libfreetype6 \
	libfreetype6-dev\
	libx11-dev \
	liballegro5-dev

# Clone git repo 
# original repo 
# RUN git clone https://github.com/ghaerr/microwindows
# fork 
#RUN git clone https://github.com/AntumArk/microwindows

# Other option is to copy from current dir. COPY . .
#COPY . .

# Set folder to git repo
#WORKDIR microwindows/src
# OR local copy


# Copy config file
# Change to something different if your system requires it
#COPY config config