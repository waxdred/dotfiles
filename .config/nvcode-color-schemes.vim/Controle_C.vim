
" Creation hi with matching
autocmd FileType c match Identifier /ft_[a-z_]*/
autocmd FileType c 2match Var /[+=\-%\/<>*&]/


" autocompleted c

"setting lgne column 80
autocmd FileType c set colorcolumn=80

"color line 80 delimited
hi ColorColumn ctermbg=4

" auto complede ifndef when *.h it's create
autocmd BufNewFile *.h  :call CheckHFile()

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" auto completion langage C
autocmd FileType c inoremap { {<CR>}<C-o>O
autocmd FileType c inoremap " ""<Left>
autocmd FileType c inoremap ( ()<Left>
autocmd FileType c inoremap ' ''<Left>
autocmd FileType c inoremap : :<CR>
autocmd FileType c inoremap ; ;<CR>
autocmd FileType c inoremap [ []<Left>


" ===============fonction================ 
"<F4> Auto write Main C
function! MainC()
    exe "normal!L"
    exe "normal!o"
    exe "normal!oint main(int argc, char **argv)"
    exe "normal!o{"
    exe "normal!o"
    exe "normal!oreturn (0);"
    exe "normal!o}"
endfunction

"Autocompilation ft.h 
function! GenFt()
	:call UpdateTags()
	!sh $HOME/.vim/plugin/scriptTags/GenFt.sh	
endfunction
"fonction clear C file
function! Clear_C()
    execute "! rm -f Makefile"
    execute "! rm -f result_c"
    execute "! rm -f *.out"
endfunction

"<F3> fonction Compilation c > result_c
function! C_compile()
    execute ":make"
    execute ":copen"
endfunction

"<F6> autorun highlight var
function! Seman()
    exe":SemanticHighlight"
endfunction
autocmd FileType c call Seman()

