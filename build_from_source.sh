#!/bin/bash

SRC_ROOT=~/src_root
mkdir -p ${SRC_ROOT} 

#Install checkinstall to easily uninstall
sudo apt-get install checkinstall
#Go to source code directory, then run "sudo checkinstall"

###vim
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

cd ${SRC_ROOT}
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gnome2 \
            --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
sudo make install

#Set vim as your default editor with update-alternatives.
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

###tmux
sudo apt-get install -y build-essential libevent-dev libncurses-dev
cd ${SRC_ROOT}
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout tags/2.3 -b 2.3
sh autogen.sh
./configure && make

sudo apt-get remove tmux
sudo make install

###ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
cd ${SRC_ROOT}
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
git checkout tags/1.0.2 -b 1.0.2
./build.sh
sudo apt-get remove silversearcher-ag
sudo make install

#cmake

###git
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x
cd ${SRC_ROOT}
git clone https://git.kernel.org/pub/scm/git/git.git
cd git
make all doc info prefix=/usr 
sudo apt-get remove git
sudo make install install-doc install-html install-info install-man prefix=/usr

#astyle
#first download astyle from sourceforge
cd astyle/build/gcc
make
