-- Guard
if vim.g.__init_lua_loaded then
  return
end
vim.g.__init_lua_loaded = true

-- Protected setup
local ok, err = pcall(function()

    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Bootstrap / load plugin manager first
    require("core.lazy")

    -- Core settings & keymaps
    require("core.options")
    require("core.keymaps")
    require("core.filetypes")

    -- Optional:
    -- require("core.autocmds")
end)

-- Show sane error msg
if not ok then
  vim.api.nvim_echo({{"init.lua error: "..err, "ErrorMsg"}}, true, {})
end

