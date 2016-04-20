if !filereadable(expand("%:p:h")."/Makefile")
    setlocal makeprg=clang++\ -g\ -std=c++11\ -o\ %<\ %
endif
