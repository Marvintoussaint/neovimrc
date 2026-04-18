return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        -- EXPLANATION: We explicitly ignore directories that contain
        -- thousands of files we never want to search through. This is
        -- critical for performance in React Native/Node.js projects.
        file_ignore_patterns = { "node_modules/", ".git/", "android/", "ios/", "build/" },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['x'] = actions.delete_buffer,
            },
            n = {
              ['x'] = actions.delete_buffer,
            },
          },
        },
      },
    })

    -- EXPLANATION: You had the fzf-native dependency, but it wasn't
    -- actually being used. This line "loads" the extension, giving
    -- Telescope a massive performance boost when sorting search results.
    telescope.load_extension('fzf')

    -- keymaps

    -- EXPLANATION: Using git_files instead of find_files. In a git repo
    -- (like most RN projects), this automatically ignores everything in your
    -- .gitignore without extra config. It is much faster and cleaner.
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Find files (Git only)' })
    -- You can still use the fallback find_files if needed with a different map:
    vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Find all files (fallback)' })

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })

    -- EXPLANATION: Essential for RN! Place cursor on a component or
    -- variable, press <leader>gr, and Telescope shows you EVERYWHERE it is
    -- being used in your project.
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Go to References (LSP)' })
  end,
}
