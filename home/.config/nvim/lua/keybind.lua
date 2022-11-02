-- Resize split buffer panes with <C-(arrow)>
vim.api.nvim_set_keymap("", "<C-Left>", ":vertical resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Right>", ":vertical resize -2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Up>", ":resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Down>", ":resize -2 <CR>", { silent = true })

-- <C-(x)> instead of <C-w>(x) to switch between split buffer panes
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

-- <Esc> should exit terminal insert
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-N>", {})
