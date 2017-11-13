""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: NakanishiTetsuhiro
" Github: https://github.com/NakanishiTetsuhiro/dotfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"---------------------------
" Dein settings
"---------------------------
if &compatible
  set nocompatible
endif

set runtimepath+='$HOME/.vim/dein/repos/github.com/Shougo/dein.vim'

" Dein setting start
call dein#begin('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('$HOME/dotfiles')
  let s:toml      = g:rc_dir . '/dein.toml'
  " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " vimprocだけは最初にインストールしてほしい
  if dein#check_install(['vimproc'])
      call dein#install(['vimproc'])
  endif

call dein#end()
call dein#save_state()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on


"---------------------------
" Include setting files
"---------------------------
source $HOME/dotfiles/.vimrc.basic
source $HOME/dotfiles/.vimrc.keymap
source $HOME/dotfiles/.vimrc.plugin
source $HOME/dotfiles/.vimrc.other

