-- modified from kickstart.nvim
-- remember to run :checkhealth & :PackerInstall / :PackerSync
local vim = vim -- avoids "undefined global nvim" errors everywhere :-/

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- toggleterm my beloved
    use({
	"akinsho/toggleterm.nvim",
	tag = "2.3.0",
	config = function()
	    require("toggleterm").setup({
		open_mapping = [[<C-k>]],
		direction = "float",
		float_opts = {
		    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		},
	    })
	end,
    })

    use({
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	requires = {
	    -- Useful status updates for LSP
	    "j-hui/fidget.nvim",
	},
    })

    use({
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    })

    use({
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	run = function()
	    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
    })

    use({
	-- Additional text objects via treesitter
	"nvim-treesitter/nvim-treesitter-textobjects",
	after = "nvim-treesitter",
    })

    use("ellisonleao/gruvbox.nvim")
    use("nvim-lualine/lualine.nvim") -- Fancier statusline
    use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
    use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
    use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

    if is_bootstrap then
	require("packer").sync()
    end
end)

if is_bootstrap then
    print("==================================")
    print("    Plugins are being installed")
    print("    Wait until Packer completes,")
    print("       then restart nvim")
    print("==================================")
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC"),
})

local set_args = function(opts)
    for key, val in pairs(opts) do
	vim.opt[key] = val
    end
end

set_args({
    nu = true,
    expandtab = true,
    smartindent = true,
    autoindent = true,
    swapfile = false,
    splitbelow = true,
    splitright = true,
    cursorline = true,
    cursorcolumn = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    breakindent = true,
    wildmode = "longest,list",
    mouse = "a",
    clipboard = "unnamedplus",
    background = "dark",
    syntax = "on",
    hlsearch = false,
    undofile = true,
    ignorecase = true,
    smartcase = true,
    termguicolors = true,
    completeopt = "menuone,noselect",
})

vim.cmd([[colorscheme gruvbox]])

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
	vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Set lualine as statusline
require("lualine").setup({
    sections = {
	lualine_a = { "mode" },
	lualine_b = { "filename", "diff" },
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = { "location" },
    },
    options = {
	icons_enabled = false,
	theme = "gruvbox",
	component_separators = "|",
	section_separators = "",
    },
})

-- Enable Comment.nvim (gc to comment)
require("Comment").setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
require("ibl").setup({
    indent = { char = "┆" },
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
    defaults = {
	mappings = {
	    i = {
		["<C-u>"] = false,
		["<C-d>"] = false,
		["<Esc>"] = require("telescope.actions").close,
	    },
	},
    },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
	winblend = 10,
	previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "python", "rust", "typescript", "vimdoc", "vim", "elixir" },
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
	enable = false,
    },
    textobjects = {
	select = {
	    enable = true,
	    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
	    keymaps = {
		-- You can use the capture groups defined in textobjects.scm
		["aa"] = "@parameter.outer",
		["ia"] = "@parameter.inner",
		["af"] = "@function.outer",
		["if"] = "@function.inner",
		["ac"] = "@class.outer",
		["ic"] = "@class.inner",
	    },
	},
	move = {
	    enable = true,
	    set_jumps = true, -- whether to set jumps in the jumplist
	    goto_next_start = {
		["]m"] = "@function.outer",
		["]]"] = "@class.outer",
	    },
	    goto_next_end = {
		["]M"] = "@function.outer",
		["]["] = "@class.outer",
	    },
	    goto_previous_start = {
		["[m"] = "@function.outer",
		["[["] = "@class.outer",
	    },
	    goto_previous_end = {
		["[M"] = "@function.outer",
		["[]"] = "@class.outer",
	    },
	},
	swap = {
	    enable = true,
	    swap_next = {
		["<leader>a"] = "@parameter.inner",
	    },
	    swap_previous = {
		["<leader>A"] = "@parameter.inner",
	    },
	},
    },
})

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
	if desc then
	    desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
	vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Turn on lsp status information
require("fidget").setup()

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

-- lspconfig
local lsp_servers = { "rust_analyzer", "clangd", "denols", "dartls", "ruff", "pyright" };

local lspconfig = require("lspconfig");
for _, server in ipairs(lsp_servers) do
    lspconfig[server].setup({
	on_attach = on_attach,
	capabilities = capabilities,
    });
end

lspconfig["elixirls"].setup({
    cmd = { "/home/pieter/.config/elixir_ls/launch.sh" },
});

cmp.setup({
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
    mapping = cmp.mapping.preset.insert({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<CR>"] = cmp.mapping.confirm({
	    behavior = cmp.ConfirmBehavior.Replace,
	    select = true,
	}),
	["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item()
	    else
		fallback()
	    end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_prev_item()
	    else
		fallback()
	    end
	end, { "i", "s" }),
    }),
    sources = {
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
    },
})

-- resize split buffer panes with <C-(arrow)>
vim.api.nvim_set_keymap("", "<C-Left>", ":vertical resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Right>", ":vertical resize -2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Up>", ":resize +2 <CR>", { silent = true })
vim.api.nvim_set_keymap("", "<C-Down>", ":resize -2 <CR>", { silent = true })
