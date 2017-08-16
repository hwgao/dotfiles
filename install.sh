#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

if [[ ! -d ~/src_root ]]; then
    mkdir ~/src_root
fi

if [[ ! -d ~/.vimbackup ]]; then
    mkdir ~/.vimbackup
fi

link_dotfiles() {
    dir=$(pwd)                        # dotfiles directory
    olddir=~/dotfiles_old             # old dotfiles backup directory
    files="bashrc shell_prompt.sh vimrc tmux.conf tmux_theme.conf inputrc vim gitconfig astylerc bash_aliases command"    # list of files/folders to symlink in homedir

    ##########

    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    echo "done"

    # change to the dotfiles directory
    echo -n "Changing to the $dir directory ..."
    cd $dir

    # move any existing dotfiles in homedir to dotfiles_old directory, then create
    # symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
    for file in $files; do
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
}

install_terminal_cmds() {
    echo -n "Install useful tools ..."
    sudo apt-get update
    sudo apt-get install -y build-essential cmake
    # need by ycm
    sudo apt-get install -y python-dev python3-dev
    sudo apt-get install -y git vim tmux mc silversearcher-ag htop strace
    sudo apt-get install -y curl
    sudo apt-get install -y ctags cscope
    sudo apt-get install -y ccache
    sudo apt-get install -y autotools-dev automake
    sudo apt-get install -y ranger
    sudo apt-get install -y shellcheck
    sudo apt-get install -y minicom uucp
    # rdk
    sudo apt-get install -y diffstat texinfo chrpath
    sudo apt-get install -y colordiff
    # Need by OE-core
    sudo apt-get install -y texinfo gawk chrpath
    sudo apt-get install -y gsoap
    sudo apt-get install -y openssh-server
    sudo apt-get clean
    # Configure bash as the default shell
    sudo dpkg-reconfigure dash
    # Need to update to latest version to support input stream required by vim
    ./install_from_source/astyle.sh
}

install_gui_cmds() {
    sudo apt-get install -y zim python-gtksourceview2 meld vim-gnome
    # need by tmux to copy to clipboard
    sudo apt-get install -y xclip
    sudo apt-get install -y uzbl
    # Terminal music player
    sudo apt-get install -y cmus
    sudo apt-get install -y goldendict
    sudo apt-get install -y nautilus-actions nautilus-compare gnome-sushi
    sudo apt-get install -y openvpn network-manager-openvpn-gnome
}

install_vim() {
    echo -n "Install latest vim ..."
    ./install_from_source/vim.sh
    echo -n "Install vim-plug ..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo -n "Install all vim plugins ..."
    vim +PlugInstall
}

install_bin() {
    echo -n "Clone bin folder ..."
    git clone ssh://pi2:/media/Work/repos/tools ~/bin
    echo "done"
}

#To run a 32-bit executable file on a 64-bit multi-architecture Ubuntu
support_32bit() {
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
}

install_samba() {
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
}

for var in "$@"; do
    case $var in
    "dotfile")
            link_dotfiles
            ;;
    "cmds")
            install_terminal_cmds
            ;;
    "gui")
            install_gui_cmds
            ;;
    "vim")
            install_vim
            ;;
    "bin")
            install_bin
            ;;
    "32bit")
            support_32bit
            ;;
    "samba")
            install_samba
            ;;
    *)
        ;;
    esac
done
