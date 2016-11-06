#!/bin/bash

mkdir nginx-build
cd nginx-build

wget http://nginx.org/download/nginx-1.11.5.tar.gz -O nginx.tar.gz
tar -xf nginx.tar.gz

wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master.zip

cd nginx-1.11.5
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make && sudo make install

sudo cp $REPO/nginx.conf /usr/local/nginx/conf
sudo cp $REPO/stat.xsl /usr/local/nginx/html
sudo cp $REPO/nginx.service /lib/systemd/system/
sudo systemctl enable nginx

rm -rf nginx-build
