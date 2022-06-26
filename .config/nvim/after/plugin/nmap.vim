
let mapleader = " "

"mapping change viewport
nmap <S-Tab> <C-W><C-W>
nmap <Tab> :bn<CR>


"mapping ranger in nvim
nmap <leader>r :RnvimrToggle<CR>

"commantary line
nmap <leader><leader>c :Commentary <CR>

" mapping Open man
nmap <leader>gm :call FzfMan()<CR>

" mapping fugitif with mapping Leader by space
" map leader to Space
let mapleader = " "
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gb :Git checkout
nmap <leader>g1 :diffget //2<CR> 
nmap <leader>g2 :diffget //3<CR> 

"mapping find replace word undercursor in all buffer
nmap <Leader>sed :bufdo %s/\<<C-r><C-w>\>//g<Left><Left> | update
nmap <Leader>se :s/\<<C-r><C-w>\>//g<Left><Left>

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

"open term
nmap <leader>tt : ToggleTerm size=20 cmd="fish"<CR>

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

au BufNewFile,BufRead *.cpp,*.hpp :Stdheader
au BufNewFile,BufRead *.c,*.h :Stdheader

"mark 
nmap <leader><leader>1 :mark a <CR>
nmap <leader>1 'a
nmap <leader><leader>2 :mark b <CR>
nmap <leader>2 'b
nmap <leader><leader>3 :mark c <CR>
nmap <leader>3 'c

"vimspector mapping
nmap <F2> :call vimspector#StepOver()<CR>
nmap <F3> :call vimspector#StepInto()<CR>
nmap <F4>:call vimspector#StepOut()<CR>
nmap <F12> :call vimspector#Restart()<CR>

" mapping Open Buffer fzf telescope
nmap <leader>b :lua require'telescope.builtin'.buffers()<CR>
nmap <leader>t :! ctags <CR> :lua require('telescope.builtin').tags()<CR>
nmap <leader>f :lua require('telescope.builtin').find_files()<CR>
nmap <leader>dot :lua require('rc_telescope').search_dotfiles()<CR>
nmap <leader>conf :lua require('rc_telescope').config()<CR>
nmap <leader>br :lua require('telescope.builtin').live_grep()<CR>
nmap <leader>bq :lua require('telescope.builtin').quickfix()<CR>
nmap <leader>bg :lua require('telescope.builtin').git_files()<CR>
nmap <leader>xx :lua require('telescope.builtin').diagnostics()<CR>
nmap <leader>gt :lua require('telescope.builtin').git_status()<CR>
nmap <F19> :lua require('telescope.builtin').keymaps()<CR>
nmap <leader>man :lua require('telescope.builtin').man_pages()<CR>
nmap <leader>old :lua require('telescope.builtin').oldfiles()<CR>
nmap <leader>reset :LspRestart<CR>
nmap <leader>cheat :Cheat<CR>
