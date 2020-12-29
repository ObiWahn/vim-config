" wiki2beamer syntax file
" @Author:      Jan Christoph Uhde
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Last Change: 2012-08-04.
" @Revision: 0.007
"

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif
scriptencoding utf-8

" This command sets up buffer variables and adds some basic highlighting.
let b:wikiEnabled = 1

syntax spell toplevel

syn match comment /^\s*%.*$/

syn match section /^==[^=]\+==/
syn match subsection /^===[^=]\+===/
syn match frame /^====[^=]\+====/

syn match spacer /^--[^-]\+--/

syn match items /^[*#]\{1,3}\s/

syn region  italic    start="''"  end="''"
syn region  bold      start="'''" end="'''"
syn region alert start="!" skip="\\!" end="!"

syn keyword region_key nowiki center block theorem definition example code contained
syn region  env         start="^<\z(\[[a-z]\+\]\)" end="^\z1>$" keepend contains=env_options,env_end
syn match   env_options "^<\[[a-z]\+\]\(\[.*\]\|{.*}\)\?"       contained contains=env_start
syn match   env_start   "^<\[[a-z]\+\]"                         contained contains=region_key
syn match   env_end     "^\[[a-z]\+\]>$"                        contained contains=region_key


hi section      cterm=bold ctermfg=lightred
hi subsection   cterm=bold ctermfg=yellow
hi frame        cterm=bold ctermfg=lightgreen

hi items        cterm=bold ctermfg=lightblue
hi alert        cterm=bold ctermfg=lightred

hi env_options  ctermfg=yellow
hi env_start    cterm=bold ctermfg=white
hi env_end      cterm=bold ctermfg=white
hi env          cterm=bold ctermfg=darkblue
hi region_key   cterm=bold ctermfg=lightblue
hi bold         cterm=bold ctermfg=white
hi italic       ctermfg=yellow
hi spacer       cterm=bold ctermfg=darkgreen
