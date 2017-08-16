#!/bin/bash

###tmux
sudo apt-get install -y build-essential libevent-dev libncurses-dev
. ./git-lastest-tag https://github.com/tmux/tmux.git ~/src_root
sh autogen.sh
./configure && make

sudo apt-get remove -y tmux
sudo make install

