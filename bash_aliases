alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'
alias git-root='cd $(git rev-parse --show-toplevel > /dev/null 2>&1)'
alias rooter=git-root

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

FF() {
    F=$(fzf)
    echo F="\"$F\""
}

FV() {
   vi "$F"
}

FC() {
   cd "$(dirname "$F")"
}

VF() {
   F=$(fzf)
   vi "$F"
}

CF() {
   F=$(fzf)
   cd "$(dirname "$F")"
}

mimg() {
    sudo cryptsetup luksOpen ~/mywork/.hwgao.img hwgao
    sudo mount /dev/mapper/hwgao ~/img
    cd ~/img
}

uimg() {
    sudo umount ~/img
    sudo cryptsetup luksClose hwgao
}
