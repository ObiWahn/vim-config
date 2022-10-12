" Configuration file for vim
" vim:expandtab:foldmethod=marker:foldlevel=0:tw=0

" -----------------------------------------------------------
" Set Standard Behaviour

" also match '<' and '>' as brackets
set matchpairs+=<:>

" Use Vim defaults instead of 100% vi compatibility
set nocompatible
set showmode
let mapleader = ","

" more powerful backspacing
set backspace=indent,eol,start
set matchtime=3         "the default is 5
set virtualedit=block

" set verbose=5
filetype on
filetype plugin on
filetype indent on

" SEARCH / REPLACE
set ignorecase           " Do case insensitive matching
set smartcase            " Be sensitive when there is a capital letter
"set incsearch           " Incremental search
set gdefault             " Set 'g' substitute flag on.

" SAVE & BACKUP
set autowrite            " Automatically save before commands like :next and :make
set nobackup             " Don't keep a backup file

" SPLITS WINDOWS
set splitbelow
set splitright

"" LINES
set nowrap
set linebreak            " Don't wrap words by default
set textwidth=0          " Don't wrap lines by default

" do not insert two spaces after each period on joined lines
set nojoinspaces

" Always display a status line at the bottom of window.
"set laststatus=2

" Scroll when 2 lines before bottom of the terminal
set scrolloff=2
set sidescroll=4

" -----------------------------------------------------------
" Language and Encoding

"" fix ui language
set langmenu=en_US.UTF-8

"" ENCODING OPTIONS
set fileencodings=ucs-bom,utf-8,default
set encoding=utf8

" -----------------------------------------------------------
" TABS, SPCACES AND INDENT

set expandtab
set tabstop=4           "length of a hard tab
set softtabstop=4       "number of chars when you press tab
set tabpagemax=100

"" INDENT
set shiftwidth=4        "length of std indent
set autoindent          " always set autoindenting on
"set smartindent
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0
set cinoptions=>s,e0,n0,f0,{0,}0,^0,Ls,:s,=s,l1,b0,gs,hs,N0,E0,ps,t0,is,+s,c3,C0,/0,(2s,us,U1,w0,W0,k0,m0,M0,j0,J0,)100,*200,#0

" -----------------------------------------------------------
" DIRECTORIES
set dir=~/.vim/directories/swap                " swap directory
set backupdir=~/.vim/directories/backup
set viewdir=~/.vim/directories/views

" -----------------------------------------------------------
" History
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,\"100,:20,%,n~/.vim/directories/info
set history=100           " keep 50 lines of command line history

" -----------------------------------------------------------
" Set Standard Appearance

syntax on           " enables syntax highlighting by default.
"set list           " show invisible cahrs
set listchars=nbsp:⋅,tab:→⋅,eol:¶,trail:⋅,extends:»,precedes:« " Unprintable chars mapping
set number          " show line numbers
set ruler           " show the cursor position all the time
set ruf=%55([%{&ff}]\ %y\ [%{&encoding}]\ %t\ [%c]%v,%l\ %L\ %P\ #%n%)
set showmode        " show current mode
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set hlsearch        " hilight searched stuff
set vb t_vb=        " disable visual bell

" -----------------------------------------------------------
" Mouse

" mouse in insert/visual/help mode only
set mouse=vih
set nomousehide
"set mousefocus
"set mousemodel=extend

" -----------------------------------------------------------
" Misc Settings
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"" Folding
set foldmethod=indent
set foldlevel=99

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

:set makeprg=omake\ $*
" -----------------------------------------------------------
" Workarounds and fixes

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" fix home and end keys
" insert and command-line
noremap! <Esc>[H  <Home>
noremap! <Esc>[F  <End>
" other modes
noremap <ESC>[H  0
noremap <ESC>[F  $

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" -----------------------------------------------------------
" Functions

" toggle color column
function ColorColumnToggle()
    if exists('&colorcolumn')
        if &colorcolumn != ""
            setl colorcolumn=
        else
            let s:col1 = virtcol('.')
            if s:col1 < 2
                setl colorcolumn=81
            else
                let s:col1 = s:col1 - 1
                let s:col2 = s:col1 + 82
                let &colorcolumn=s:col1 . "," . s:col2
            endif
        endif
    endif
endfunction


"http://docwhat.org/vim-preserve-your-cursor-and-window-state/
function! Preserve(command)
    " Save the last search
    let last_search=@/

    "" Save the current cursor position
    "let save_cursor = getcurpos(".")

    " Save the window position
    let save_window = winsaveview()

    " Do the business:
    execute a:command

    " Restore the last_search
    let @/=last_search

    " Restore the window position
    call winrestview(save_window)
    "normal zt
    "" Restore the cursor position
    "call setpos('.', save_cursor)
endfunction

" open links in browser
function! Browser()
    let s:line = getline (".")
    let s:line = matchstr (s:line, "http[^   ]*")
    silent execute  "! [[ $UID -ne 0 ]] && firefox -new tab ".s:line  "&"
    redraw!
endfunction

" -----------------------------------------------------------
" Commands

command MouseAll :set mouse=a
command MouseDefault :set mouse=vih
command MouseOff :set mouse=

command CopyOn  :set paste<CR>
command CopyOff :set nopaste<CR>

" Clipboard for Dummies:P
command Paste :set paste | :put + | :set nopaste
"map <leader>p :Paste<CR>
command -range Copy  :<line1>,<line2>yank +
"map <leader>c :Copy<CR>

"set textwidth
command T0 :setl textwidth=0 | :setl nowrap | :setl tw
command -nargs=1 T  :setl textwidth=<args> | :setl nopaste | :setl wrap | :setl tw
"set textwidth and reformat
"command -nargs=1 TW :set textwidth=<args> | :set nopaste | :set wrap | :normal! "<ESC>gg|gqG" | :set tw

" -----------------------------------------------------------
" KeyMapping

" fold with space
nnoremap <space> za

" search
nnoremap <space>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
xnoremap <space>% y:%s/<C-r>=escape(@", '^~$\&*.[]')<CR>//g<left><left>
nnoremap <space>/ /<C-r>=expand("<cword>")<CR>
xnoremap <space>/ y/<C-R>"

" tabs
noremap  <silent><F1>      :tabprevious<CR>
noremap! <silent><F1> <C-O>:tabprevious<CR>
noremap  <silent><F2>      :tabnext<CR>
noremap! <silent><F2> <C-O>:tabnext<CR>

" F5 is goto definition

" kill whitespace at end of line: keep search register!!!
noremap  <F11>      :call Preserve("%s/\\s\\+$//e")<CR>
noremap! <F11> <C-o>:call Preserve("%s/\\s\\+$//e")<CR>

set pastetoggle=<F9>

"noremap  <F10>      :cn<CR>
"noremap! <F10> <C-o>:cn<CR>
"noremap  <F11>      :cp<CR>
"noremap! <F11> <C-o>:cp<CR>
" F12 taken by tmux

" CTRL-C shortcuts
noremap <silent><C-C>n :set invnumber <CR>
noremap <silent><C-C>l :set invlist <CR>
noremap <silent><C-C>w :set invwrap <CR>
noremap <silent><C-C>i :IndentGuidesToggle <CR>
"noremap <silent><C-C>h :set invhls <CR>
noremap <silent><C-C>h :nohls <CR>
noremap <silent><C-C>c :call ColorColumnToggle()<CR>
noremap <silent><C-C>b :call Browser()<CR>

"add shortcuts to add and remove quotes
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

"Y yanks line
map Y 0y$

"shortcut to access p register
nnoremap  <Leader>y "py
nnoremap  <Leader>p "pp
nnoremap  <Leader>d "pd
nnoremap  <Leader>x "px

"lave insert mode by pressing jk
inoremap jk <ESC>

"better movement
"move to front of line
nnoremap H <HOME>
vnoremap H <HOME>
"move to front of end
nnoremap L <END>
vnoremap L <END>

"put above Line behind Current
noremap <leader>J kddpkJ

"edit vim
nnoremap <leader>ev :<C-u>:vsplit $MYVIMRC<CR>
"source vim
nnoremap <leader>sv :<C-u>:source $MYVIMRC<CR>

"surrond with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"surrond with quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel


" -----------------------------------------------------------
" AutoCommands
let c_space_errors = 1      "cspace erros
if has("autocmd")
    augroup Standard
        autocmd!
        " turn off vbell in gui
        autocmd GUIEnter * :set vb t_vb=
        " setl backup ext
        autocmd BufWritePre * let &bex = '-' . strftime("%F_%R") . '.bak'
    augroup END

    augroup WhiteSpaces
        autocmd!
        " highlight extra white spaces
        autocmd BufReadPost,BufNewFile * :match ExtraWhitespace /\s\+$\| \+\ze\t/
        " delete white spaces for some exts - handled by editor config as well
        autocmd FileType c,cpp,sh,purescript,python,vim autocmd BufWritePre <buffer> :call Preserve("%s/\\s\\+$//e")
    augroup END "WhiteSpaces
endif " has ("autocmd")

" -----------------------------------------------------------
" Language and Spellchecking
" Spell Checking
nnoremap p[ [s z=
nnoremap p] ]s z=

let g:spellfile_URL = "http://ftp.vim.org/pub/vim/runtime/spell/"

command Spe :set spell spelllang=en    | set spellfile="~/.vim/spell/en.utf-8.add"
command Spd :set spell spelllang=de_de | set spellfile="~/.vim/spell/de.utf-8.add"
command Spn :set spell spelllang=""


"do not update register when deleting singe chars
noremap x "_x

"do not update reg when pasting in visual mode
vnoremap p "_dP

noremap <LEADER>le :Spe<CR>
noremap <LEADER>ld :Spd<CR>
noremap <LEADER>ln :Spn<CR>

let spell_root_menu = '-'
let spell_auto_type = 'none'
let spell_insert_mode = 0

" disable guessing of language:
let spell_guess_language_ft = ""

" list of known-good words for spell-checking:
set spellfile="~/.vim/spell/de.utf-8.add,~/.vim/spell/en.utf-8.add"

:setlocal spell spelllang=""
