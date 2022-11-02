local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin/init.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({ "rust-lang/rust.vim", opt = true, ft = { "rs" } })
    use({ "dart-lang/dart-vim-plugin", opt = true, ft = { "dart" } })
    use({ "fatih/vim-go", opt = true, run = ":GoUpdateBinaries", ft = { "go" } })
    use("nvim-lualine/lualine.nvim")
    use({ "lukas-reineke/indent-blankline.nvim", config = 'require("indent_blankline").setup{}' })
    use({
        "sbdchd/neoformat",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "html",
            "markdown",
            "vue",
            "json",
            "lua",
        },
    })
    use("ellisonleao/gruvbox.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
