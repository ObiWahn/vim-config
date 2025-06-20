"""" Ctrl-p
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 't'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }


""" fzf
nmap <C-F> :Files<CR>
let g:fzf_layout = {'down':'30'}

" open tab as default
"let g:fzf_action = {
"    \ 'enter': 'tab drop',
"    \ 'ctrl-t': 'tab split',
"    \ 'ctrl-s': 'split',
"    \ 'ctrl-v': 'vsplit'
"    \ }

" open tabs as default - workaround for broken buffers
" https://github.com/junegunn/fzf.vim/issues/435
let g:fzf_buffers_jump = 1
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)
let g:fzf_action = {
    \ 'enter': 'GotoOrOpen tab',
    \ 'ctrl-e': 'edit',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
