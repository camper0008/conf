-- Resize split buffer panes with <C-(arrow)>
vim.api.nvim_set_keymap("", "<C-Left>", ":vertical resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Right>", ":vertical resize -2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Up>", ":resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Down>", ":resize -2 <CR>", { silent = true })

-- <Esc> should exit terminal insert
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-N>", {})
