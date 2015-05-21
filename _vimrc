:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac
:set number

"Vundleの設定
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" " let Vundle manage Vundle
" " required!
" Bundle 'gmarik/vundle'
" " My Bundles here:
" "
" " original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" " ...
" filetype plugin indent on     " required!
" "
" " Brief help
" " :BundleList          - list configured bundles
" " :BundleInstall(!)    - install(update) bundles
" " :BundleSearch(!) foo - search(or refresh cache first) for foo
" " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle command are not allowed..


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" ネオコンneocomplcache
NeoBundleFetch 'Shougo/neocomplcache.vim'
" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" autocloseを設定(自動的に閉じ括弧を入れてくれるやつ)
NeoBundle 'Townk/vim-autoclose'
" endwiseを設定(自動的にendを入れてくれるやつ)
NeoBundle 'tpope/vim-endwise.git'
" Emmetを設定
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-t>'
" surroundを設定（シングルクオートとダブルクオートを切り替えたりできる。cs'"
" というコマンドでシングルクオートをダブルクオートに置換することができます。
" 他にもcs'<p>と打ち込むと、シングルクオート文字列を<p>タグで囲むこともできたりして、応用的な使い方がいろいろできます。
NeoBundle 'tpope/vim-surround'
" tcomment.vim（gccか、<C-->でコメントアウトしたり外したり）
NeoBundle 'tomtom/tcomment_vim'
" Unite
NeoBundle 'Shougo/unite.vim'
" open-browser（URLを開いたり、ググったりできる）
NeoBundle 'open-browser.vim'
" ブラウザの自動リロード
NeoBundle 'tell-k/vim-browsereload-mac'
" css3のsyntax
NeoBundle 'hail2u/vim-css3-syntax'
" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

call neobundle#end()


" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
" Key Remap
"-------------------------
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;
noremap <C-j> <esc>
noremap! <C-j> <esc>


"-------------------------
" Colorscheme
"-------------------------
syntax on

" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid

" set background=dark
" colorscheme solarized
" " 行番号の色を設定
" hi LineNr ctermbg=0 ctermfg=0
" hi CursorLineNr ctermbg=4 ctermfg=0
" set cursorline
" hi clear CursorLine

colorscheme molokai
set t_Co=256
