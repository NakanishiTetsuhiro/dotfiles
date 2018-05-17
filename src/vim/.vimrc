""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: NakanishiTetsuhiro
" Github: https://github.com/NakanishiTetsuhiro/dotfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim' " Type gcc when toggle comment out
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'cocopon/vaffle.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Statusbar and tabline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorscheme
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'

" Initialize plugin system
call plug#end()

filetype plugin indent on


"---------------------------
" Include setting files
"---------------------------
source $HOME/dotfiles/src/vim/.vimrc.basic
source $HOME/dotfiles/src/vim/.vimrc.keymap
source $HOME/dotfiles/src/vim/.vimrc.plugin
source $HOME/dotfiles/src/vim/.vimrc.other

"---------------------------
" Indent settings
"---------------------------
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
