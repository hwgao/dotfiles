alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}
