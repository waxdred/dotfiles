return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview: changements" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: historique fichier" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: historique repo" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview: fermer" },
  },
  opts = {},
}
