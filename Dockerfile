FROM ubuntu:18.04
LABEL Name=live-facebook Version=1.0.0
WORKDIR /user/src/home
RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:jonathonf/ffmpeg-4 -y
RUN apt-get install ffmpeg -y
RUN apt install curl -y
RUN apt install python -y
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl &&  chmod a+rx /usr/bin/youtube-dl
COPY . .
RUN chmod +x './exec.sh'