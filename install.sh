#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc tmux.conf inputrc vim gitconfig astylerc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo -n "Install useful tools ..."
sudo apt update
sudo apt install -y build-essential cmake
# need by ycm 
sudo apt install -y python-dev python3-dev
sudo apt install -y git vim tmux mc silversearcher-ag htop strace
sudo apt install -y curl
sudo apt install -y ctags cscope
sudo apt install -y autotools-dev automake
sudo apt install -y zim python-gtksourceview2 meld vim-gnome
# need by tmux to copy to clipboard
sudo apt install -y xclip
sudo apt install -y ranger
sudo apt install -y shellcheck
# Need to update to latest version to support input stream
sudo apt install -y astyle
# Terminal music player
sudo apt install -y cmus
#sudo apt install -y goldendict
#sudo apt install -y nautilus-actions nautilus-compare gnome-sushi
#sudo apt install -y openvpn network-manager-openvpn-gnome
# Need by OE-core
#sudo apt install -y texinfo gawk chrpath
#sudo apt install -y gsoap
sudo apt-get clean

mkdir -p ~/.vimbackup

echo -n "Clone Vundle ..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -n "Install all vim plugins ..."
vim +PluginInstall +qall

echo -n "Build ycm ..."
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

echo -n "Build vimproc(requested by unite) ..."
cd ~/.vim/bundle/vimproc.vim
make

echo -n "Clone bin folder ..."
git clone ssh://pi2:/media/Work/repos/tools ~/bin
echo "done"

echo -n "Install sag sack ..." 
git clone https://github.com/sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && ./install_sack.sh
