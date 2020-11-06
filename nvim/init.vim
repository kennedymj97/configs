" =================================================
" Plugins
" =================================================
call plug#begin('~/.local/share/nvim/site/plugged')

" GUI Enhancements
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
"" Toml and yaml
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
"" Rust
Plug 'rust-lang/rust.vim'
"" Web stuff
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
"" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"" Latex support
Plug 'lervag/vimtex'

" General writing support
Plug 'reedes/vim-pencil'

call plug#end()

" =================================================
" Plugin settings
" =================================================
" Base16 shell integration with base16 vim
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ===== COC completion =====
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" =========================

" rust settings
let g:rustfmt_autosave = 0

" prettier settings
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

" markdown settings
let g:vim_markdown_folding_disabled = 1

" pencil settings
let g:pencil#wrapModeDefault = 'soft'

" set fall back vimtex format see :help vimtex-tex-flavor
let g:tex_flavor = 'latex'

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


" Auto start writing mode for relevant files
function WritingMode()
	hi SpellBad ctermfg=000
	setlocal spell spelllang=en
	:silent! CocDisable
	:Pencil
endfunction

autocmd BufRead,BufNewFile,BufEnter *.tex,*.md call WritingMode()

" Auto start coding mode for relevant file
function CodingMode()
	:silent! CocEnable
endfunction
let writingFileTypes = ['latex', 'bibtex', 'plaintex', 'markdown']
autocmd BufRead,BufNewFile,BufEnter * if index(writingFileTypes, &ft) < 0 
									  \ | call CodingMode()

" Set file type to html for svelte files
au! BufNewFile,BufRead *.svelte set ft=html

" Indenting
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent

" WSL yank support
" https://www.reddit.com/r/bashonubuntuonwindows/comments/be2q3l/how_do_i_copy_whole_text_from_vim_to_clipboard_at/el2vx7u/?utm_source=share&utm_medium=web2x
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" ====================================================================================
" Hotkeys
" ====================================================================================
" fzf custom hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
noremap <leader>s :Rg<CR>

" <leader><leader> toggles between 2 most recently used buffers
nnoremap <leader><leader> <c-^>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Format with prettier
nmap <leader>p :CocCommand prettier.formatFile<CR>
