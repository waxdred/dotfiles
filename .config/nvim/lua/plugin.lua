
packer = require 'packer'
packer.init{
{
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    open_fn  = nil, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    }
  }
}

local use = packer.use
packer.reset()

packer.startup(function()
	use {'wbthomason/packer.nvim', opt = false}
	use 'williamboman/nvim-lsp-installer'
	use 'puremourning/vimspector'
	use 'sunjon/shade.nvim'
	use 'tpope/vim-fugitive'
	use 'http://github.com/tpope/vim-surround'
	use 'https://github.com/tpope/vim-commentary'
	use 'https://github.com/vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'gerardbm/vim-atomic'
	use 'https://github.com/rafi/awesome-vim-colorschemes'
	use 'https://github.com/ryanoasis/vim-devicons'
	use 'https://github.com/tc50cal/vim-terminal'
	use 'https://github.com/preservim/tagbar'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'SirVer/ultisnips'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use 'dcampos/nvim-snippy'
	use 'dcampos/cmp-snippy'
	use 'honza/vim-snippets'
end)
