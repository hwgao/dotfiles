[ -f ~/.vim/bundle/z/z.sh ] && source ~/.vim/bundle/z/z.sh

alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
# Must use single quotes, as it doesn't allow expansion of variable
alias C='c=$(cat ~/.commands | fzf) && echo $c && eval $c'
alias git-root='cd $(git rev-parse --show-toplevel > /dev/null 2>&1)'
alias rs=rmate
alias ctags='ctags --exclude=.git --exclude=.repo --exclude=.svn'

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

j() {
    [ $# -gt 0  ] && [ -d "$1"  ] && cd "$1" && return
    [ $# -gt 0  ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
alias c=j

# Example:
# s -w word_to search -t c
# s -w word_to_search -g *.c
s() {
    vim +"Ack $*"
}

ff() {
    F=$(fzf -m)
    echo F=\"$F\"
}

vv() {
   vi ${F}
}

cc() {
    cd "$(dirname $(echo $F | awk '{print $1}'))"
}

ffv() {
   F=$(fzf -m)
   vi $F
}

ffc() {
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

# Save current directory to variable R
# Then you can go back by running "cd $R" later
R() {
    R=$(pwd)
    echo $R
}

# https://unix.stackexchange.com/questions/13464/is-there-a-way-to-find-a-file-in-an-inverse-recursive-search/13474
upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
        # Start from parent dir
        directory="$directory/.."
        test -e "$directory/$1" && return 0
    done

    return 1
}

# Go back to root folder of git or repo
rooter() {
    if [ -d .git ]; then
	# If there is .git in current folder, then search up for .repo first
        if ! upsearch .repo; then
			# If can't find .repo, then search up for .git
            upsearch .git
        fi
    else
		# Or search up for .git
        upsearch .git
    fi

    directory=$(readlink -f $directory)
    if  [ $directory != "/" ]; then
        echo $directory
        cd $directory
    fi
}
