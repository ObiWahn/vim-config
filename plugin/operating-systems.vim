" -----------------------------------------------------------
" GUI / WINDOWS / MAC

set guifont=DejaVu\ Sans\ Mono\ Bold\ 16
if has('win32')
    language messages en_US.UTF-8
    set encoding=utf8
    set langmenu=en_US.UTF-8
    set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar
    set guioptions-=r "remove right-hand scroll bar
    set guioptions-=L "remove left-hand scroll bar
    set guifont=DejaVu_Sans_Mono:h16:b:cANSI
    set runtimepath+=~/_vim

    set dir=~/_vim/directories/swap                " swap directory
    set backupdir=~/_vim/directories/backup
    set viewdir=~/_vim/directories/views
    set viminfo='20,\"100,:20,%,n~/_vim/directories/info
elseif has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set encoding=utf8
    endif
    "set t_Co=256 "enable 256 colors for airline
endif


" -----------------------------------------------------------
" PRINTER
set printoptions=syntax:n,number:y,paper:A4

" Set paper size from /etc/papersize if available (Debian-specific)
try
  if filereadable('/etc/papersize')
    let s:papersize = matchstr(system('/bin/cat /etc/papersize'), '\p*')
    if strlen(s:papersize)
      let &printoptions = "paper:" . s:papersize
    endif
    unlet! s:papersize
  endif
catch /E145/
endtry
