#!/bin/sh

apt-get -y update 

apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev

cd /usr/src

wget http://ffmpeg.gusari.org/static/32bit/ffmpeg.static.32bit.latest.tar.gz

tar -xzf ffmpeg.static.32bit.latest.tar.gz

cp -v ffmpeg /usr/local/bin/ffmpeg

cp -v ffprobe /usr/local/bin/ffprobe

wget http://nginx.org/download/nginx-1.13.1.tar.gz

wget https://github.com/arut/nginx-rtmp-module/archive/master.zip

tar -xvf nginx-1.13.1.tar.gz

unzip master.zip

cd /usr/src/nginx-1.13.1

./configure --add-module=../nginx-rtmp-module-master

make

make install

exit


