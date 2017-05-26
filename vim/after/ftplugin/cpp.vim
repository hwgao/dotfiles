if !filereadable(expand("%:p:h")."/Makefile")
    setlocal makeprg=g++\ -Wall\ -Wextra\ -std=c++11\ -o\ %<\ %
endif

silent! call airline#extensions#whitespace#disable()

nnoremap <Space>m :silent make<bar>copen<bar>redraw!<CR>
nnoremap <Space>r :!./%:r<CR>
