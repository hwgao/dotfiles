if !filereadable(expand("%:p:h")."/Makefile")
    setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
endif

silent! call airline#extensions#whitespace#disable()

nnoremap <Space>m :silent make<bar>copen<bar>redraw!<CR>
nnoremap <Space>r :!./%:r<CR>
