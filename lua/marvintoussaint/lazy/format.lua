return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        -- EXPLANATION: We run prettier first. If it's not found,
        -- we can fallback to others.
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },

        -- Other formats
        lua = { "stylua" },
        dart = { "dart_format" },
        json = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
