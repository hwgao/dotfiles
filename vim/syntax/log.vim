" Vim syntax file
" Language: Log file
" Maintainer: Peter Gao
" Latest Revision: 21 May 2014
 
if exists("b:current_syntax")
	finish
endif

syn keyword logk START END FAIL

hi def link logk Statement

let b:current_syntax = "log"
