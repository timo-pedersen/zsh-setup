-----------------------------------------------------------
-- Leader
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------
-- Basic options
-----------------------------------------------------------
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = true
opt.colorcolumn = "120"
opt.termguicolors = true

-- No need for "-- INSERT --" when lualine shows mode
opt.showmode = false

-- Behaviour
opt.errorbells = false
opt.scrolloff = 4
opt.updatetime = 50

-- Tabs & indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true      -- modern addition: case-sensitive if pattern has uppercase
opt.incsearch = true
opt.hlsearch = true

-- Undo / swap / backup
opt.writebackup = false
opt.backup = false
opt.swapfile = false

local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true

-----------------------------------------------------------
-- lazy.nvim bootstrap (WSL git only, no curl mess)
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup({
  ---------------------------------------------------------
  -- Statusline: lualine
  ---------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "ayu",  -- keep what you had
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  ---------------------------------------------------------
  -- Telescope + fzf-native
  ---------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
      })

      -- Load fzf extension if compiled
      pcall(telescope.load_extension, "fzf")

      -- Minimal, sane keymaps (no noise, all under <leader>f)
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<leader>ff", builtin.find_files, vim.tbl_extend("force", opts, { desc = "Find files" }))
      map("n", "<leader>fg", builtin.live_grep,  vim.tbl_extend("force", opts, { desc = "Live grep" }))
      map("n", "<leader>fb", builtin.buffers,    vim.tbl_extend("force", opts, { desc = "List buffers" }))
      map("n", "<leader>fh", builtin.help_tags,  vim.tbl_extend("force", opts, { desc = "Help tags" }))
    end,
  },
})



-----------------------------------------------------------
-- Quickfix navigation (Swedish keyboard friendly)
-----------------------------------------------------------
local map = vim.keymap.set
local km_opts = { noremap = true, silent = true }

map("n", "<leader>8", "<cmd>cprevious<CR>", vim.tbl_extend("force", km_opts, { desc = "Quickfix previous" }))
map("n", "<leader>9", "<cmd>cnext<CR>",     vim.tbl_extend("force", km_opts, { desc = "Quickfix next" }))

-- Optional but useful:
-- map("n", "<leader>qo", "<cmd>copen<CR>",   vim.tbl_extend("force", km_opts, { desc = "Quickfix open" }))
-- map("n", "<leader>qc", "<cmd>cclose<CR>",  vim.tbl_extend("force", km_opts, { desc = "Quickfix close" }))


