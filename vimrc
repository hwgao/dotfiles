" Useful commands:
" * :Tab /{pattern}  -- align selected lines by {pattern} with tabular
" * :b <tab> -- switch between buffers
" * :CCD --- change current dir to the current file's dir
" * :DiffOrig -- diff current buffer with saved file
" * :BufOnly -- Delete all the buffers except the current/named buffer
" mark
" * <leader>m -- Mark the same words under cursor
" * <leader>n -- Clean all the marks
" nerdcommenter
" * <leader>cc -- Comment out the current line or text selected in visual mode
" * <leader>c<space> -- Toggles the comment state of the selected line(s)
" * <leader>cs -- Comments out the selected lines with a pretty block formatted layout
" DoxygenToolkit
" * :DOX --  Function / class comment: place the cursor on the line of the
"            function header (or returned value of the function) or the class.
"            Then execute the command :Dox.  This will generate the skeleton
"            and leave the cursor after the @brief tag.
" EasyGrep
" * <leader>vv -- Search word under cursor in all buffers
" * <Leader>vo -- Open an options explorer to select the files to search in
"            and set grep options
"
" * Ctrl+r Ctrl+w -- In command line mode, insert the word under the cursor.
" * w!! -- sudo save the file
" * 1 Ctrl+g -- Show the path of the current file
" * F9  -- search the symbol under cursor in cscope db
" * F10 -- Search the keyword under cursor in the current file and includes
" * F11 -- toggle paste mode
" bookmarks
" * mm -- toggle bookmark
" * ma -- list all bookmarks
" * mc -- clear bookmarks in current buffer
" * mx -- clear all bookmarks
" * mn, mp -- jump to next or previous bookmark
"
" * :retab -- Change all the existing tab to match the current tab settings
" Resize window
" * Ctrl+w = -- Resize all windows to equal dimensions based on their splits
" * Ctrl+w _ -- Increase a window to its maximum height
" * Ctrl+w | -- Increase a window to its maximum width
" * Ctrl+w o -- Same with :only. Make the current window the only one on the screen.
" * :sp filename -- horizontal split
" * :vsp filename -- vertical split
" Tab
" * Ctrl+w T -- Move the current window to a new tab page.
" * gt -- Goto the next tab
" * gT -- Goto the previous tab
" * :tabonly -- Close all other tabs
" * :tabedit filename -- Open the filename in a tab
"
" * ]p -- Pasting in the current indent
" * :e! -- Open the same file freshly discarding current changes
" * gd -- Search for define in same function
" * gD -- Search for define in same file
" format
" * :AutoFormat -- Format the current file, asytyle 2.05.1 is needed, or clang-format.
" * :%!astyle -- Call astyle formating current file
" change
" * :g; -- Jump back to the position of the previous (older) change.
" * :g, -- Jump to the position of the next (newer) change.
" * :changes -- List the changes
" * `. -- Jump to the position the last change was made.
"
" * :recover -- Try to recover from the swap file

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

" Vim plugin that displays tags in a window
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'morhetz/gruvbox'
" Alternate Files quickly (.c --> .h etc)
Plugin 'vim-scripts/a.vim'
" Script that will search for and load cscope.out databases automatically
Plugin 'vim-scripts/autoload_cscope.vim'
" Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)
Plugin 'vim-scripts/bufkill.vim'
" Delete all the buffers except the current/named buffer
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Highlight several words in different colors simultaneously.
Plugin 'dimasg/vim-mark'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'jiangmiao/auto-pairs'
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module CLI script 'ack'
Plugin 'rking/ag.vim'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'will133/vim-dirdiff'
Plugin 'tmhedberg/matchit'
Plugin 'Chiel92/vim-autoformat'

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
" bydefault backup off, writebackup on
" set nobackup      " do not keep a backup file, use versions instead
" set nowritebackup
" set noswapfile  " Swap files store changes you've made to the buffer. If Vim
                  " or your computer crashes, they allow you to recover those changes
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " autosave befor :make
set nofoldenable  " turn off folding
" set number        " show line number

" place yanked text into the global clipboard
set clipboard=unnamedplus

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

let g:solarized_termcolors=256
set t_Co=256           " Terminal support 256 color
if has('gui_running')
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set background=light
    colorscheme solarized
    set showmatch       " show the matching part of the pair for [] {} and ()
else
    set background=dark
    colorscheme gruvbox
    " when terminal or tmux using 16 colors mode
    " colorscheme desert
    " hi CursorLine term=bold cterm=bold guibg=Grey40  
endif

" hide currentline backgroud when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

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

" Display all line that contain the keyward under the cursor
" :help [I
map <F10> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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

" Grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git obj build lib'
let Grep_Skip_Files = '*.bak *~ *.so *.a *.o *.log *.fw'
nnoremap <silent> <F3> :Bgrep<CR>
nnoremap <silent> <F4> :Rgrep<CR>

" hide tool bar
set guioptions-=T

" enhance mode of the command complete
set wildmenu

" Where backup file is stored
set backupdir^=~/.vimbackup//
" The // at the end of the directory name tells Vim to use the absolute path
" to the file to create the swap file so there aren't collisions between files
" of the same name from different directories.
" The ^= syntax for :set prepends the directory name to the head of the list,
" so Vim will check that directory first.
set directory^=~/.vimbackup//

" set guifont=Fixed
set guifont=Monaco\ 10

" Saves all open buffers in the background, instead of closing them and re-opening on demand
set hidden

" Demands confirmation before closing unsaved buffers
set confirm

" If not use tmux navigator plugin
if !exists('$TMUX')
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
endif


" remove search in included files from the complete list
set complete-=i

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/mywork/*','!~/*']

" If use syntastic, disable it. As ycm will disable syntastic by default
" let g:ycm_show_diagnostics_ui = 0
" or
" sysntastic setting for c++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wpedantic'

" JavaScript lint -- eslint
" Install: # npm install -g eslint
let g:syntastic_javascript_checkers = ['eslint']

" ycmcompleter hotkeys
nnoremap <silent> <F2> :YcmCompleter GoTo<CR>
nnoremap <Leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>jd :YcmCompleter GetDoc<CR>

" UltiSnips Trigger configuration.
" make compatible with ycm
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Not need any plugin to complete a tag
inoremap <c-x><c-]> <c-]>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map toggle paste mode
" Refer to http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode


" if line wrapped, jump to the new row, not the next line
nnoremap j gj
nnoremap k gk

" clear highlighted searches
nnoremap <Leader>h :nohlsearch<CR>

" Forget to sudo before editing a file that requires root privileges
" Use w!! to do that after you opened the file already
cmap w!! w !sudo tee >/dev/null %

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

" find word under cursor with ag, in current dir (use :pwd to check current
" dir)
nnoremap , :Ag <C-r><C-w>

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
let g:neomru#file_mru_limit = 100
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
set statusline+=%F

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

" List the search of the word under cursor and let user to choose
map <Leader>i [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" as much as possible of the last line in a window will be displayed.
" When not set, a last line that doesn't fit is replaced with "@" lines.
" set display+=lastline

" change the working directory to the dir for the current editing file
" :p Make file name a full path.
" :h Head of the file name(the last component and any separators removed)
nnoremap <Leader>c :cd %:p:h<CR>:pwd<CR>

" set completeopt-=preview "Disable preview document when autocomplete
set completeopt=longest,menuone

" Disable syntastic for python
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
" or
" If use syntastic, disable it
" let g:pymode_lint_on_write = 0

" Disable python-mode autocomplete, it conflicts with ycm
let g:pymode_rope_complete_on_dot = 0

" Override go-to.definition key shortcut
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override view python doc key shortcut
let g:pymode_doc_bind = "<Leader>d"

" python PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" web files indentation
" Note: no space between file types
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 softtabstop=2 shiftwidth=2

" OpenSCAD
au! BufRead,BufNewFile *.scad set filetype=openscad

" kv
au BufNewFile,BufRead *.kv set filetype=kv

" log
au BufNewFile,BufRead *.log set filetype=log

" Arduino hardy
" let g:hardy_arduino_options = "--board arduino:avr:mega"

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" DoxygenToolkit
" let g:load_doxygen_syntax=1

" cindent option
" refer to indent.txt
" g0 -- don't indent c++ scope declarations -- public, protect, private
set cino+=g0

" let g:airline_theme='solarized'

" Insert semicolon at the end of line in insert mode
inoremap <c-;> <c-o>A;

" Max current window
map <F7> <C-W>_<C-W><Bar>
