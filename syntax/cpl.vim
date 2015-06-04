" Vim syntax file
" Language:		CPL (Categorical Programming Language)
" Maintainer:		Kimiyuki Ohnaka
" Last Change:		2015 June 5
" Original Author:	Kimiyuki Ohnaka

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn match   Statement "\<\(left\|right\)\s\+object\>"
syn keyword Keyword is with
syn match   Statement "\<end\s\+object\>"
syn match   Delimiter ";"
syn match   Type ":"
syn match   Type "->"
syn keyword Statement let
syn match   Statement "="
syn match   Operator "\."
syn keyword Constant I
syn keyword Special exit quit bye edit load reset
syn match   Special "\<simp\(\s\+full\)\?\>"
syn match   Special "\<show\(\s\+object\)\?\>"
syn match   Special "\<set\s\+trace\s\+\(on\|off\)\>"
syn match   Comment "#.*"

let b:current_syntax = "cpl"
