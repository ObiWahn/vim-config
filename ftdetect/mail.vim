if has("autocmd")
    augroup filetype_mail_obi
        autocmd!
        autocmd BufRead reportbug.* setf mail
        autocmd BufRead reportbug-* setf mail
    augroup END
endif " has ("autocmd")
