[ -f ~/.vim/bundle/z/z.sh ] && source ~/.vim/bundle/z/z.sh

alias vs="vim -S ~/.vim/default_session"
alias diff=colordiff
alias less='less -i'
alias git-root='cd $(git rev-parse --show-toplevel > /dev/null 2>&1)'
alias git-fresh='git clean -df; git reset --hard'
alias rs=rmate
alias ctags='ctags --exclude=.git --exclude=.repo --exclude=.svn'
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'
alias ag='ag -U --path-to-ignore ~/dotfiles/agignore'
alias rg='rg -u --ignore-file ~/dotfiles/agignore'
alias qtcreator='~/opt/qtcreator-4.3.1/bin/qtcreator &> /dev/null &'
alias cdt='~/opt/eclipse/cpp-oxygen/eclipse/eclipse &> /dev/null &'
alias clion='/home/hongwei/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/172.3544.40/bin/clion.sh &'
alias bmake='bear make'
alias gen-ycm-include-cross='find -type d -iname include > .ycm_include_cross'

# If a command needs parameters, it can refer the parameters through the array variable _REPLACE_ME_
# The formats:
# ${_P_[*]} -- all parameters
# ${_P_[index]} -- the paramete at the specified index
# ${_P_} is same with ${_REPLACE_ME_[0]}
C() {
   F=$(cat ~/.commands|fzf-tmux)
   echo $F
   if [[ $F == *" \${_P_"* ]]; then
      echo Please input parameters:
      # Read into array
      read -a _P_
   fi
   eval $F
}

url2epub() {
    pandoc -f html -t epub3 -o "$2".epub "$1"
}

c() {
    [ $# -gt 0  ] && [ -d "$1"  ] && cd "$1" && return
    [ $# -gt 0  ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf-tmux -e --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Example:
# s -w word_to search -t c
# s -w word_to_search -g *.c
# s() {
#     vim +"Ack $*"
# }
s() {
    #rg -u --vimgrep --ignore-file ~/dotfiles/agignore "$@" | vim -
    local TEMPFILE=$(mktemp)
    rg -u --vimgrep --ignore-file ~/dotfiles/agignore "$@" | tee "$TEMPFILE"
    if [ -s "$TEMPFILE" ]; then
       vim -c :copen -q "$TEMPFILE"
    fi
    rm -f "$TEMPFILE"
}

ff() {
    # -m -- enable multi-select mode, TAB and shift-TAB to mark multiple items
    F=$(fzf-tmux -m "$@")
    echo F=\"$F\"
}

fc() {
    if [ -f cscope.files ]; then
        F=$(cat cscope.files | fzf-tmux -m "$@")
        echo F=\"$F\"
    else
        ff
    fi
}

vv() {
   if [ ! -z "${F}" ]; then
       vi ${F}
   fi
}

cc() {
   if [ -z "${F}" ]; then
      return
   fi

   if [ -d "${F}" ]; then
      cd "${F}"
   else
       cd "$(dirname $(echo $F | awk '{print $1}'))"
   fi
}

ffv() {
    ff "$@"
    vv
}

ffc() {
    ff "$@"
    cc
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
upsearch() {
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

alias cr=rooter

repo-git() {
    if [ -d .repo/manifests/ ]; then
        pushd .repo/manifests > /dev/null 2>&1
        git $@
        popd  > /dev/null 2>&1
    else
        echo "Don't find repo info"
    fi
}

git-commit() {
    git diff --cached --check --no-ext-diff && git commit $@
}

o() {
    filename=$(basename "$1")
    ## Substring Removal
    # "#"  -- delete shortest match from front
    # "##" -- delete longest match from front
    # "%"  -- delete shortest match from back
    # "%%" -- delete longest match from back
    extension="${filename##*.}"
    #filename="${filename%.*}"
    case "$extension" in
        pdf)
            exe=mupdf
            ;;
        com|org)
            exe="uzbl -u"
            ;;
        *)
            exe=gvim
            ;;
    esac

    eval "$exe \"$1\" 2> /dev/null &"
}

swap() {
    local SRC
    local DEST
    local TMP
    if [ $# -eq 1 ]; then
        SRC="${1%.hiden}"
        DEST="${SRC}.hiden"
    elif [ $# -ge 2 ]; then
        SRC="$1"
        DEST="$2"
    fi

    if [ -e "${SRC}" ]; then
        if [ -e "${DEST}" ]; then
            TMP=".${SRC}.tmp"
            mv "${SRC}" "${TMP}"
            mv "${DEST}" "${SRC}"
            mv "${TMP}" "${DEST}"
        else
            mv "${SRC}" "${DEST}"
        fi
    else
        if [ -e "${DEST}" ]; then
            mv "${DEST}" "${SRC}"
        fi
    fi
}

comp() {
    vi -c ":DirDiff ${1} ${2}"
}

mru() {
    vi -c ":History<CR>"
}

ldir() {
    F=$(find -maxdepth $1 -type d | fzf-tmux -m)
    echo F=\"$F\"
}

tftproot() {
   rm ~/tftp_root
   if [ $# -eq 1 ]; then
      ln -s $(realpath $1) ~/tftp_root
   else
      ln -s "$(pwd)" ~/tftp_root
   fi
}
