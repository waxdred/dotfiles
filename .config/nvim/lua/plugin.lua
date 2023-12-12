-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use("simrat39/rust-tools.nvim")
    use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
    use { 'voldikss/vim-floaterm' }

    -- copilot cmp
    use { "zbirenbaum/copilot.lua" }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use { 'onsails/lspkind.nvim' }
    use { 'windwp/nvim-autopairs' }
    use { 'windwp/nvim-ts-autotag' }
    use { 'hoob3rt/lualine.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    -- use { 'akinsho/bufferline.nvim' }
    use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function() require("toggleterm").setup() end }
    use { 'ray-x/go.nvim' }
    use { 'ray-x/guihua.lua' }
    -- dedu
    use { 'leoluz/nvim-dap-go' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'mfussenegger/nvim-dap' }

    -- lsp
    use({ "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end, })
    use 'L3MON4D3/LuaSnip'
    use 'SirVer/ultisnips'
    -- use 'cdelledonne/vim-cmake'
    use 'honza/vim-snippets'
    --
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/playground'
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
    use 'neovim/nvim-lspconfig'
    use 'ray-x/lsp_signature.nvim'
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-commentary'
    use { 'tpope/vim-fugitive' }
    use 'williamboman/nvim-lsp-installer'
    use { 'wbthomason/packer.nvim', opt = false }
    use({
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    })
end)
