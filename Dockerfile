FROM ubuntu:16.04
MAINTAINER glg8505@gmail.com

ENV DEBIAN_FRONTEND noninteractive

#Install dependencies

RUN apt-get update -qq && apt-get install -qqy \
  wget \
  curl \
  megatools \
  python \
  httrack
    
#Install last youtube-dl version

RUN curl --silent -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
