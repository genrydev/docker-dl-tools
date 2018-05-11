FROM ubuntu:16.04
MAINTAINER glg8505@gmail.com

ENV DEBIAN_FRONTEND noninteractive

#Install dependencies

RUN apt-get update -qq && apt-get install -qqy \
  wget \
  curl \
  megatools \
  python \
  httrack \
  aria2 \
  git

#Install last youtube-dl version

RUN curl --silent -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

#Create alias

RUN echo -e '#!/bin/bash\nyoutube-dl --no-progress --quiet --ignore-errors $1' > /usr/bin/yd && \
    chmod +x /usr/bin/yd
    
RUN echo -e '#!/bin/bash\nyoutube-dl --no-progress --quiet --ignore-errors --output "%(playlist_index)s - %(title)s.%(ext)s" $1' > /usr/bin/ydl && \
    chmod +x /usr/bin/ydl
    
