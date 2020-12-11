FROM mongo:latest

EXPOSE 27017

RUN apt-get update
RUN apt-get install xz-utils

COPY venmo.tar.xz /tmp

# HOW TO GET EVERYTHING UP AND RUNNING

# docker build -t IMAGE_NAME /path/to/dockerfile

# docker run -p 27017:27017 --rm -d IMAGE_NAME

# docker ps -> copy name of container

# docker exec -it CONTAINER_NAME /bin/bash

# cd tmp

# tar xf venmo.tar.xz

# cd dump/test

# mongorestore --collection venmo --db test venmo.bson
