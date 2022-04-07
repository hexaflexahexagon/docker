FROM ubuntu:20.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gawk

RUN mkdir /www
WORKDIR /www

COPY gawk-website.gawk .
COPY example.html . 

CMD ./gawk-website.gawk example.html
EXPOSE 8080
