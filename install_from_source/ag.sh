#!/bin/bash

SRC_ROOT=~/src_root

###ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
cd ${SRC_ROOT}
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
git checkout tags/1.0.2 -b 1.0.2
./build.sh
sudo apt-get remove silversearcher-ag
sudo make install


