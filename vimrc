" Useful commands:
" * :tab /{pattern}  -- align selected lines by {pattern} with tabular
" * :b <tab> -- switch between buffers


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" samples begin
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
" samples end

Plugin 'mileszs/ack.vim'
" Vim plugin that displays tags in a window
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
" Show a diff via Vim sign column
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/vcscommand.vim'
" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'
Plugin 'dkprice/vim-easygrep'
Plugin 'vim-scripts/grep.vim'
Plugin 'klen/python-mode'
Plugin 'leshill/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'kergoth/vim-bitbake'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup      " do not keep a backup file, use versions instead
set nowritebackup
set noswapfile
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " autosave befor :make

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" http://superuser.com/questions/436890/cant-copy-to-clipboard-from-vim
if has('mouse')
  set mouse=a
endif

let python_highlight_all=1
syntax enable
set hlsearch
set cursorline

if has('gui_running')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set background=dark
    colorscheme solarized
    set showmatch       " show the matching part of the pair for [] {} and ()
else
    colorscheme elflord
endif


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" Ignore case when searching
set ignorecase

" If no uppercase char -- insensitive search
" If any uppercase char -- sensitive search
" Only used when ignorecase is on
set smartcase

" don't automatically wrap text when typing
set fo-=t

" Use spaces, not tabs in insert mode
" Use :retab to change all the existing tab characters to
" match the current tab setting
set expandtab
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" insert tabs on the start of a line according to
" shifwidth, not tabstop
set smarttab 	    
set autoindent
set smartindent
" show preview window below the current one
set splitbelow
set splitright

" ctags
set tags=tags;/

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_left=1

" include files search"
map <F10> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" A: c/h switch
" nnoremap <silent> <F11> :A<CR>

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
" set csto=1
" set cscopeprg=gtags-cscope
" cscope find calling
nnoremap <silent> <F9> :cs find s <C-R>=expand("<cword>")<CR><CR>
" quickfix
nnoremap <silent> <F5> :cn<CR>
nnoremap <silent> <F6> :cp<CR>

" Search in current file
" nnoremap <F3> :Ack -w <C-r><C-w> %
" nnoremap <F4> :Ack -w <C-r><C-w>
" Grep
nnoremap <silent> <F3> :Bgrep<CR>
nnoremap <silent> <F4> :Rgrep<CR>
" nnoremap <silent> <S-F3> :BgrepAdd<CR>
" nnoremap <silent> <S-F4> :RgrepAdd<CR>

" hide tool bar
set guioptions-=T

" enhance mode of the command complete
set wildmenu

" Where backup file is stored
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" set guifont=Fixed
set guifont=Monaco\ 10
" set guifont=Consolas\ 12
" set guifont=Monospace\ 10

" echofunc
"let g:EchoFuncAutoStartBalloonDeclaration = 0
let g:EchoFuncMaxBalloonDeclarations = 0

" navigate
noremap  <A-Left> <C-O>
noremap  <A-Right> <C-I>

" Saves all open buffers in the background, instead of closing them and re-opening on demand
set hidden

" Demands confirmation before closing unsaved buffers
set confirm

" If not use tmux navigator plugin
if !exists('$TMUX')
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" remove search in included files from the complete list
set complete-=i

" make YCM compatible with UltiSnips
" make ycm not use Tab key. Use <C-N> and <C-P> instead
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" ycmcompleter hotkeys
nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>jd :YcmCompleter GetDoc<CR>

" UltiSnips Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Not need any plugin to complete a tag
inoremap <c-x><c-]> <c-]>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map toggle paste mode
" set pastetoggle=<F11>

" if line wrapped, jump to the new row, not the next line
nnoremap j gj
nnoremap k gk

" clear highlighted searches
nnoremap <Leader>h :nohlsearch<CR>

" Forget to sudo before editing a file that requires root privileges
" Use w!! to do that after you opened the file already
cmap w!! w !sudo tee % >/dev/null

" when you :grep, ag will be used instead of grep
set grepprg=ag\ --noheading\ --nocolor\ --column

" Set easygrep mode to Open Buffers
let g:EasyGrepMode=1
" 1 - grepprg is used
let g:EasyGrepCommand=1

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Rebind <Leader> key
" let mapleader = ","

" vim-signify
let g:signify_vcs_list = ['git', 'svn']

" Better line wraps
" set showbreak=↪

" diff option
set diffopt=filler,vertical

" Use ag with ack.vim
let g:ackprg = 'ag --noheading --nocolor --column'

" find word under cursor with Ack, the trailing space is needed
nnoremap , :Ack -w <C-r><C-w>

" Unite
nmap <space> [unite]
nnoremap [unite] <nop>

let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    " Using ag as recursive command.
    " let g:unite_source_rec_async_command =
    "   \ 'ag --follow --nocolor --nogroup --hidden -g ""'
elseif executable('pt')
    " Use pt in unite grep source.
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '-i --nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
        \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" default is 1000. It is slow if large mru files
let g:neomru#file_mru_limit = 10
let g:neomru#directory_mru_limit = 10
" unite doesn't validate mru files
let g:neomru#do_validate = 0

let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap [unite]t :<C-u>Unite -no-split -start-insert -buffer-name=files   file_rec/async<cr>
nnoremap [unite]f :<C-u>Unite -no-split -buffer-name=files   file:!<cr>
nnoremap [unite]m :<C-u>Unite -no-split -buffer-name=mru     file_mru<cr>
" nnoremap [unite]o :<C-u>Unite -no-split -buffer-name=outline outline<cr>
nnoremap [unite]y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap [unite]b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap [unite]g :<C-u>Unite -no-quit  -keep-focus          grep<cr>
nnoremap [unite]r :<C-u>UniteResume<CR>
nnoremap [unite]s :<C-u>Unite file_rec -input=

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Always have a status line
set laststatus=2

" use vcscommand.vim if available >
let g:airline#extensions#branch#use_vcscommand = 1

" enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" enable/disable detection of whitespace errors.
let g:airline#extensions#whitespace#enabled = 1

" Automatically displays all buffer when there's only one tab open
" let g:airline#extensions#tabline#enabled = 1

" Confirm if 1 more files to edit
set confirm
 
" Show the tag under cursor in preview window
nnoremap <C-p> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

nnoremap <Leader>c :make<CR>

map <Leader>i [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" as much as possible of the last line in a window will be displayed.  When not set, a last line that doesn't fit is replaced with "@" lines. 
" set display+=lastline

" change the working directory to the dir for the current editing file
" :p Make file name a full path.
" :h Head of the file name(the last component and any separators removed)
" noremap ,cd :cd %:p:h<CR>:pwd<CR>
command! CCD cd %:p:h

" Use syntastic
let g:pymode_lint_on_write = 0
" Disable python-mode autocomplete, it conflicts with ycm
let g:pymode_rope_complete_on_dot = 0

" Override go-to.definition key shortcut
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override view python doc key shortcut
let g:pymode_doc_bind = "<Leader>d"

" python PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" web files indentation
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2

" OpenSCAD
au! BufRead,BufNewFile *.scad set filetype=openscad 

" Arduino hardy
" let g:hardy_arduino_options = "--board arduino:avr:mega" 
