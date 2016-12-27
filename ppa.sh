#!/bin/bash

# VIM
sudo add-apt-repository ppa:fcwu-tw/ppa
#TMUX
sudo add-apt-repository ppa:pi-rho/dev
#ag
sudo add-apt-repository ppa:pgolm/the-silver-searcher
#tig
sudo add-apt-repository ppa:clock/tig

sudo apt-get update

sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install the-silver-searcher
sudo apt-get install tig
