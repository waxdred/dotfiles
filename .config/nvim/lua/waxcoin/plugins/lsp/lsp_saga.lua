return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
  keys = {
    {
      "K",
      function()
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts);
      end
    },
    {
      "<C-k>",
      function()
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set
        keymap("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      end
    },
    {
      "<C-j>",
      function()
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set
        keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      end
    },
    {
      "<bd>",
      function()
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set
        keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      end
    },
  },
  config = function()
    require('lspsaga').setup({})
  end,
}
