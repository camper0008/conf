vim.cmd([[
let g:neoformat_try_node_exe = 1
" requires prettier as a dependency
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.css Neoformat
autocmd BufWritePre *.scss Neoformat
autocmd BufWritePre *.html Neoformat
autocmd BufWritePre *.md Neoformat
autocmd BufWritePre *.vue Neoformat
autocmd BufWritePre *.json Neoformat
" requires stylua as a dependency
autocmd BufWritePre *.lua Neoformat
]])
