-- Leader = ""

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Yank into clipboard
map_key("n", "<leader>y", "\"+y")
map_key("v", "<leader>y", "\"+y")
-- yank line into clipboard
map_key("n", "<leader>Y", "\"+yy")

-- Delete into void
vim.keymap.set({"n", "v"}, "<leader>d", '"_d', { noremap = true, silent = true })

-- Quickfix navigation (Swedish keyboard friendly)
map("n", "<leader>8", "<cmd>cprevious<CR>",   { desc = "Quickfix previous" })
map("n", "<leader>9", "<cmd>cnext<CR>",       { desc = "Quickfix next" })
map("n", "<leader>qo", "<cmd>copen<CR>",      { desc = "Quickfix open" })
map("n", "<leader>qc", "<cmd>cclose<CR>",     { desc = "Quickfix close" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

