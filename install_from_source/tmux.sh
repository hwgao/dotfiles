#!/bin/bash

###tmux
sudo apt-get install -y build-essential libevent-dev libncurses-dev
cd ~/src_root
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout tags/2.3 -b 2.3
sh autogen.sh
./configure && make

sudo apt-get remove tmux
sudo make install

