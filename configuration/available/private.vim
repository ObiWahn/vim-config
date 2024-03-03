" words to hgihlight
call matchadd("todo","Note")
call matchadd("todo","TODO")
call matchadd("todo","OBI")
call matchadd("todo","BUG")
call matchadd("todo","FIX")
call matchadd("todo","FIXME")
call matchadd("todo","BADCODE")
call matchadd("todo","MOREDOC")
call matchadd("todo","XXX")

iabbrev o@@             obi@obiwahn.org
iabbrev j@@             Jan@UhdeJC.com
iabbrev <expr> ccopy    'Copyright - ' . strftime('%Y') . ' - Jan Christoph Uhde <Jan@UhdeJC.com>'

iabbrev mfg     Mit freundlichen Grüßen<CR>Jan Christoph Uhde
iabbrev regards Regards<CR><CR>Jan
iabbrev ocheers Cheers!<CR>Obi

"map ,re  o<CR>Regards<CR><CR>  Jan Christoph Uhde<ESC>
map ,mfg o<CR>Mit freundlichen Grüßen,<CR><CR>  Jan Christoph Uhde<ESC>
map ,gr  o<CR>Grüße!<CR><CR>  Obi<ESC>

nnoremap <Leader>oc :e %<.cpp<CR>
nnoremap <Leader>oC :e %<.c<CR>
nnoremap <Leader>oh :e %<.h<CR>
nnoremap <Leader>oH :e %<.hpp<CR>
