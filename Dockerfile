FROM mongo:latest

EXPOSE 27017

RUN apt-get update
RUN apt-get install xz-utils

COPY venmo.tar.xz /tmp

# HOW TO GET EVERYTHING UP AND RUNNING

# docker ps -> copy name of container

# docker-compose exec CONTAINER_NAME /bin/bash

# cd tmp

# tar xf venmo.tar.xz

# mongorestore --host localhost --port 27017 -u admin -p password --authenticationDatabase admin --collection venmo --db test dump/test/venmo.bson
