" -----------------------------------------------------------
" COLOR SETTING

" Colors
" 0 darkgrey
" 1 red
" 2 green
" 3 yellow
" 4 blue
" 5 magenta/pink
" 6 cyan
" 7 white

" THIS MUST HAPPEN BEFORE COLORSCHEME IS SET
" Set Whitespace Color!

augroup alleFarben
    au!
    " :autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    " The following alternative may be less obtrusive.
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
    " Try the following if your GUI uses a dark background.
    " :autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

    "Color Folds
    autocmd ColorScheme * highlight Folded      ctermbg=darkgrey  ctermfg=white
    autocmd ColorScheme * highlight FoldColumn  ctermbg=darkgrey  ctermfg=white
    autocmd ColorScheme * highlight Folded      guibg=darkgrey    guifg=white
    autocmd ColorScheme * highlight FoldColumn  guibg=darkgrey    guifg=white

    "Color Column
    autocmd ColorScheme * highlight ColorColumn ctermbg=lightblue guibg=lightblue

    " Better Menu Colors
    autocmd ColorScheme * highlight Pmenu       guifg=darkgray    guibg=darkgreen  ctermfg=0 ctermbg=2
    autocmd ColorScheme * highlight PmenuSel    guifg=darkgray    guibg=white      ctermfg=0 ctermbg=7
    autocmd ColorScheme * highlight PmenuSbar   guifg=white       guibg=darkgray   ctermfg=7 ctermbg=0
    autocmd ColorScheme * highlight PmenuThumb  guifg=darkgray    guibg=white      ctermfg=0 ctermbg=7

    "Spell
    autocmd ColorScheme * highlight SpellBad    term=reverse ctermbg=1 ctermfg=white gui=undercurl guisp=Red

    "Diff
    autocmd ColorScheme * highlight DiffAdd     ctermbg=green     ctermfg=LightGray
    autocmd ColorScheme * highlight DiffDelete  ctermbg=DarkRed   ctermfg=LightGray
    autocmd ColorScheme * highlight DiffChange  ctermbg=Yellow    ctermfg=black
    autocmd ColorScheme * highlight DiffText    ctermbg=Yellow    ctermfg=black cterm=reverse

    "indent_guides_colors
    let g:indent_guides_auto_colors = 0
    if &term =~ "xterm"
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=0
    else
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=0
    endif

augroup END


"Set the color Scheme
if has("gui_running")
    colorscheme desert
else
    colorscheme default
endif
