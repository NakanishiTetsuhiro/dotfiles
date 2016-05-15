:set encoding=utf-8
:set fileencodings=utf-8
:set fileformats=unix,dos,mac
:set number
:set hls
:set expandtab
:set shiftwidth=4
:set guifont=Ricty:h14
:set backspace=indent,eol,start
:set foldlevel=100 "Don't autofold anything
" :set tabstop=2
" :set softtabstop=2
" :set autoindent
" :set smartindent

"---------------------------
" neobundle settings.
"---------------------------
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


" Filer
NeoBundle 'scrooloose/nerdtree'
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
NeoBundle 'kien/ctrlp.vim'

" Unite.vim
NeoBundle 'Shougo/unite.vim'

" Ruby
NeoBundle 'tpope/vim-endwise.git'

" Git
NeoBundle 'tpope/vim-fugitive'

" Colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" Syntax checking
NeoBundle 'scrooloose/syntastic.git'

" Markdown Preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Firefox'

" etc
NeoBundle 'tomtom/tcomment_vim'
" I do not know well how to use...
NeoBundle 'easymotion/vim-easymotion'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

"-------------------------
" Key Bindings
"-------------------------
nnoremap <ESC><ESC> :nohlsearch<CR>
noremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
inoremap <C-j> <Esc>
nnoremap /  /\v
let mapleader = "\<Space>"
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>t :tabnew<CR>
noremap <CR> o<ESC>

"-------------------------
" Colorscheme
"-------------------------
syntax on

" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid

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
" OSX settings
"---------------------------
" set clipboard+=unnamed

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
