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
sudo apt-get update
sudo apt-get install -y build-essential cmake
# need by ycm 
sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y git vim tmux mc silversearcher-ag htop strace
sudo apt-get install -y curl
sudo apt-get install -y ctags cscope
sudo apt-get install -y autotools-dev automake
sudo apt-get install -y zim python-gtksourceview2 meld vim-gnome
# need by tmux to copy to clipboard
sudo apt-get install -y xclip
sudo apt-get install -y ranger
sudo apt-get install -y shellcheck
# Need to update to latest version to support input stream required by vim 
sudo apt-get install -y astyle
# Terminal music player
#sudo apt-get install -y cmus
#sudo apt-get install -y goldendict
#sudo apt-get install -y nautilus-actions nautilus-compare gnome-sushi
#sudo apt-get install -y openvpn network-manager-openvpn-gnome
# Need by OE-core
#sudo apt-get install -y texinfo gawk chrpath
#sudo apt-get install -y gsoap
#sudo apt-get install -y openssh-server
sudo apt-get install -y minicom uucp
# rdk 
sudo apt-get install -y diffstat texinfo chrpath

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

#To run a 32-bit executable file on a 64-bit multi-architecture Ubuntu
if [ "x$support_32bit" == "xy" ]; then
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
fi

#Manage node with nvm
if [ "x$install_node" == "xy" ]; then
    sudo apt-get install build-essential checkinstall
    sudo apt-get install libssl-dev
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash 
    . ~/.bashrc
    nvm install node
fi

if [ "x$install_samba" == "xy" ]; then
    sudo apt-get install samba
    sudo smbpasswd -a hongwei
    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.orig
    cat << EOF | sudo tee /etc/samba/smb.conf
[data]
    path = /data
    valid users = hongwei
    read only = no
EOF
    sudo service smbd restart
fi

sudo apt-get clean

# Configure bash as the default shell
sudo dpkg-reconfigure dash

# cd.bash
if [ "x$install_cdbash" == "xy" ]; then
    mkdir -p ~/mywork/cd.bash
    cd ~/mywork/cd.bash
    git clone https://gist.github.com/6640533.git
fi

# install latest tig
if [ "x$install_tig" == "xy" ]; then
    cd ~/mywork
    git clone https://github.com/jonas/tig.git
    cd tig
    git checkout $(git describe --tags)
    make
    make install
fi
