set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
set hls
" If type <tab> when use Control-v <Tab>
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guifont=Ricty:h14
set backspace=indent,eol,start
set foldlevel=100 "Don't autofold anything

" Automatically move the cursor to the last editing position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


"-------------------------
" Key Bindings
"-------------------------
noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>
noremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
" nnoremap /  /\v

let mapleader = "\<Space>"
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>t :tabnew<CR>
noremap <CR> o<ESC>
" Insert Single Character when typing ,s
nmap <silent> ,s "=nr2char(getchar())<cr>P

noremap <Leader>vrc :tabe ~/.vimrc<CR>


"---------------------------
" dein.vim settings
"---------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/nakanishi/.vim/dein.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/nakanishi/.vim/dein.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" Filer
call dein#add('scrooloose/nerdtree')
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
call dein#add('kien/ctrlp.vim')

" Unite.vim
call dein#add('Shougo/unite.vim')

" Python
" call dein#add('davidhalter/jedi-vim')

" Ruby
" call dein#add('tpope/vim-endwise.git')

" Git
call dein#add('tpope/vim-fugitive')

" Colorschemes
call dein#add('altercation/vim-colors-solarized')
call dein#add('w0ng/vim-hybrid')
call dein#add('tomasr/molokai')

" Syntax check
call dein#add('scrooloose/syntastic.git')

" Markdown Preview
" If want to preview Markdown file please type :PrevimOpen
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Firefox'

" ctags assist. Type :TagsGenerate when update ctags
call dein#add('szw/vim-tags')

" etc
" Type gcc when toggle comment out
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('easymotion/vim-easymotion')
  let g:EasyMotion_startofline=0
call dein#add('christoomey/vim-tmux-navigator')
  nmap <silent> <nop> :TmuxNavigateDown<cr>

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"-------------------------
" Colorscheme
"-------------------------
syntax on
colorscheme molokai
set t_Co=256


"-------------------------
" Automatically move the current directory
"-------------------------
augroup BufferAu
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END


"-------------------------
" Automatically changed to single-byte input when switch normal mode.
"-------------------------
function! ImInActivate()
      call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-j> <ESC>:call ImInActivate()<CR>


"---------------------------
" unite.vim settings
"---------------------------
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"---------------------------
" jedi-vim Setting
"---------------------------
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
"
" g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


"---------------------------
" paste
"---------------------------
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    " function! を使うとfunctionを上書きできるようになる
    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif


"---------------------------
" Settings for each OS
"---------------------------
if has('mac')
    set clipboard+=unnamed
endif


"---------------------------
" auto reload .vimrc
"---------------------------
augroup source-vimrc
    autocmd!
    autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
