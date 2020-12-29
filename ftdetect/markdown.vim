if has("autocmd")
    augroup filetype_markdown_obi
        autocmd!
        autocmd BufReadPost,BufNewFile *md.html setf markdown
    augroup END
endif " has ("autocmd")
