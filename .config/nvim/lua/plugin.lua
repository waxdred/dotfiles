-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use("simrat39/rust-tools.nvim")
	use { "RRethy/vim-illuminate" }
	use { "ThePrimeagen/vim-be-good" }
    use { "waxdred/Term_ChatGPT"}
	use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" },}
	use ( 'nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
	use { 'anuvyklack/hydra.nvim', requires = 'anuvyklack/keymap-layer.nvim'}
	use { 'lukas-reineke/indent-blankline.nvim' }
	use { 'epilande/vim-react-snippets' }
	use { 'MunifTanjim/nui.nvim'}
    use {'voldikss/vim-floaterm'}
	use { 'windwp/nvim-autopairs' }
	use { 'windwp/nvim-ts-autotag' }
	use { 'norcalli/nvim-colorizer.lua' }
	use { 'hoob3rt/lualine.nvim' }
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'akinsho/bufferline.nvim' }
	use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function() require("toggleterm").setup()end }
	use { 'ray-x/go.nvim' }
	use { 'ray-x/guihua.lua' }
    use({"glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end,})
	use { 'yamatsum/nvim-cursorline' }
	use { 'mbbill/undotree' }
	use 'airblade/vim-gitgutter'
	use 'RishabhRD/popfix'
	use 'RishabhRD/nvim-cheat.sh'
	use 'folke/lsp-colors.nvim'
	use 'kevinhwang91/rnvimr'
	use 'L3MON4D3/LuaSnip'
	use 'SirVer/ultisnips'
	use 'cdelledonne/vim-cmake'
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'dcampos/nvim-snippy'
	use 'honza/vim-snippets'
    --
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/playground'
	use 'onsails/lspkind-nvim'
	use 'preservim/tagbar'
	-- cmp install
	use 'hrsh7th/cmp-buffer'
	use 'dcampos/cmp-snippy'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use 'f3fora/cmp-spell'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-document-symbol'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-omni'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/nvim-cmp'
	use 'liuchengxu/vista.vim'
	use 'neovim/nvim-lspconfig'
	use 'rafi/awesome-vim-colorschemes'
	use 'ray-x/lsp_signature.nvim'
	use 'ryanoasis/vim-devicons'
	use 'shaunsingh/nord.nvim'
	use 'sunjon/shade.nvim'
	use 'tc50cal/vim-terminal'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
	use 'williamboman/nvim-lsp-installer'
	use {'wbthomason/packer.nvim', opt = false}
	use 'folke/trouble.nvim'
	use { 'theHamsta/nvim-dap-virtual-text' }
	use { 'mfussenegger/nvim-dap' }
end)
