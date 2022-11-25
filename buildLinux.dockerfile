FROM microwin:latest AS prepare-stage
RUN echo "hello"
# -y is for accepting installs
WORKDIR /home/src
ADD ./src /home/src

# Build system
FROM prepare-stage AS build-stage
RUN make
