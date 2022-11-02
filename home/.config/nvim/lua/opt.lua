local function set_args(opts)
    for key, val in pairs(opts) do
        vim.opt[key] = val
    end
end

set_args({
    rnu = true,
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
    wildmode = "longest,list",
    mouse = "a",
    clipboard = "unnamedplus",
    background = "dark",
    background = "dark",
    syntax = "on",
})
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")
