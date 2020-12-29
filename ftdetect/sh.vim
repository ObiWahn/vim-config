if has("autocmd")
    augroup filetype_sh_obi
        autocmd!
        autocmd BufReadPre  /tmp/bash-fc* setf sh
        autocmd BufReadPre  ~/.bash* setf sh
        autocmd BufReadPre  $HOME/.bash* setf sh
    augroup END
endif " has ("autocmd")
