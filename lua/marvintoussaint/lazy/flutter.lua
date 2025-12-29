return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("flutter-tools").setup({
 
        debugger = {
          enabled = true,
          run_via_dap = true,
        },

        widget_guides = { enabled = true },
        closing_tags = { enabled = true },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
        lsp = {
          color = { enabled = true },
          settings = {
            dart = {
              showTodos = true,
              completeFunctionCalls = true,
              renameFilesWithClasses = "prompt",
              enableSnippets = true,
              renameFilesWithClasses = "prompt",
            },
          },
        },
      })
    end,
  },
}
