set guioptions-=m
set guioptions-=T

set lines=48
set columns=164

set background=dark

" Disable beep
set visualbell t_vb=

if OSTYPE == "Darwin\n"
    set guifont=Ricty\ Discord:h18
elseif OSTYPE == "Linux\n"
    set guifont=Ricty\ Diminished\ Regular:h18
endif

" Key Mappings
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
