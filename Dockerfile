# We use debian as our base distro for this container.
FROM debian:jessie

# Refresh apt-get.
RUN apt-get update

# Install some utilities needed by node, npm.
RUN apt-get install -y curl make g++

# Install Node.js and npm.
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# Install required npm packages.
COPY . /src/
WORKDIR /src

RUN npm install

EXPOSE  8085

# Run startup command.
CMD ["node", "/src/server.js"]
