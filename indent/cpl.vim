" Vim indent file
" Language:		CPL (Categorical Programming Language)
" Maintainer:		Kimiyuki Ohnaka
" Last Change:		2015 June 5
" Original Author:	Kimiyuki Ohnaka

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetCplIndent()
setlocal indentkeys+=0=right,0=left,0=end,0=let,<:>,-,;

if exists("*GetCplIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

function! IsInObjectDecl(lnum)
    let i = a:lnum
    while 0 < i
        if getline(i) =~# '\<is\s*\(#.*\)\?$'
            return 1
        elseif getline(i) =~# ';\s*\(#.*\)\?$'
            return 0
        else
            let i -= 1
        endif
    endwhile
    return 0
endfunction

function! GetCplIndent()
    let plnum = prevnonblank(v:lnum - 1)
    if getline(plnum) =~# ';\s*\(#.*\)\?$'
        return 0
    elseif getline(v:lnum) =~# '^\s*\(right\|left\|end\)\>'
        return 0
    elseif IsInObjectDecl(v:lnum)
        if getline(v:lnum) =~# '^\s*[:-]'
            return 2 * &l:shiftwidth
        else
            return &l:shiftwidth
        endif
    else
        if plnum == 0
            return 0
        else
            return 2 * &l:shiftwidth
        endif
    endif
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
