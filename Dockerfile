FROM mongo:latest

EXPOSE 27017

RUN apt-get update
RUN apt-get install xz-utils

COPY venmo.tar.xz /tmp

EXPOSE 27017
