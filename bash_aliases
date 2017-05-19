alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

F() {
    F=$(fzf)
}

OF() {
   F=$(fzf)
   if [ -d "$F"  ]; then
       cd "$F"
   elif [ -f "$F"  ]; then
       vi "$F"
   fi
}
