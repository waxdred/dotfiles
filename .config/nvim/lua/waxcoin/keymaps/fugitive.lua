local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- mapping fugitif
keymap.set("n", "<leader>gs", ":Git <CR>", opts)
keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)
keymap.set("n", "<leader>gp", ":Git push<CR>", opts)
keymap.set("n", "<leader>gb", ":Git checkout", opts)
keymap.set("n", "<leader>g1", ":diffget //2<CR> ", opts)
keymap.set("n", "<leader>g2", ":diffget //3<CR> ", opts)
