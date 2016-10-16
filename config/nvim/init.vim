call plug#begin('~/.config/nvim/plugged')

" File navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Syntax highlighting
Plug 'noahfrederick/vim-noctu'
Plug 'luochen1990/rainbow'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'neomake/neomake'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'justmao945/vim-clang', { 'for': 'cpp' }
Plug 'zchee/deoplete-jedi', { 'for': 'py' }

call plug#end()


" Enable syntax highlighting
syntax on
silent! colorscheme noctu

" Keep buffers open
set hidden

" Better command completion
set wildmenu
set wildmode=list:longest,full
set showcmd

" Highlght search results
set hlsearch
set incsearch

" Better searching
set ignorecase
set smartcase

" Usual backspace behavior
set backspace=indent,eol,start
set nostartofline

" Auto-indent
set autoindent

" Display cursor position
set ruler

" Indent using 2 spaces
set expandtab
function! SetTab(n)
  let &shiftwidth=a:n
  let &tabstop=a:n
  let &softtabstop=a:n
endfunction
command! -nargs=1 Tab call SetTab(<args>)
Tab 2

" Always display status line
set laststatus=2

" Ask about unsaved changes
set confirm

" No bell
set visualbell
set t_vb=

" Enable mouse support
set mouse=a

" Display line numbers
set number

" Timeout on keycodes but not mappings
" set notimeout ttimeout ttimeoutlen=200
set clipboard=unnamed

" Store swap and backup files in ~/.local/share/nvim
silent !mkdir -p ~/.local/share/nvim/swap > /dev/null 2>&1
set dir=~/.local/nvim/swap//,.
silent !mkdir -p ~/.local/share/nvim/backup > /dev/null 2>&1
set backupdir=~/.local/nvim/backup//,.


" Keymaps for colemak
mapclear
let mapleader=","
nnoremap <c-h> <c-w>h
nnoremap n j|xnoremap n j|vnoremap n j|onoremap n j
nnoremap N 10j|xnoremap N 10j|vnoremap N 10j|onoremap N 10j
nnoremap <c-n> <c-w>j
nnoremap <c-w>n <c-w>j
nnoremap e k|xnoremap e k|vnoremap e k|onoremap e k
nnoremap E 10k|xnoremap E 10k|vnoremap E 10k|onoremap E 10k
nnoremap <c-e> <c-w>k
nnoremap <c-W>e <c-w>k
nnoremap i l|xnoremap i l|vnoremap i l|onoremap i l
nnoremap <c-i> <c-w>l
nnoremap <c-w>i <c-w>l
nnoremap m J
onoremap r i
nnoremap k n
nnoremap K N
nnoremap s i
nnoremap S I
nnoremap t a
nnoremap T A
nnoremap j t
nnoremap J T
nnoremap U <c-r>
nnoremap Q @
nnoremap <leader>i :bn<Return>
nnoremap <leader>h :bp<Return>
nnoremap <leader>d :bp\|bd #<Return>
nnoremap <leader>D :bd!<Return>
nnoremap <leader>p :CtrlP<Return>
nnoremap <leader>b :!make<Return>
nnoremap <leader>s :let @/ = ""<Return>
inoremap <c-o> <c-x><c-o>


" On OSX, Ctrl-h is Backspace
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ 'Darwin\n'
    nnoremap <bs> <c-w>h
  endif
endif


" Rainbow Configuration
let g:rainbow_conf = {
    \   'guifgs': [4, 2, 3, 7],
    \   'ctermfgs': [4, 2, 3, 7],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {}
    \}
let g:rainbow_active = 1

" NERDTree Configuration
let g:NERDTreeMapJumpFirstChild = "ge"
let g:NERDTreeMapJumpLastChild = "gn"
let g:NERDTreeMapToggleHidden = "H"
let g:NERDTreeMapOpenSplit = "S"
let g:NERDTreeMapOpenExpl = ""
let g:NERDTreeMouseMode = 2
let g:NERDTreeShowHidden = 1

" Quit when the only window open is NERDTree
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 2

" Neomake Configuration
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
if exists(':Neomake')
  autocmd BufWritePost,BufEnter * Neomake
endif
let g:neomake_tex_pdflatex_maker = {
    \ 'exe': 'pdflatex',
    \ 'args': ['-interaction=batchmode'],
    \ }
let g:neomake_tex_enabled_makers=['chktex', 'pdflatex']
let g:neomake_verbose=0

" Deoplete Configuration
let g:deoplete#enable_at_startup = 1
set completeopt=longest,menuone

" SuperTab Configuration
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" vim-clang configuration
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'
let g:clang_verbose_pmenu=1
let g:clang_cpp_completeopt='menuone,noinsert'
let g:clang_format_auto=1
let g:clang_format_style='{BasedOnStyle: Google}'
