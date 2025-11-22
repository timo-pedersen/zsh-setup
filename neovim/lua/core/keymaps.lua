local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Move selected lines up / down (visual mode)
-----------------------------------------------------------
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-----------------------------------------------------------
-- System clipboard
-----------------------------------------------------------
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

-----------------------------------------------------------
-- Delete into void register
-----------------------------------------------------------
map({ "n", "v" }, "<leader>d", '"_d', opts)

-----------------------------------------------------------
-- Quickfix navigation (Swedish keyboard friendly)
-----------------------------------------------------------
map("n", "<leader>8", "<cmd>cprevious<CR>", { desc = "Quickfix previous" })
map("n", "<leader>9", "<cmd>cnext<CR>",     { desc = "Quickfix next" })
map("n", "<leader>qo", "<cmd>copen<CR>",    { desc = "Quickfix open" })
map("n", "<leader>qc", "<cmd>cclose<CR>",   { desc = "Quickfix close" })

-----------------------------------------------------------
-- Clear search highlight
-----------------------------------------------------------
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

