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

"Autosave
autocmd TextChanged,TextChangedI <buffer> silent write
"Comfig Lex
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
"setting Neovim Tree
let g:c_syntax_for_h = 1

"link for setting coc with
"https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/ 
call plug#begin()
Plug 'puremourning/vimspector'
Plug 'rcarriga/nvim-notify'
Plug 'sunjon/shade.nvim'
Plug 'sunjon/shade.nvim'
Plug 'tpope/vim-fugitive'
Plug 'http://github.com/tpope/vim-surround' " Surrunding ysw)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'gerardbm/vim-atomic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'bfrg/vim-cpp-modern'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'puremourning/vimspector'

call plug#end()

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

"mapping movvec block visuel mode
vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '>-2<CR>gv=gv'

"commantary line
nmap <leader><leader>c :Commentary <CR>

" mapping Open man
nmap <leader>gm :call FzfMan()<CR>
" mapping Open Buffer fzf
nmap <leader>b :lua require('telescope.builtin').buffers()<CR>
nmap <leader>t :! ctags <CR> :lua require('telescope.builtin').tags()<CR>
nmap <leader>q :lua require('telescope.builtin').quickfix()<CR>
nmap <leader>f :lua require('telescope.builtin').find_files()<CR>

" mapping up or down current lines
"nmap <S-j> :m -2 <CR>
"nmap <S-k> :m +1 <CR>

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
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
let g:vimspector_enable_mappings = 'HUMAN'
