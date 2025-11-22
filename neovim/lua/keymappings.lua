vim.g.mapleader = ' '

-- keymapper 
local map_key = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        {noremap = true, silent = true}
    )
end

map_key("v", "J", ":m '>+1<CR>gv=gv")
map_key("v", "K", ":m '<-2<CR>gv=gv")

-- Yank into system clipboard +
map_key("n", "<leader>y", "\"+y")
map_key("v", "<leader>y", "\"+y")
map_key("n", "<leader>Y", "\"+Y")

-- Delete into void
map_key("n", "<leader>d", "\"_d")
map_key("v", "<leader>d", "\"_d")
