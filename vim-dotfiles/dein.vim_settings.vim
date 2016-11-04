" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
 execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Setting start
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('shougo/neocomplete.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/neocomplcache')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('mattn/emmet-vim')
  
  " Colorscheme
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('tomasr/molokai')
  call dein#add('sjl/badwolf')
  call dein#add('notpratheek/vim-luna')
  
  " Statusbar and tabline
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Markdown
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  
  " ctags assist. Type :TagsGenerate when update ctags
  call dein#add('szw/vim-tags')
  
  " etc
  call dein#add('tomtom/tcomment_vim') " Type gcc when toggle comment out
  call dein#add('tpope/vim-surround')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  " call dein#add('easymotion/vim-easymotion')
  " call dein#add('davidhalter/jedi-vim')
  " call dein#add('scrooloose/syntastic.git')

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on


