" These are the mappings for airline.vim.
if !exists('g:loaded_airline') || exists('s:did_airline_options')
	finish
endif
set laststatus=2
let s:did_airline_options = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_enable_branch = 1
"let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'light'
