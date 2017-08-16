#!/bin/sh
set -x

. ./git-lastest-tag https://github.com/jonas/tig.git ~/src_root
make
sudo make install prefix=/usr/local
