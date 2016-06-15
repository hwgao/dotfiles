#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc tmux.conf inputrc vim gitconfig"    # list of files/folders to symlink in homedir

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
sudo apt install build-essential cmake
sudo apt install python-dev python3-dev
sudo apt install git vim-gnome tmux mc silversearcher-ag meld 
sudo apt install nautilus-actions nautilus-compare 
sudo apt install zim goldendict htop strace

echo -n "Clone Vundle ..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -n "Install all vim plugins ..."
vim +PluginInstall +qall

echo -n "Build ycm"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

echo -n "Clone bin folder ..."
git clone ssh://pi2:/media/Work/repos/tools ~/bin
echo "done"

