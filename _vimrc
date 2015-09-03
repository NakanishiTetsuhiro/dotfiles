:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac
:set number
:set hls
:set expandtab "タブ入力を複数の空白入力に置き換える
:set tabstop=2 "画面上でタブ文字が占める幅
:set shiftwidth=2 "自動インデントでずれる幅
:set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
:set autoindent "改行時に前の行のインデントを継続する
:set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
:set guifont=Ricty:h16 "フォントサイズの設定"
:set backspace=indent,eol,start "バックスペースが効かないことに対する対処"


"---------------------------
" Start Neobundle Settings.
"---------------------------
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" autocloseを設定(自動的に閉じ括弧を入れてくれるやつ)
NeoBundle 'Townk/vim-autoclose'
" endwiseを設定(自動的にendを入れてくれるやつ)
NeoBundle 'tpope/vim-endwise.git'
" Emmetを設定
" NeoBundle 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<C-t>'

" surroundを設定（シングルクオートとダブルクオートを切り替えたりできる。cs'"
" というコマンドでシングルクオートをダブルクオートに置換することができます。
" 他にもcs'<p>と打ち込むと、シングルクオート文字列を<p>タグで囲むこともできたりして、応用的な使い方がいろいろできます。
" NeoBundle 'tpope/vim-surround'
" tcomment.vim（gccか、<C-->でコメントアウトしたり外したり）
NeoBundle 'tomtom/tcomment_vim'
" Unite
NeoBundle 'Shougo/unite.vim'
" open-browser（URLを開いたり、ググったりできる）
" NeoBundle 'open-browser.vim'
" ブラウザの自動リロード
" NeoBundle 'tell-k/vim-browsereload-mac'
" css3のsyntax
" NeoBundle 'hail2u/vim-css3-syntax'
" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

  " "-------------------------
  " " neocomplcache
  " "-------------------------
  " "" neocomplcache
  " NeoBundle 'Shougo/neocomplcache'
  " " Disable AutoComplPop.
  " let g:acp_enableAtStartup = 0
  " " Use neocomplcache.
  " let g:neocomplcache_enable_at_startup = 1
  " " Use smartcase.
  " let g:neocomplcache_enable_smart_case = 1
  " " Set minimum syntax keyword length.
  " let g:neocomplcache_min_syntax_length = 3
  " let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  "
  " " Define dictionary.
  " let g:neocomplcache_dictionary_filetype_lists = {
  "     \ 'default' : ''
  "     \ }
  "
  " " Plugin key-mappings.
  " inoremap <expr><C-g>     neocomplcache#undo_completion()
  " inoremap <expr><C-l>     neocomplcache#complete_common_string()
  "
  " " Recommended key-mappings.
  " " <CR>: close popup and save indent.
  " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  " function! s:my_cr_function()
  "   return neocomplcache#smart_close_popup() . "\<CR>"
  " endfunction
  " " <TAB>: completion.
  " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " " <C-h>, <BS>: close popup and delete backword char.
  " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  " inoremap <expr><C-y>  neocomplcache#close_popup()
  " inoremap <expr><C-e>  neocomplcache#cancel_popup()
  " "-------------------------
  " " End neocomplcache
  " "-------------------------
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


"-------------------------
" setting of only mac
"-------------------------
" Vimをhomebrewでインスコしたときに設定
set clipboard+=unnamed
