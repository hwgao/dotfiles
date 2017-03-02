#!/bin/sh

cd ~/src_root
git clone https://github.com/jonas/tig.git
cd tig
git checkout $(git describe --tags)
make
sudo checkinstall
