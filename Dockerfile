FROM ubuntu:latest AS prepare-stage
RUN echo "hello"
# -y is for accepting installs
WORKDIR /home/src
ADD ./src /home/src
# Update system
RUN apt-get update && apt-get upgrade -y \
	git \
	build-essential \
	libfreetype6-dev\
	libx11-dev

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

# Build system
FROM prepare-stage AS build-stage
RUN make
