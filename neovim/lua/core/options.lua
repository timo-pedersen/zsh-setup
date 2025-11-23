local opt = vim.opt

-- Disable some outdated plugins
local disabled_builtins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = true
opt.colorcolumn = "133"
opt.termguicolors = true

-- lualine shows mode, so no need for "-- INSERT --"
opt.showmode = false

-- Behaviour
opt.errorbells = false
opt.scrolloff = 4
opt.updatetime = 50

opt.splitright = true
opt.splitbelow = true

vim.opt.clipboard = "unnamedplus" -- YES I've gone soft!

-- Tabs & indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smartcase = true   -- case-sensitive if pattern has capitals

-- Search
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"  -- preview substitute actions live


-- Undo / swap / backup
opt.writebackup = false
opt.backup = false
opt.swapfile = false   -- you’re fine without swaps in your setup

local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true

