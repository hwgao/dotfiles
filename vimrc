" Useful commands:
" * :Tab /{pattern}  -- align selected lines by {pattern} with tabular
" * :b <tab> -- switch between buffers
" * :b# or Ctrl+6 or Ctrl+^ -- switch back to previous buffer
" * :DiffOrig -- diff current buffer with saved file
" * :BufOnly -- Delete all the buffers except the current/named buffer
" DoxygenToolkit
" * :Dox --  Function / class comment: place the cursor on the line of the
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
"                  autopep8 is used for python. To install: pip install --user autopep8
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
" * If you launch vim with -q errors.txt, after putting compile errors in
" errors.txt (i.e. gcc -Wall *.c >errors.txt 2>&1), vim will populate the
" quickfix list from the list of compile errors
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
Plug 'vim-scripts/grep.vim'
" UltiSnip Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'scrooloose/syntastic'
" Alternate Files quickly (.c --> .h etc)
Plug 'vim-scripts/a.vim'
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
Plug 'scrooloose/nerdcommenter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'will133/vim-dirdiff'
Plug 'tmhedberg/matchit'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'dir': '~/src_root/fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-rooter'
Plug 'embear/vim-localvimrc'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'rupa/z'
Plug 'BurntSushi/ripgrep', {'dir': '~/src_root/ripgrep', 'do': 'cargo build --release \| cp target/release/rg ~/bin/'}
" Plug 'facebook/PathPicker', {'dir': '~/src_root/PathPicker', 'do': 'ln -s $(pwd)/fpp ~/bin/fpp'}
Plug 'tmux-plugins/tpm', {'dir': '~/.tmux/plugins/tpm'}

" File type based plugins
Plug 'leshill/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'kergoth/vim-bitbake'
"Plug 'klen/python-mode', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'rhysd/wandbox-vim', { 'for': 'cpp,c' }
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
"Plug 'WolfgangMehner/bash-support'

" If managed it here, 'vim -t tag' can't work. Move it to global plugin folder
" Script that will search for and load cscope.out databases automatically
" Plug 'vim-scripts/autoload_cscope.vim'
" Plug 'Rip-Rip/clang_complete'
" Plug 'ervandew/supertab'

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

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible                           " Enables us Vim specific features
filetype off                               " Reset filetype detection first ...
filetype plugin indent on                  " ... and enable filetype detection
set ttyfast                                " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2                        " Indicate terminal type for mouse codes
set ttyscroll=3                            " Speedup scrolling
set laststatus=2                           " Always have a status line
set autoread                               " Automatically read changed files
set autoindent                             " Enabile Autoindent
set hlsearch
set cursorline
set fo-=t                                  " Don't automatically wrap text when typing
set expandtab                              " Use spaces, not tabs in insert mode. Use :retab to change all the
                                           " Existing tab characters to match the current tab setting
set tabstop=4                              " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4                           " Number of spaces to use for each step of (auto)indent
set smarttab                               " Insert tabs on the start of a line according to shifwidth, not tabstop
set autoindent
set smartindent
set splitright                             " Vertical windows should be split to right
set splitbelow                             " Horizontal windows should split to bottom
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set history=50                             " Keep 50 lines of command line history
set ruler                                  " Show the cursor position all the time
set showcmd                                " Display incomplete commands
set incsearch                              " Do incremental searching
set autowrite                              " Autosave before :make
set hidden                                 " Buffer should still exist if window is closed
set fileformats=unix,dos,mac               " Prefer Unix over Windows over OS 9 formats
set noshowmatch                            " Do not show matching brackets by flickering
set noshowmode                             " We show the mode with airline or lightline
set ignorecase                             " Search case insensitive...
set smartcase                              " ... but not it begins with upper case
set completeopt=longest,menuone            " set completeopt-=preview Disable preview document when autocomplete
set confirm                                " Demands confirmation before closing unsaved buffers
set nofoldenable                           " Turn off folding
set noerrorbells                           " No beeps
set tags=tags;/                            " ctags
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-    " cscope
set diffopt=filler,vertical                " diff option
set cino+=g0                               " Rrefer to indent.txt. Not indent c++ scope declarations
set guioptions-=T                          " hide tool bar
set wildmenu                               " enhance mode of the command complete
set backupdir^=~/.vimbackup//              " Where backup file is stored
set directory^=~/.vimbackup//              " The // at the end of the directory name tells Vim to use the absolute path
                                           " to the file to create the swap file so there aren't collisions between files
                                           " of the same name from different directories.
                                           " The ^= syntax for :set prepends the directory name to the head of the list,
                                           " so Vim will check that directory first.
set guifont=Hack\ 10,Monaco\ 10,Fixed      " Note: guifont is used to set GUI version of Vim font.
                                           " For vim, the font set through terminal or putty is used
set complete-=i                            " remove search in included files from the complete list
set mouse=a                                " Enable the use of mouse
set lcs=trail:·,tab:»·                     " https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character


" by default backup off, writebackup on
" set nobackup      " do not keep a backup file, use versions instead
" set nowritebackup
" set noswapfile    " Swap files store changes you've made to the buffer. If Vim
                    " or your computer crashes, they allow you to recover those changes
" set number        " show line number
" set showbreak=↪   " Better line wraps
" set display+=lastline " As much as possible of the last line in a window will be displayed.
                        " When not set, a last line that doesn't fit is replaced with "@" lines.


" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
" when terminal or tmux using 16 colors mode
" colorscheme desert
" hi CursorLine term=bold cterm=bold guibg=Grey40

" Automatic reloading of .vimrc after saved .vimrc
autocmd! bufwritepost .vimrc source %

" hide currentline backgroud when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

let g:tagbar_left=1
nnoremap <silent> <F7> :TagbarClose<CR>:NERDTreeToggle<CR>
nnoremap <silent> <F8> :NERDTreeClose<CR>:TagbarToggle<CR>

" quickfix
nnoremap <silent> <F5> :cn<CR>
nnoremap <silent> <F6> :cp<CR>

" Grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git .repo obj build lib'
let Grep_Skip_Files = '*.bak *~ *.so *.a *.o *.log *.fw'
nnoremap <silent> <F3> :Bgrep<CR>
nnoremap <silent> <F4> :Rgrep<CR>

" If not use tmux navigator plugin
if !exists('$TMUX')
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
endif

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/mywork/*','!~/*']
let g:ycm_collect_identifiers_from_tags_files = 1

" Setting it makes YCM remove all Syntastic checkers set for the c, cpp,
" objc and objcpp filetypes
" YCM's diagnostics UI is only supported for C-family languages
let g:ycm_show_diagnostics_ui = 0 "default 1
let g:ycm_always_populate_location_list = 1 "default 0
" or
" sysntastic setting for c++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wpedantic'
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1

" JavaScript lint -- eslint
" Install: # npm install -g eslint
let g:syntastic_javascript_checkers = ['eslint']

" ycmcompleter hotkeys
nnoremap <silent> <F2> :YcmCompleter GoTo<CR>
autocmd FileType python nnoremap <Leader>yr :YcmCompleter GoToReferences<CR>
autocmd FileType python nnoremap <Leader>yd :YcmCompleter GetDoc<CR>

" UltiSnips Trigger configuration. Compatible with ycm
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Not need any plugin to complete a tag
inoremap <c-x><c-]> <c-]>

" map toggle paste mode
" Refer to http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode

" if line wrapped, jump to the new row, not the next line
nnoremap <Up> gj
nnoremap <Down> gk
nnoremap j gj
nnoremap k gk

" Show the tag under cursor in preview window
nnoremap <Leader>] <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" change the working directory to the dir for the current editing file
" :p Make file name a full path.
" :h Head of the file name(the last component and any separators removed)
nnoremap <Leader>c :cd %:p:h<CR>:pwd<CR>

" clear highlighted searches
" nnoremap <Leader>h :nohlsearch<CR>

" Forget to sudo before editing a file that requires root privileges
" Use w!! to do that after you opened the file already
cmap w!! w !sudo tee >/dev/null %
" Show the tag under cursor in preview window
nnoremap <Leader>] <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" as much as possible of the last line in a window will be displayed.
" When not set, a last line that doesn't fit is replaced with "@" lines.
" set display+=lastline

" change the working directory to the dir for the current editing file
" :p Make file name a full path.
" :h Head of the file name(the last component and any separators removed)
nnoremap <Leader>c :cd %:p:h<CR>:pwd<CR>


if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-ignore-vcs
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-ignore-vcs -g !tags -g !cscope.*'
elseif executable("ag")
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'ag --vimgrep'
endif

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" vim-signify
let g:signify_vcs_list = ['git', 'svn']

" find word under cursor with rg, in current dir (use :pwd to check current
" dir)
if filereadable("cscope.files")
    nnoremap <space>, :Ack! -w <C-r><C-w> `grep -v -e "^-.*" cscope.files`
else
    nnoremap <space>, :Ack! -w <C-r><C-w> -tc -tcpp
endif

nnoremap , :Ack! -w <C-r><C-w>
nnoremap <space>y :Ack! -w <C-r><C-w> -g *.conf -g *.inc -g *.bb -g *.bbappend -g *.bbclass -t py


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

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" use vcscommand.vim if available
let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
        \ 'a': '[#S]',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'z': '"#H" %H:%M %d-%b-%y',
        \ 'options': {
        \'status-justify': 'left'}
        \}

" Disable syntastic for golang
let g:syntastic_mode_map = { 'passive_filetypes': ['go'] }
" or
" let g:go_fmt_fail_silently = 1

" python PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix lcs=trail:·,tab:»· list

" c/c++
au BufNewFile,BufRead *.c,*.cpp,*cc,*.h set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix lcs=trail:·,tab:»· list

" web files indentation
" Note: no space between file types
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 softtabstop=2 shiftwidth=2

" OpenSCAD
au! BufRead,BufNewFile *.scad set filetype=openscad

" kv
au BufNewFile,BufRead *.kv set filetype=kv

" log
au BufNewFile,BufRead *.log set filetype=log

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable Doxygen highlighting
" let g:load_doxygen_syntax=1

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

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

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

nnoremap <Space>p :b#<CR>
nnoremap <Space>o :only<CR>
nnoremap <Space>s :cs find t <C-R>=expand("<cword>")<CR>

" Insert a character in normal mode
noremap <silent> <space>i :exe "normal i".nr2char(getchar())<CR>

" vim-rooter
let g:rooter_manual_only = 1

" Treat the words linked with '-' as one word
" For example, one-two
" Can not enable in c/c++ file, for example if var->name, var-
" set isk+=-

" type :e %% will expend to the current file's parent folder
cabbr <expr> %% expand('%:p:h')

" P to paste yanked text from register 0
" yank will save text to registers 0 and " by default.
" text deleted using d/D/x/X/c/C/s/S commands will be save to " register
" " register is default register
nnoremap P "0p

" whitelist all local vimrc
let g:localvimrc_whitelist=['/home/hongwei/mywork/', '/home/hongwei/work/']

" go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Auto strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
