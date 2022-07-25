"mapping change viewport
nmap <S-Tab> <C-W><C-W>
nmap <Tab> :bn<CR>

"mapping movvec block visuel mode
vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '>-2<CR>gv=gv'

" mapping Open man
nmap <leader>gm :call FzfMan()<CR>
" mapping Open Buffer fzf
nmap <leader>b :Buffers<CR>

" mapping up or down current lines
nmap <S-j> :m -2 <CR>
nmap <S-k> :m +1 <CR>

" mapping fugitif with mapping Leader by space
" map leader to Space
let mapleader = " "
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gb :Git checkout
nmap <leader>g1 :diffget //2<CR> 
nmap <leader>g2 :diffget //3<CR> 

" mapping sed under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"mapping Vimspector
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

nmap <leader>cc :call C_compile()<CR>

"mapping open Buffer fzf
nmap <leader>b :Buffers<CR>

"mapping open Man fzf
nmap <leader>m :call FzfMan()<CR>

"mapping open Menu
nmap m :call Menu_Start() <CR>

"mapping open Tags
nmap <leader>t :Tags<CR>

"mapping open Terminal
nmap <leader>T :call OpenTermimal() <CR>

"mapping Open cheacheat
nmap <leader>Ch CheatSh() <CR>
