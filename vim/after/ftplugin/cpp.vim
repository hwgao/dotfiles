if !filereadable(expand("%:p:h")."/Makefile")
    setlocal makeprg=g++\ -Wall\ -Wextra\ -std=c++11\ -o\ %<\ %
endif
