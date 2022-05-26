" -----------------------------------------------------------
" PLUGINS

" man plugin
" runtime ftplugin/man.vim

" -----------------------------------------------------------
" vim-grep-operator
"set grepprg=grep\ -nHr\ $*
set grepprg=rg\ --vimgrep\ $*
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
let g:grep_operator_set_search_register = 1


" -----------------------------------------------------------
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "obi"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
set laststatus=2
