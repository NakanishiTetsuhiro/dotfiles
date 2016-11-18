let mapleader = "\<Space>"

noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>
noremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
noremap <Leader>w :w<CR>
noremap <Leader>t :tabnew<CR>
noremap <CR> o<ESC>
noremap <Leader>zrc :e $HOME/.zshrc<CR>
noremap <Leader>trc :e $HOME/.tmux.conf<CR>
" バッファに関するキーバインド：http://ivxi.hatenablog.com/entry/2013/05/23/163825
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bf :bf<CR>
nnoremap <silent>bl :bl<CR>
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>
nnoremap Q <Nop>
" http://babie.hatenablog.com/entry/20060111/p4
" nnoremap <Leader>+ <C-w>5+
" nnoremap <Leader>- <C-w>5-
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
nnoremap <Insert> "+gp
inoremap <Insert> <Esc>"+gpa

" Insert Single Character when typing ,s
nmap <silent> <Leader>s "=nr2char(getchar())<cr>P

" Emmet
let g:user_emmet_leader_key='<C-Y>'

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <F5> :PrevimOpen<CR>

" Vim easymotion
let g:EasyMotion_startofline=0

" Tag bar
nmap <F8> :TagbarToggle<CR>
