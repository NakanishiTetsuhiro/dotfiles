:
" let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
" let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let g:config_home = expand('$HOME/dotfiles')

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    " dein.vim をプラグインとして読み込む
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home

    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    " call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    " if has('nvim')
    "     call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    " endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif


"---------------------------
" Include setting files
"---------------------------
source $HOME/dotfiles/.vimrc.basic
source $HOME/dotfiles/.vimrc.keymap
source $HOME/dotfiles/.vimrc.plugin
source $HOME/dotfiles/.vimrc.other
