if has("autocmd")
    augroup filetype_ssh_obi
        autocmd!
        autocmd BufReadPost,BufNewFile ~/.ssh/config.d/*  setf sshconfig
    augroup END
endif " has ("autocmd")
