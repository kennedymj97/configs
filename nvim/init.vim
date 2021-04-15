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
Plug 'junegunn/fzf', { 'do' { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

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
noremap <leader>s :Rg


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

" Use clipboard
set clipboard+=unnamedplus
