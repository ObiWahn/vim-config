if has("autocmd")
    augroup filetype_make
        autocmd!
        autocmd BufReadPost,BufNewFile makefile setf make
        autocmd BufReadPost,BufNewFile Makefile setf make
        autocmd BufReadPost,BufNewFile GNUmakefile setf make
    augroup END
endif " has ("autocmd")
