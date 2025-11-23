-- lua/core/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim
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

-- Lazy setup
require("lazy").setup("plugins", {

  defaults = {
    lazy = true, -- plugins lazy by default
  },

  install = {
    colorscheme = { "tokyonight" },
  },

  checker = {
    enabled = true, -- tells you when plugins have updates
    notify = false, -- no annoying popup
  },

  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "matchit",
        "matchparen",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
      },
    },
  },

  ui = {
    border = "rounded",
    size = { width = 0.8, height = 0.8 },
  },
})

