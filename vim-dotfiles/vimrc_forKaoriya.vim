" -----------------------------------------------------
" 参考サイト
" http://ylgbk.hatenablog.com/entry/2015/01/07/120000
" -----------------------------------------------------

" --------------------
" neobundle.vim settings
" --------------------
" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'majutsushi/tagbar'

" Colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'notpratheek/vim-luna'
NeoBundle 'joshdick/onedark.vim'

" Statusbar and tabline
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" ctags assist. Type :TagsGenerate when update ctags
NeoBundle 'szw/vim-tags'

" Golang
NeoBundle 'fatih/vim-go'

" etc
NeoBundle 'tomtom/tcomment_vim' " Type gcc when toggle comment out
NeoBundle 'tpope/vim-surround'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'Shougo/vimproc.vim', {'build' : 'make'}
NeoBundle 'davidhalter/jedi-vim'
" NeoBundle 'easymotion/vim-easymotion'
" NeoBundle 'scrooloose/syntastic.git'


" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck



source $HOME/dotfiles/vim-dotfiles/basic.vim
source $HOME/dotfiles/vim-dotfiles/key_bindings.vim
source $HOME/dotfiles/vim-dotfiles/related_plugins.vim
source $HOME/dotfiles/vim-dotfiles/color_and_theme.vim
source $HOME/dotfiles/vim-dotfiles/for_mac.vim
source $HOME/dotfiles/vim-dotfiles/for_linux.vim
