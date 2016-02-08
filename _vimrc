:set encoding=utf-8
:set fileencodings=utf-8
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
" Neobundle Settings.
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

NeoBundle 'Townk/vim-autoclose'

NeoBundle 'tpope/vim-endwise.git'

" Emmetを設定
" NeoBundle 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<C-t>'

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

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" NeoBundle 'Shougo/neocomplete.vim'
" let g:neocomplete#enable_at_startup = 1
" NeoBundle 'violetyk/neocomplete-php.vim'
" let g:neocomplete_php_locale = 'ja'


call neobundle#end()


" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck


"-------------------------
" Key Bindings
"-------------------------
" nnoremap ; :
" noremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <C-j> <Esc>

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
" For OSX only
"-------------------------
" Vimをhomebrewでインスコしたときに設定
set clipboard+=unnamed

