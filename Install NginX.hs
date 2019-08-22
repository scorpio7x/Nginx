#!/bin/sh
#sed -i -e 's/\r$//' your_script.sh
#sudo apt-get install systemd -y

#install library and nginx
sudo apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev unzip

sudo wget https://github.com/scorpio7x/nginx/raw/master/nginx-1.15.5.tar.gz

sudo tar -xvzf nginx-1.15.5.tar.gz

cd nginx-1.15.5

sudo ./configure

sudo make

sudo make install

cd ..

sudo rm -rfv nginx-1.15*

sudo mkdir /usr/local/nginx/conf.d

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/server.conf

sudo mv -fv server.conf /usr/local/nginx/conf.d/

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/nginx.conf

sudo rm -rfv /usr/local/nginx/conf/nginx.conf

sudo mv -fv nginx.conf /usr/local/nginx/conf/

sudo /usr/local/nginx/sbin/nginx

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/nginx-service.sh

sudo mv -fv nginx-service.sh /etc/init.d/nginx
 
sudo chmod +x /etc/init.d/nginx

sudo /usr/sbin/update-rc.d -f nginx defaults

sudo service nginx reload