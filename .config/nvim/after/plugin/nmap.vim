"mapping change viewport
nmap <S-Tab> <C-W><C-W>
nmap <Tab> :bn<CR>

" mapping Open man
nmap <leader>gm :call FzfMan()<CR>
" mapping Open Buffer fzf
nmap <leader>b :Buffers<CR>

" mapping fugitif with mapping Leader by space
" map leader to Space
let mapleader = " "
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gb :Git checkout
nmap <leader>g1 :diffget //2<CR> 
nmap <leader>g2 :diffget //3<CR> 

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
autocmd FileType c inoremap [ []<Left>
autocmd FileType cpp inoremap { {<CR>}<C-o>O
autocmd FileType cpp inoremap " ""<Left>
autocmd FileType cpp inoremap ( ()<Left>
autocmd FileType cpp inoremap ' ''<Left>
autocmd FileType cpp inoremap [ []<Left>

"mark 
nmap <leader>1 :mark a <CR>
nmap <leader><leader>1 'a
