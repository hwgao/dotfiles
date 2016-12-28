#!/bin/bash
# Test no ubuntu 12.04 32bit server

#sudo apt-get update
#sudo apt-get upgrade
sudo apt-get install python-software-properties

# VIM
sudo add-apt-repository ppa:fcwu-tw/ppa
#TMUX
sudo add-apt-repository ppa:pi-rho/dev
#ag
sudo add-apt-repository ppa:gekkio/ag
#git
sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update

sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install the-silver-searcher
sudo apt-get install git
