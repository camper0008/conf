set rnu nu expandtab smartindent autoindent noswapfile splitbelow splitright cursorline cursorcolumn
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmode=longest,list
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-N>

noremap <silent> <C-Left> :vertical resize +2 <CR>
noremap <silent> <C-Right> :vertical resize -2 <CR>
noremap <silent> <C-Up> :resize +2 <CR>
noremap <silent> <C-Down> :resize -2 <CR>

call plug#begin()
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'sbdchd/neoformat'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'ellisonleao/gruvbox.nvim'
call plug#end()

set background=dark " or light if you want light mode
colorscheme gruvbox

let g:rustfmt_autosave = 1

" requires prettier as a dependency
let g:neoformat_try_node_exe = 1
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

" lualine
lua << END
    require('lualine').setup {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filename'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'},
        },  
    }
END

" indent_blankline
lua << END
require("indent_blankline").setup {}
END
