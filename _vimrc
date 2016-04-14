:set encoding=utf-8
:set fileencodings=utf-8
:set fileformats=unix,dos,mac
:set number
:set hls
:set expandtab
:set shiftwidth=4
:set guifont=Ricty:h14
:set backspace=indent,eol,start
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

NeoBundle 'scrooloose/nerdtree'
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'

" Colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" NeoBundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=2
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
" let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1

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
set clipboard+=unnamed

