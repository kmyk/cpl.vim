" Vim syntax file
" Language:		CPL (Categorical Programming Language)
" Maintainer:		solorab
" Last Change:		2014 Nov 2
" Original Author:	solorab

" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn match Statement "\<\(left\|right\)\s\+object\>"
syn keyword Keyword is with
syn match Type ":\|->"
syn match Operator ";\|="
syn match Statement "\<end\s\+object\ze\s*;"
syn match Statement "\<let\ze.\+=.\+;"
syn match Special "\.\|\<I\>"

let b:current_syntax = "cpl"
