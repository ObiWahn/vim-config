if has("autocmd")
    augroup filetype_cpp_obi
        autocmd!
        autocmd BufReadPost,BufNewFile */include/c++/*  setf cpp
        autocmd BufReadPost,BufNewFile */include/c/*    setf cpp
        autocmd BufReadPost,BufNewFile */include/ycmd/* setf cpp
    augroup END
endif " has ("autocmd")
