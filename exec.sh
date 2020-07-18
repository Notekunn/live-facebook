#!/bin/bash         
LINK_YOUTUBE="$1" 
KEY_LIVESTREAM="$2"
ffmpeg -stream_loop -1 -t 02:30:00 \
-re -i $(youtube-dl -f "best[height<720]" -g "${LINK_YOUTUBE}" --restrict-filenames) \
-stream_loop -1 \
-re -i $(youtube-dl -f bestaudio[ext=m4a] -g "${LINK_YOUTUBE}" --restrict-filenames) -vcodec copy -acodec \
copy -f flv "rtmps://live-api-s.facebook.com:443/rtmp/${KEY_LIVESTREAM}"