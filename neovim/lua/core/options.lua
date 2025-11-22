local opt = vim.opt

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = true
opt.colorcolumn = "120"
opt.termguicolors = true

-- lualine shows mode, so no need for "-- INSERT --"
opt.showmode = false

-----------------------------------------------------------
-- Behaviour
-----------------------------------------------------------
opt.errorbells = false
opt.scrolloff = 4
opt.updatetime = 50

-----------------------------------------------------------
-- Tabs & indentation
-----------------------------------------------------------
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true   -- case-sensitive if pattern has capitals
opt.incsearch = true
opt.hlsearch = true

-----------------------------------------------------------
-- Undo / swap / backup
-----------------------------------------------------------
opt.writebackup = false
opt.backup = false
opt.swapfile = false   -- you’re fine without swaps in your setup

local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true

