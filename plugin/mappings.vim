" map i_crtl_w to ctrl_w
inoremap <expr> <C-W> "\<C-O>\<C-W>" . nr2char(getchar())

" copy paste in extra register
nnoremap <LEADER>d "od
nnoremap <LEADER>y "oy
nnoremap <LEADER>p "op
nnoremap <LEADER>x "ox

" shortcuts for paste/nopaste mode
noremap ,con :set paste<CR>
noremap ,cof :set nopaste<CR>

"paste
noremap  <silent> <LEADER>p       :set pastetoggle<CR>
noremap  <silent> <LEADER>c       :set paste<BAR>:norm! "+p<BAR>:set nopaste<CR>
norema   <silent> <LEADER>x       :set paste<BAR>:norm! "*p<BAR>:set nopaste<CR>
"" bad because leader is blocked in insert
"noremap! <silent> <LEADER>c  <C-O>:set paste<BAR>:norm! "+p<BAR>:set nopaste<CR>
"noremap! <silent> <LEADER>p  <C-O>:set pastetoggle<CR>
"noremap! <silent> <LEADER>x  <C-O>:set paste<BAR>:norm! "*p<BAR>:set nopaste<CR>

"adjust line len for paragraph
noremap <silent> gqp :call Preserve("norm! {gq}")<CR>

" kill plenking in quotes:
noremap ,pl :g/^>/s/  *\([!?,.]\)/\1/g<CR>

" moving splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open close folds
noremap <silent> <LEADER>3  :set foldlevel=0 <CR>
noremap <silent> <LEADER>4  :set foldlevel=1 <CR>
noremap <silent> <LEADER>5  :set foldlevel=2 <CR>
noremap <silent> <LEADER>6  :set foldlevel=3 <CR>
noremap <silent> <LEADER>7  :set foldlevel=4 <CR>
noremap <silent> <LEADER>8  :set foldlevel=5 <CR>
noremap <silent> <LEADER>9  :set foldlevel=6 <CR>
noremap <silent> <LEADER>0  :set foldlevel=7 <CR>
noremap <silent> <LEADER>`  zR <CR>
noremap <silent> <LEADER>1  zo <CR>
noremap <silent> <LEADER>2  zc <CR>
