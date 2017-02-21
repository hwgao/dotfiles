#!/bin/bash

SRC_ROOT=~/src_root

###git
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x
cd ${SRC_ROOT}
git clone https://git.kernel.org/pub/scm/git/git.git
cd git
make all doc info prefix=/usr 
sudo apt-get remove git
sudo make install install-doc install-html install-info install-man prefix=/usr
