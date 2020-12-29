if has("autocmd")
    augroup filetype_groovy_obi
        autocmd!
        autocmd BufNewFile,BufRead *.gradle setf groovy
    augroup END
endif " has ("autocmd")
