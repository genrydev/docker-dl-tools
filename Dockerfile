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
  
RUN echo "alias yd=\"youtube-dl --no-progress --quiet --ignore-errors\"" >> ~/.bashrc
RUN echo "alias ydl=\"youtube-dl --no-progress --quiet --ignore-errors  --output '%(playlist_index)s - %(title)s.%(ext)s'\"" >> ~/.bashrc
    
#Install last youtube-dl version

RUN curl --silent -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
