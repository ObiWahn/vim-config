vim9script

def g:HlOrRG()
    var current_word = expand("<cword>")
    if get(b:, "_obi_HlOrRg_search", "") != current_word
        # highlight
        @/ = current_word
        b:_obi_HlOrRg_search = current_word
    else
        # execute RG
        #exe $'Rg {current_word}'
        exe 'Rg ' .. current_word
    endif
enddef

noremap  <silent><F7>        :call HlOrRG()<CR>
noremap! <silent><F7>   <C-O>:call HlOrRG()<CR>
