" -----------------------------------------------------------
" AutoCommands

if has("autocmd")
    augroup filetypes
        autocmd!
        "auto source .vimrc
        "autocmd BufWritePost .vimrc source %
        autocmd BufReadPre  *vimrc setl foldmethod=marker
        autocmd BufReadPre  *vimrc setl foldlevel=0
        autocmd BufReadPre  /usr/share/vim/* if exists('&cc') | setl cc= | endif
        autocmd BufReadPre  ~/.vim* if exists('&cc') | setl cc= | endif

        autocmd BufReadPre  *.nfo  setl fileencodings=cp437
        autocmd BufReadPre  /etc/sudoers.d/* setl syntax=sudoers
    augroup END
endif " has ("autocmd")
