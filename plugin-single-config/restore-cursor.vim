" https://vim.fandom.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session

" restoring sessions
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,\"100,:20,%,n~/.vim/directories/info

function! ResCur()
  if line("'\"") <= line("$") && !exists('g:lastplace_open_folds')
    normal! g`"
    return 1
  endif
endfunction

if has("folding")
  function! UnfoldCur()
    if !&foldenable && exists('g:lastplace_open_folds')
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

if has("autocmd")
    augroup resCur
        autocmd!
        if has("folding")
            autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
        else
            autocmd BufWinEnter * call ResCur()
        endif
    augroup END
endif
