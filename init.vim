call plug#begin('~/.local/share/nvim/site/plugged')

" Change the color of the statusline 
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

" Syntax highlighting and Indentation for Haskell
Plug 'neovimhaskell/haskell-vim'

" Hindent integration (also stylish-haskell)
Plug 'alx741/vim-hindent'

" Linting
Plug 'dense-analysis/ale'

" Intero
Plug 'parsonsmatt/intero-neovim'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install
" script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'elmcast/elm-vim'

Plug 'sheerun/vim-polyglot'
" {{{
  set ttimeout
  set ttimeoutlen=0
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
" }}}

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

let maplocalleader = "-"
let mapleader = "\\"

set tabstop=2 shiftwidth=2 expandtab

set background=dark
colorscheme palenight
let g:airline_theme = "palenight"

" ----- neovimhaskell/haskell-vim -----
" Align 'then' two spaces after 'if'
" let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
" let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
" let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
" let g:haskell_indent_let_no_in = 0

" ----- hindent & stylish-haskell -----
" Indenting on save is too aggressive for me
let g:hindent_on_save = 0
" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
" Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
" Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
" First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" autocmd BufWritePost *.hs :call HaskellFormat('both')

" ----- w0rp/ale -----
let g:ale_fixers = {'haskell': ['hlint']}
let g:ale_linters = {'haskell': ['hlint']}
" ----- parsonsmatt/intero-neovim -----
" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 0
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0

augroup interoMaps
  au!

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  au FileType haskell map <leader>t <Plug>InteroGenericType
  au FileType haskell map <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END
