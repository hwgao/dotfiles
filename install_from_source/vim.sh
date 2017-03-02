#!/bin/bash

SRC_ROOT=~/src_root

#Install checkinstall to easily uninstall
sudo apt-get install -y checkinstall
#Go to source code directory, then run "sudo checkinstall"

###vim
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

cd ${SRC_ROOT}
git clone https://github.com/vim/vim.git
cd vim
./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=$(/usr/bin/python2-config  --configdir) \
    --enable-python3interp=yes \
    --with-python3-config-dir=$(/usr/bin/python3-config --configdir) \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-cscope \
    --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox vim-runtime
#sudo make install
sudo checkinstall
#dpkg -r vim # to remove

#Set vim as your default editor with update-alternatives.
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
