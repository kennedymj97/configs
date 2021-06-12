" ====================================================================================
" Plugins
" ====================================================================================
call plug#begin('~/.local/share/nvim/site/plugged')

" GUI Enhancements
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" Syntax highlighting and indentation
Plug 'sheerun/vim-polyglot'

" Fuzzy finding
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()
" ====================================================================================
" Plugin settings
" ====================================================================================
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" ====================================================================================
" Keybindings
" ====================================================================================
let mapleader = "\<Space>"

" switch between last two buffers
nnoremap <leader><leader> <c-^>

" fzf
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
noremap <leader>s :Rg<CR>


" ====================================================================================
" Editor settings
" ====================================================================================
" Styling
set background=dark
hi Normal ctermbg=NONE

" View will start scrolling 2 lines above bottom/top
set scrolloff=2

" Hybrid line numbers
set number relativenumber
set nu rnu

" Permanent undo (can undo when reopening buffer after closing)
set undodir=~/.vimdid
set undofile

" Indenting
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set expandtab

" Use clipboard
set clipboard+=unnamedplus

" Column at 120 characters
set colorcolumn=120

" ====================================================================================
" LSP and Tree Sitter Config
" ====================================================================================
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

local servers = { "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    virtual_text = false,
  }
)
EOF
