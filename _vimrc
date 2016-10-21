"-------------------------
" Common settings
"-------------------------
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
set hls
set expandtab " If type <tab> when use Control-v <Tab>
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guifont=Ricty:h14
set backspace=indent,eol,start
set foldlevel=100 "Don't autofold anything
set wildmode=list,full
set ignorecase
set laststatus=2
" Automatically move the cursor to the last editing position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


"-------------------------
" Key Bindings
"-------------------------
noremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>
noremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
" nnoremap /  /\v

let mapleader = "\<Space>"
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>t :tabnew<CR>
noremap <CR> o<ESC>
" Insert Single Character when typing ,s
nmap <silent> <Leader>s "=nr2char(getchar())<cr>P

noremap <Leader>vrc :tabe $HOME/.vimrc<CR>
noremap <Leader>zrc :tabe $HOME/.zshrc<CR>
noremap <Leader>trc :tabe $HOME/.tmux.conf<CR>

" Invalid ex mode
nnoremap Q <Nop>

" Emmet
let g:user_emmet_leader_key='<C-Y>'

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <F5> :PrevimOpen<CR>

" Vim easymotion
let g:EasyMotion_startofline=0


"---------------------------
" dein.vim settings
"---------------------------
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


"---------------------------
" unite.vim
"---------------------------
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"---------------------------
" VimFiler
"---------------------------
" vim 標準のファイラを置き換える
let g:vimfiler_as_default_explorer = 1
" デフォルトだと Enter でディレクトリに入ってしまって好みと合わないので、Enter は単にツリーを開くだけにした。h と l で "親ディレクトリに移動" と "子ディレクトリに移動" がデフォルトでできて対称性あるので、こっちの設定のが好み
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" C-X C-T で IDE みたいなファイルツリーを開く。width の値を適当に変えると大きさが変わる
noremap <C-E> :VimFiler -split -simple -winwidth=40 -no-quit<ENTER>


"---------------------------
" neocomplcache
"---------------------------
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


"---------------------------
" TmuxNavigate
"---------------------------
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

 
"-------------------------
" Color scheme and theme
"-------------------------
syntax enable
colorscheme molokai
set t_co=256
" let g:airline_theme='luna'
" let g:airline_theme='monochrome'
" let g:airline_theme='molokai'
let g:airline_theme='raven'
" タブラインにもairlineを適用
let g:airline#extensions#tabline#enabled = 1
" 背景色をTerminalの色と同じにする
highlight normal ctermbg=none


"-------------------------
" Automatically move the current directory
"-------------------------
augroup BufferAu
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END


"---------------------------
" 全角スペースの表示(動いてるかわからん)
" http://inari.hatenablog.com/entry/2014/05/05/231307
"---------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif


"---------------------------
" paste
"---------------------------
" if &term =~ "xterm"
"     let &t_ti .= "\e[?2004h"
"     let &t_te .= "\e[?2004l"
"     let &pastetoggle = "\e[201~"
"
"     function! XTermPasteBegin(ret)
"         set paste
"         return a:ret
"     endfunction
"
"     noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
"     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"     cnoremap <special> <Esc>[200~ <nop>
"     cnoremap <special> <Esc>[201~ <nop>
" endif


"---------------------------
" Settings for each OS
"---------------------------
if has('mac')
    source ~/dotfiles/vimrcs/for_mac.vim
elseif has("unix")
    source ~/dotfiles/vimrcs/for_linux.vim
endif

