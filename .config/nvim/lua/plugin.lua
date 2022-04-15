
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
	use 'kevinhwang91/rnvimr'
	use 'L3MON4D3/LuaSnip'
	use 'SirVer/ultisnips'
	use 'akinsho/toggleterm.nvim'
	use 'cdelledonne/vim-cmake'
	use 'chrisbra/Colorizer'
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'dcampos/cmp-snippy'
	use 'dcampos/nvim-snippy'
	use 'f3fora/cmp-spell'
	use 'gerardbm/vim-atomic'
	use 'honza/vim-snippets'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-document-symbol'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-omni'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'liuchengxu/vista.vim'
	use 'mhinz/vim-startify'
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
	use 'onsails/lspkind-nvim'
	use 'preservim/tagbar'
	use 'puremourning/vimspector'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use 'rafi/awesome-vim-colorschemes'
	use 'ray-x/lsp_signature.nvim'
	use 'ryanoasis/vim-devicons'
	use 'saadparwaiz1/cmp_luasnip'
	use 'shaunsingh/nord.nvim'
	use 'sunjon/shade.nvim'
	use 'tc50cal/vim-terminal'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'williamboman/nvim-lsp-installer'
	use {'wbthomason/packer.nvim', opt = false}

end)
