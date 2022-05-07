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
colorscheme waxcoin
set backspace=indent,eol,start

"open vim in vertical
let g:ft_man_open_mode = 'vert'
let g:cmake_link_compile_commands = 1
let g:rnvimr_ex_enable = 1
lua require('init')
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20
"setting Neovim Tree
let g:c_syntax_for_h = 1

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
let g:lsp_diagnostics_echo_cursor = 1

" Custom indentPlugin Show
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=242
hi Error NONE
hi ErrorMsg NONE

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
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snip"]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
let g:vista_fzf_preview = ['right:50%']

" Header setting 42
let g:user42 = 'jmilhas'
let g:mail42 = 'jmilhas@student.42.fr'
