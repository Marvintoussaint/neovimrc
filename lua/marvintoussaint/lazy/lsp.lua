return {
  -- Mason: installs LSP servers
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason <-> LSP bridge (v2+)
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
      },
    },
  },

  -- LSP runtime config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- Capabilities (completion support)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Buffer-local keymaps when LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local bufnr = ev.buf
          local nmap = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end

          nmap("gd", vim.lsp.buf.definition, "Go to Definition")
          nmap("gr", vim.lsp.buf.references, "References")
          nmap("gI", vim.lsp.buf.implementation, "Implementation")
          nmap("K", vim.lsp.buf.hover, "Hover")
          nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
          nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          nmap("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
          nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
          nmap("<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
        end,
      })

      -- Lua (Neovim config)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- TypeScript / JavaScript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

           vim.lsp.config("dartls", {
        capabilities = capabilities,
        cmd = { "dart", "language-server", "--protocol=lsp" },
      })

      -- Diagnostics UI (optional)
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })
    end,
  },
}

