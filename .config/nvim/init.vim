set nocompatible              " required
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set clipboard=unnamed
set showmatch
set rtp+=/usr/local/opt/fzf
set rnu
set mouse=a
set nu
set autoread
syntax enable
colo ColorCyan
colorscheme waxcoin
set backspace=indent,eol,start
"open vim in vertical
let g:ft_man_open_mode = 'vert'
let g:cmake_link_compile_commands = 0

" lua plug
lua require('init')
" lua require('lsp_config')
"Autosave
" autocmd TextChanged,TextChangedI <buffer> silent write
"Comfig Lex
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
"setting Neovim Tree
let g:c_syntax_for_h = 1

call plug#begin()
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
" Airline_Vim
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"Vim airline setting
let g:airline_theme="cool"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1

" Custom indentPlugin Show
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=242
hi Error NONE
hi ErrorMsg NONE
nnoremap <space> za

" add man in vim cmd Man
runtime! ftplugin/man.vim
let mapleader = " "

"mapping change viewport
nmap <S-Tab> <C-W><C-W>
nmap <Tab> :bn<CR>

"commantary line
nmap <leader><leader>c :Commentary <CR>

" mapping Open man
nmap <leader>gm :call FzfMan()<CR>
" mapping Open Buffer fzf
nmap <leader>b :lua require('telescope.builtin').buffers()<CR>
nmap <leader>t :! ctags <CR> :lua require('telescope.builtin').tags()<CR>
nmap <leader>f :lua require('telescope.builtin').find_files()<CR>
nmap <leader>rc :lua require('rc_telescope').search_dotfiles()<CR>
nmap <leader>br :lua require('telescope.builtin').live_grep()<CR>
nmap <leader>bq :lua require('telescope.builtin').quickfix()<CR>
nmap <leader>bg :lua require('telescope.builtin').git_files()<CR>


" mapping up or down current lines
nmap <S-j> :m -2 <CR>
nmap <S-k> :m +1 <CR>

" mapping fugitif with mapping Leader by space
" map leader to Space
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gb :Git checkout
nmap <leader>g1 :diffget //2<CR> 
nmap <leader>g2 :diffget //3<CR> 

" mapping sed under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nmap <F8> :TagbarToggle<CR>

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
}
EOF

"set completeopt=noinsert,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
let g:vimspector_enable_mappings = 'HUMAN'
let g:UltiSnipsExpandJumpForwardTrigger='<Tab>'

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
let g:vista_fzf_preview = ['right:50%']
