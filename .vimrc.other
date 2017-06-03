"-------------------------
" Turn off paste mode when leaving insert
"-------------------------
autocmd InsertLeave * set nopaste

"-------------------------
" Automatically move the cursor to the last editing position
"-------------------------
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


"-------------------------
" Automatically move the current directory
"-------------------------
augroup BufferAu
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END


"---------------------------
" Highlights of the full-width space
" http://inari.hatenablog.com/entry/2014/05/05/231307
"---------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
            "autocmd!の意味：このaugroupに紐づいたautocmdを消し去ります
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

