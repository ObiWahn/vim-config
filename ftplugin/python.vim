filetype indent on

setl expandtab
setl foldlevelstart=99
setl foldmethod=indent
setl completeopt-=preview

noremap <buffer> <LEADER>b :!python %<CR>

if exists(":IndentGuidesEnable")
    :IndentGuidesEnable
endif
