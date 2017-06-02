[ -f ~/.vim/bundle/z/z.sh ] && source ~/.vim/bundle/z/z.sh

alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'
alias git-root='cd $(git rev-parse --show-toplevel > /dev/null 2>&1)'
alias rooter=git-root
alias rs=rmate
alias ctags='ctags --exclude=.git --exclude=.repo --exclude=.svn'

export R='~/work/rdk-mstar'

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

j() {
    [ $# -gt 0  ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Example:
# s -w word_to search -t c
# s -w word_to_search -g *.c
s() {
    vim +"Ack $*"
}

ff() {
    F=$(fzf)
    echo F="\"$F\""
}

vv() {
   vi "$F"
}

cc() {
   cd "$(dirname "$F")"
}

vf() {
   F=$(fzf)
   vi "$F"
}

cf() {
   F=$(fzf)
   cd "$(dirname "$F")"
}

vb() {
    vi ~/.vimbuffer
    V=$(cat ~/.vimbuffer)
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

