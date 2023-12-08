" ----
command Mpro    call Obi_Pro()
command Mnopro  call Obi_No_Pro()
command Minvpro call Obi_Toggle_Pro()

fu Obi_Toggle_Pro()
    if exists('s:obi_pro_toggle')
        call Obi_No_Pro()
    else
        call Obi_Pro()
    endif
endf

fu Obi_Pro()
    let s:obi_pro_toggle="toggle on"
    map! ö [
    map! ä ]
    map! Ö {
    map! Ä }
    map ö [
    map ä ]
    map Ö {
    map Ä }
endf

function Obi_No_Pro()
    if exists('s:obi_pro_toggle')
        unlet s:obi_pro_toggle
        iunmap ö
        iunmap ä
        iunmap Ö
        iunmap Ä
        cunmap ö
        cunmap ä
        cunmap Ö
        cunmap Ä
    endif
endfunction

" ---- DE-LAYOUT
" enter item
noremap ä <C-]>
" jump back
noremap ö <C-O>
noremap ü z=
