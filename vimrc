" Useful commands:
" * :Tab /{pattern}  -- align selected lines by {pattern} with tabular
" * :b <tab> -- switch between buffers
" * :b# or Ctrl+6 or Ctrl+^ -- switch back to previous buffer
" * :DiffOrig -- diff current buffer with saved file
" * :BufOnly -- Delete all the buffers except the current/named buffer
" DoxygenToolkit
" * :DOX --  Function / class comment: place the cursor on the line of the
"            function header (or returned value of the function) or the class.
"            Then execute the command :Dox.  This will generate the skeleton
"            and leave the cursor after the @brief tag.
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
" * ]p -- Paste in the current indent
" * :e! -- Open the same file freshly discarding current changes
" * gd -- Search for define in same function
" * gD -- Search for define in same file
" format
" * :AutoFormat -- Format the current file, asytyle 2.05.1 is needed, or clang-format.
" * :%!astyle -- Call astyle formating current file
" change
" * g; -- Jump back to the position of the previous (older) change.
" * g, -- Jump to the position of the next (newer) change.
" * :changes -- List the changes
" * `. -- Jump to the position the last change was made.
" * `` -- To the position before the latest jump, or where the last "m'" or
"         "m`" command was given
"
" * :recover -- Try to recover from the swap file
" * :bro[wse] ol[dfiles] -- list all recent files and prompt to enter a file number
" * :set list -- To show tab with >... whitespace with ␣ eol with ¬
" * :set nolist -- to clean them
" * , -- Ack search
" * :%/\s\+$//e -- Delete any trailing whitespace at the end of each line
" * :runtime syntax/colortest.vim -- test color setup
"
" <Leader>
" * <Leader>] -- Show the tag in preview window
" * <Leader>i -- List searching of the current word
" * <Leader>h -- Clear highlighted searches
" * <Leader>m -- Mark the same words under cursor
" * <Leader>n -- Clean all the marks
" * <Leader>y -- Cross vim copy if no X11 or copy to system clipboard
" * <Leader>p -- Paste above copied text
" * <Leader>s -- Save session
" * <Leader>c -- change current dir to the current file's dir
" * <Leader>cc -- Comment out the current line or text selected in visual mode
" * <Leader>c<space> -- Toggles the comment state of the selected line(s)
" * <Leader>cs -- Comments out the selected lines with a pretty block formatted layout
"
" * <Space>f -- fzf Files
" * <Space>b -- fzf Buffers
" * <Space>h -- fzf Historys
" * <Space>t -- fzf Tags
" * <Space>l -- fzf BTags
" * <Space>c -- fzf CSFiles
" * <Space>o -- Switch back to previous buffer
" * <Space>m -- max
" * <Space>n -- :cn
" * <Space>p -- :cp
" * <Space>, -- rg
"
" Use cscope.files to manage project
" The project can include the files spreaded in several directories.
" Use cscope.files to manage the files in project.
" All the cscope commands are used in project.
" <Space>c -- Search a file in project.
" <Space>s -- Search the text in all files of the project.

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/bundle')

" Vim plugin that displays tags in a window
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'christoomey/vim-tmux-navigator'
" Show a diff via Vim sign column
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/vcscommand.vim'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'
" Plug 'dkprice/vim-easygrep'
Plug 'vim-scripts/grep.vim'
Plug 'klen/python-mode'
Plug 'leshill/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'kergoth/vim-bitbake'
" UltiSnip Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"Plug 'scrooloose/syntastic'
" Alternate Files quickly (.c --> .h etc)
Plug 'vim-scripts/a.vim'
" Script that will search for and load cscope.out databases automatically
" Plug 'vim-scripts/autoload_cscope.vim'
" Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)
Plug 'vim-scripts/bufkill.vim'
" Delete all the buffers except the current/named buffer
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
" Highlight several words in different colors simultaneously.
Plug 'dimasg/vim-mark'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
" Plug 'Rip-Rip/clang_complete'
" Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'will133/vim-dirdiff'
Plug 'tmhedberg/matchit'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/src_root/fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'  }

"""""""colorscheme""""""""
Plug 'altercation/vim-colors-solarized'
" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'octol/vim-cpp-enhanced-highlight'
"""""""colorscheme""""""""

" All of your Plugins must be added before the following line
call plug#end()            " required

if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Automatic reloading of .vimrc after saved .vimrc
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
set autowrite     " autosave before :make
set nofoldenable  " turn off folding
" set number        " show line number

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
nnoremap <silent> <F8> :NERDTreeClose<CR>:TagbarToggle<CR>

let g:tagbar_left=1

map <F7> :TagbarClose<CR>:NERDTreeToggle<CR>

" Display all line that contain the keyward under the cursor
" :help [I
map <F10> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

" quickfix
" nnoremap <silent> <F5> :cn<CR>
" nnoremap <silent> <F6> :cp<CR>
nnoremap <silent> <F5> :cn<CR>
nnoremap <silent> <F6> :cp<CR>
map <space>n :cn<CR>
map <space>p :cp<CR>

" Grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git .repo obj build lib'
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

" Note: guifont is used to set GUI version of Vim font.
" For vim, the font set through terminal or putty is used
set guifont=Hack\ 12,Monaco\ 10,Fixed

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

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


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
nnoremap <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>yd :YcmCompleter GetDoc<CR>

" UltiSnips Trigger configuration.
" make compatible with ycm
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Not need any plugin to complete a tag
inoremap <c-x><c-]> <c-]>

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map toggle paste mode
" Refer to http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode


" if line wrapped, jump to the new row, not the next line
nnoremap j gj
nnoremap k gk

" clear highlighted searches
" nnoremap <Leader>h :nohlsearch<CR>

" Forget to sudo before editing a file that requires root privileges
" Use w!! to do that after you opened the file already
cmap w!! w !sudo tee >/dev/null %

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-ignore-vcs
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-ignore-vcs -g !tags -g !cscope.*'
elseif executable("ag")
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'ag --vimgrep'
endif

" Set easygrep mode to Open Buffers
let g:EasyGrepMode=1
" 1 - grepprg is used
let g:EasyGrepCommand=1

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Rebind <Leader> key to space
" let mapleader = ' '

" vim-signify
let g:signify_vcs_list = ['git', 'svn']

" Better line wraps
" set showbreak=↪

" diff option
set diffopt=filler,vertical

" find word under cursor with rg, in current dir (use :pwd to check current
" dir)
if filereadable("cscope.files")
    nnoremap , :Ack -w <C-r><C-w> `grep -v -e "^-.*" cscope.files`
else
    nnoremap , :Ack -w <C-r><C-w>
endif

map <space>, :Ack -w <C-r><C-w>

" Always have a status line
set laststatus=2
set statusline+=%F

""""""""""""""""""""""
" Conf for airline   "
""""""""""""""""""""""
let g:airline_theme='molokai'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" use vcscommand.vim if available
let g:airline#extensions#branch#use_vcscommand = 1
" enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" enable/disable detection of whitespace errors.
let g:airline#extensions#whitespace#enabled = 1

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
        \ 'a': '[#S]',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'z': '"#H" %H:%M %d-%b-%y',
        \ 'options': {
        \'status-justify': 'left'}
        \}

" Confirm if 1 more files to edit
set confirm

" Show the tag under cursor in preview window
nnoremap <Leader>] <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" List the search of the word under cursor and let user to choose
map <Leader>i [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" as much as possible of the last line in a window will be displayed.
" When not set, a last line that doesn't fit is replaced with "@" lines.
" set display+=lastline

" change the working directory to the dir for the current editing file
" :p Make file name a full path.
" :h Head of the file name(the last component and any separators removed)
nnoremap <Leader>c :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>s :mksession! ~/.vim/default_session

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

" Insert semicolon at the end of line in insert mode
inoremap ;<cr> <end>;<cr>
inoremap ;; <end>;
inoremap ,, <right>,

" Max current window
map <space>m <C-W>_<C-W><Bar>

if exists("$SSH_CONNECTION")
    " copy to buffer
    vmap <Leader>y :w! ~/.vimbuffer<CR>
    nmap <Leader>y :.w! ~/.vimbuffer<CR>
    " paste from buffer
    map <Leader>p :r ~/.vimbuffer<CR>
    imap <Leader>p <C-o>:r ~/.vimbuffer<CR>
    " noremap <Leader>y :!xclip -f -sel clip
    " noremap <Leader>p :!xclip -o -sel clip
else
    if has("X11")
        " linux
        noremap <Leader>y "+y
        noremap <Leader>p "+p
    else
        " macos
        noremap <Leader>y "*y
        noremap <Leader>p "*p
    endif
endif

" Make session
" vim -S ~/.vim/default_session to reopen it
nnoremap <Leader>s :mksession! ~/.vim/default_session
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" fzf.vim map
nnoremap <Space>f :Files
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>h :History<CR> " Same with :browse oldfiles
nnoremap <Space>t :Tags<CR>
nnoremap <Space>l :BTags<CR>
nnoremap <Space>c :CSFiles<CR>
" nnoremap <Space>o :b#<CR>
nnoremap <Space>o :only<CR>
nnoremap <Space>s :cs find t <C-R>=expand("<cword>")<CR>

" show all tab whitespace with :set list. :set nolist to clear
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" vim-rooter
let g:rooter_manual_only = 1

" Treat the words linked with '-' as one word
" For example, one-two
" Can not enable in c/c++ file, for example if var->name, var-
" set isk+=-

" type :e %% will expend to the current file's parent folder
cabbr <expr> %% expand('%:p:h')
