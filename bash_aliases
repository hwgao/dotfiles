alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'
alias git-root='cd $(git rev-parse --show-toplevel)'

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

ff() {
    F=$(fzf)
    echo F="\"$F\""
}

of() {
   F=$(fzf)
   if [ -d "$F"  ]; then
       cd "$F"
   elif [ -f "$F"  ]; then
       vi "$F"
   fi
}
