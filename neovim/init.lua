-----------------------------------------------------------
-- Leader keys
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------
-- Core settings & keymaps
-----------------------------------------------------------
require("core.options")
require("core.keymaps")
require("core.lazy") -- This handles all plugins

