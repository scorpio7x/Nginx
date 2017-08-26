#!/bin/sh

sudo apt-get -y update 

sudo apt-get -y upgrade

sudo apt-get -y dist-upgrade

sudo apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev

cd /usr/src

wget https://github.com/scorpio7x/nginx/raw/master/ffmpeg.static.32bit.latest.tar.gzip

tar -xvf ffmpeg.static.32bit.latest.tar.gzip

sudo mkdir /usr/local/bin/ffmpeg

sudo mkdir /usr/local/bin/ffprobe

sudo cp -v /usr/src/ffmpeg /usr/local/bin/ffmpeg/

sudo cp -v /usr/src/ffprobe /usr/local/bin/ffprobe/

wget https://github.com/scorpio7x/nginx/raw/master/nginx-1.12.1.tar.gzip

wget https://github.com/scorpio7x/nginx/raw/master/nginx-rtmp-module-master.zip

wget https://github.com/scorpio7x/nginx/raw/master/nginx.conf

tar -xvf nginx-1.12.1.tar.gzip

unzip nginx-rtmp-module-master.zip

cd /usr/src/nginx-1.12.1

sudo ./configure --add-module=../nginx-rtmp-module-master

sudo make

sudo make install

sudo mv -fv /usr/src/nginx.conf /usr/local/nginx/conf/

sudo /usr/local/nginx/sbin/nginx

sudo rm -frv /usr/src/nginx*

sudo rm -frv /usr/src/ff*

sudo firefox localhost

exit


