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

" Ruby
" NeoBundle 'tpope/vim-endwise.git'

" Git
NeoBundle 'tpope/vim-fugitive'

" Colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" Syntax check
NeoBundle 'scrooloose/syntastic.git'

" Markdown Preview
" If want to preview Markdown file please type :PrevimOpen
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

"-------------------------
" Colorscheme
"-------------------------
syntax on

" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid

colorscheme molokai
set t_Co=256

"---------------------------
" OSX Settings
"---------------------------
" set clipboard+=unnamed

