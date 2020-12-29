if has("autocmd")
    augroup filetype_sudoers_obi
        autocmd!
        autocmd BufReadPre,BufNewFile  /etc/sudoers.d/* setf sudoers
    augroup END
endif
