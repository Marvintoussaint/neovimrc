return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      -- Define formatter using your installed Dart SDK
      require("conform").formatters.dart_format = {
        command = "dart",
        args = { "format", "--output=write", "$FILENAME" },
        stdin = false,
      }
    end,
  },
}

