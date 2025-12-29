-- This is used to make a global leader which is the space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ========================
-- BASIC OPTIONS
-- ========================
local opt = vim.opt


-- Help Jump lines
opt.number = true         -- line numbers
opt.relativenumber = true -- relative numbers (movement speed)
opt.cursorline = true     -- highlight current line

-- Tab and Spaces
opt.tabstop = 2 -- Dart/Flutter standard
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = true   -- no line wrapping
opt.scrolloff = 8 -- keep cursor centered
opt.sidescrolloff = 8

opt.termguicolors = true -- true color support
opt.signcolumn = "yes"   -- keep sign column stable

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 300 -- faster diagnostics
opt.timeoutlen = 400 -- faster key combos

-- ========================
-- SEARCH
-- ========================
opt.hlsearch = false
opt.incsearch = true

-- ========================
-- SPLITS
-- ========================
opt.splitright = true
opt.splitbelow = true

-- ========================
-- CLIPBOARD
-- ========================
opt.clipboard = "unnamedplus"

-- ========================
-- BACKUP / SWAP
-- ========================
opt.swapfile = false
opt.backup = false
opt.undofile = true

--Keymaps
-- ========================
-- TERMINAL KEYMAPS
-- ========================
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })



require("marvintoussaint.lazy_init")
require("marvintoussaint.dap")
