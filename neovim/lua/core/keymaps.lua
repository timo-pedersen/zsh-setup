local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete into void register
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void" })

-- Quickfix navigation (Swedish keyboard friendly)
map("n", "<leader>8", "<cmd>cprevious<CR>", { desc = "Quickfix prev" })
map("n", "<leader>9", "<cmd>cnext<CR>",     { desc = "Quickfix next" })
map("n", "<leader>qo", "<cmd>copen<CR>",    { desc = "Quickfix open" })
map("n", "<leader>qc", "<cmd>cclose<CR>",   { desc = "Quickfix close" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bn<CR>")
map("n", "<leader>bp", "<cmd>bp<CR>")
-- map("n", "<leader>bd", "<cmd>bd<CR>") -- buffer delete

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Window hopping
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- terminal escape
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "jk", "<C-\\><C-n>", opts)

