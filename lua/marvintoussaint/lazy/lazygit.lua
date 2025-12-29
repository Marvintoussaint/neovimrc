return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "LazyGit" }, -- lazy-load when command is used
  keys = {
    {
      "<leader>gg",
      "<cmd>LazyGit<CR>",
      desc = "Open LazyGit",
    },
  },
}
