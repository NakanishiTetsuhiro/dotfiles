set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
set hls
set incsearch
" set expandtab " If type <tab> when use Control-v <Tab>
set autoindent
set tabstop=4 " ファイル中の<Tab>文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するかを指定する
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set foldlevel=100 " Don't autofold anything
set wildmode=list,full
set ignorecase
set laststatus=2
set hidden " :bコマンドでbufferを切り替える時に編集中ファイルを保存しなくても良くなる機能

" set clipboard=unnamed,autoselect


"---------------------------
" Settings by OS
"---------------------------
let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
    syntax on
    set guifont=Ricty\ Discord:h16

elseif OSTYPE == "Linux\n"
    set syntax=enable
    set guifont=Ricty:h14
    set clipboard=unnamedplus

endif


"---------------------------
" Colorscheme
"---------------------------
" set background=dark
" colorscheme hybrid
" colorscheme railscasts
" colorscheme badwolf
colorscheme molokai

autocmd BufEnter *.md colorscheme molokai

" 背景色をTerminalの色と同じにする
" highlight normal ctermbg=none

" 端末の背景色を無効化する
set t_ut=


"---------------------------
" Syntax check
"---------------------------
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l


"---------------------------
" 保存時に行末の空白を削除
"---------------------------
autocmd BufWritePre * :%s/\s\+$//ge
