-----------------------------------------------------------
-- lazy.nvim bootstrap
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
-- Plugin specs
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
        theme = "ayu",
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

      -- Plugin-local keymaps (only when Telescope is available)
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<leader>ff", builtin.find_files,
        vim.tbl_extend("force", opts, { desc = "Telescope: Find files" }))
      map("n", "<leader>fg", builtin.live_grep,
        vim.tbl_extend("force", opts, { desc = "Telescope: Live grep" }))
      map("n", "<leader>fb", builtin.buffers,
        vim.tbl_extend("force", opts, { desc = "Telescope: Buffers" }))
      map("n", "<leader>fh", builtin.help_tags,
        vim.tbl_extend("force", opts, { desc = "Telescope: Help tags" }))
    end,
  },
  ---------------------------------------------------------
  -- Git signs
  ---------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

})

