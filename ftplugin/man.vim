setl readonly
if exists('&cc') | setl cc= | endif

nmap    <buffer> q :quit<CR>
noremap <buffer> <Space> <PageDown>
nmap    <buffer> <Home> gg
nmap    <buffer> <End> G
nmap    <buffer> K <C-]>
nmap    <buffer> K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>

"au filetype man runtime! macros/less.vim    -- bad because mappings become global
"au filetype man  nmap <buffer> <Up> <C-Y>
"au filetype man  nmap <buffer> <Down> <C-E>
