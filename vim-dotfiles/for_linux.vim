if has("unix")
    " Automatically changed to single-byte input when switch normal mode.
    function! ImInActivate()    
          call system('fcitx-remote -c')
    endfunction
    inoremap <silent> <C-j> <ESC>:call ImInActivate()<CR>
endif

