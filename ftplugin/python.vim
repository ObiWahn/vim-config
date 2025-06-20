filetype indent on

setl expandtab
setl foldlevelstart=99
setl foldmethod=indent
setl completeopt-=preview

" in after/ftplugin/python.vim
setl formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -

noremap <buffer> <LEADER>b :!python %<CR>

if exists(":IndentGuidesEnable")
    :IndentGuidesEnable
endif
