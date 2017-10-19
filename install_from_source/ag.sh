#!/bin/bash

SRC_ROOT=~/src_root

###ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
. ./git-lastest-tag https://github.com/ggreer/the_silver_searcher.git "$SRC_ROOT"
./build.sh
sudo apt-get remove -y silversearcher-ag
sudo make install


