return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
      end

      -- Navigation entre les hunks
      map("n", "]h", function() gs.nav_hunk("next") end, "Gitsigns: hunk suivant")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Gitsigns: hunk précédent")

      -- Actions sur les hunks
      map("n", "<leader>hs", gs.stage_hunk, "Gitsigns: stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Gitsigns: reset hunk")
      map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns: stage sélection")
      map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns: reset sélection")
      map("n", "<leader>hp", gs.preview_hunk, "Gitsigns: aperçu hunk")
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Gitsigns: blame ligne")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Gitsigns: toggle blame inline")
      map("n", "<leader>hd", gs.diffthis, "Gitsigns: diff fichier")
    end,
  },
}
