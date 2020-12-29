if has("autocmd")
    augroup filetype_viki_obi
        autocmd!
        autocmd BufReadPost,BufNewFile   *.viki setf viki
    augroup END
endif " has ("autocmd")
