" -----------------------------------------------------------
" SuperTab
" use ctrl space instead of tab - does not wor
" let g:SuperTabMappingForward = '<C-SPACE>'
" let g:SuperTabMappingBackward = '<s-c-space>'
let g:SuperTabMappingForward = '<NUL>'
let g:SuperTabMappingBackward = '<S-NUL>'

" set completion type
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"
let  g:SuperTabContextDefaultCompletionType = "<c-n>"

" -----------------------------------------------------------
" Menus

"bites with YouCompleteMe ????? TODO
if has('wildmenu')
    " use wildmenu for command-completition
    set wildmenu
    set wildmode=longest,full
endif

"bites with YouCompleteMe ????? TODO
set completeopt=menuone,menu,longest ",preview

" -----------------------------------------------------------
" YouCompleteMe

let g:ycm_use_clangd = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/YouCompleteMe/ycm_extra_conf.py'
let g:ycm_cache_omnifunc = 1 "default 1
let g:ycm_disable_for_files_larger_than_kb = 1000 "default 1000

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_use_ultisnips_completer = 0
let g:ycm_goto_buffer_command = 'same-buffer'


let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 1
"let g:ycm_filetype_whitelist = { '*': 1 }

let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_allow_changing_updatetime = 1

let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 0 "user set
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_confirm_extra_conf = 1
let g:ycm_python_binary_path = '/usr/bin/python'
