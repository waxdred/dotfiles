local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--jump word
keymap("n", "<C-n>", ":JumpToNextOccurenteWord<CR>", opts)
-- run chatGpt
keymap("n", "<leader>ch", ":ChatGPT<CR>", opts)
-- running macro
keymap("n", "<leader>q", "@q", opts)
-- Save
keymap("n", "<leader>w", ":w<CR> :wa<CR>", opts)

-- mapping change viewport
keymap("n", "<TAB>", "<C-W><C-W>", opts)
keymap("n", "<S-TAB>", ":bn<CR>", opts)

-- add new line
keymap("n", "<leader>o", "o<Esc>", opts)
keymap("n", "O", "o<Esc>", opts)

-- UnderTreeShow
keymap("n", "<F2>", ":UndotreeShow<CR>", opts)
-- make
keymap("n", "<leader>m", ":make<CR>", opts)

-- commante line
keymap("n", "<leader><leader>c", ":Commentary <CR>", opts)

-- mapping fugitif
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)
keymap("n", "<leader>gb", ":Git checkout", opts)
keymap("n", "<leader>g1", ":diffget //2<CR> ", opts)
keymap("n", "<leader>g2", ":diffget //3<CR> ", opts)

-- mapping find replace word undercursor in all buffer
keymap("n", "<Leader>sed", ":bufdo %s/<C-r><C-w>//g<Left><Left>", opts)
keymap("n", "<Leader>se",  ":s/<<C-r><C-w>>//g | update <Left><Left><Left><Left><Left><Left><Left><Left>", opts)

-- open term
keymap("n", "<leader>tt", ":ToggleTerm size=20 cmd='fish'<CR>", opts)

-- mark
keymap("n", "<leader><leader>1", ":mark a <CR>", opts)
keymap("n", "<leader><leader>2", ":mark b <CR>", opts)
keymap("n", "<leader><leader>3", ":mark c <CR>", opts)
keymap("n", "<leader>1", "'a", opts)
keymap("n", "<leader>2", "'b", opts)
keymap("n", "<leader>3", "'c", opts)

-- mapping Open Buffer fzf telescope
keymap("n", "<leader>bh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>b", ":lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "<leader>bf", ":lua require('telescope.builtin').find_files()<CR>", opts)
-- keymap("n", "<leader>dot", ":lua require('rc_telescope').search_dotfiles()<CR>", opts)
keymap("n", "<leader>bd", ":lua require('close_buffer_telescope').close_buffer()<CR>", opts)
keymap("n", "<leader>conf", ":lua require('rc_telescope').config()<CR>", opts)


keymap("n", "<leader>br", ":lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>bq", ":lua require('telescope.builtin').quickfix()<CR>", opts)
keymap("n", "<leader>bg", ":lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>xx", ":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<CR>", opts)
keymap("n", "<leader>gt", ":lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown({}))<CR>", opts)
keymap("n", "?", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)

keymap("n", "<F4>", ":lua require('telescope.builtin').keymaps()<CR>", opts)
keymap("n", "<leader>man", ":lua require('telescope.builtin').man_pages()<CR>", opts)
keymap("n", "<leader>old", ":lua require('telescope.builtin').oldfiles()<CR>", opts)
keymap("n", "<leader>reset", ":LspRestart<CR>", opts)
keymap("n", "<leader>cheat", ":Cheat<CR>", opts)

-- mapping Lex
keymap("n", "<leader>rr", ":Ex<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
