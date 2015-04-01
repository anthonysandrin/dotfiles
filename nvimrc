" Start NeoBundle
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))

NeoBundle 'shougo/neobundle.vim'

" Movement
NeoBundle 'lokaltog/vim-easymotion'

" Colors
NeoBundle 'noahfrederick/vim-noctu'
NeoBundle 'kien/rainbow_parentheses.vim'

" File Navigation
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'

" Language Support
NeoBundle 'wlangstroth/vim-racket'
NeoBundle 'wting/rust.vim'
NeoBundle 'cespare/vim-toml'

" Syntax checking
NeoBundle 'scrooloose/syntastic'

" Status Line
NeoBundle 'bling/vim-airline'

" Git Integration
NeoBundle 'tpope/vim-fugitive'

" Note Taking
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'

call neobundle#end()

" Check for updates
NeoBundleCheck

filetype plugin indent on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Syntax highlighting
" Requires the correct terminal color scheme
syntax on
colorscheme noctu

" Enable Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ [2,2],
    \ [3,3],
    \ [4,4],
    \ [5,5],
    \ [6,6],
    \ [8,8],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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

" Use 4 spaces for an indent
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

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

" Move swap/backup files to ~/.nvim
set dir=~/.nvim/swap//,.
set backupdir=~/.nvim/backup//,.

" Keymaps for colemak
mapclear
let mapleader=","
nnoremap <BS> <c-w>h
nnoremap n j|xnoremap n j|vnoremap n j|onoremap n j
nnoremap N J
nnoremap <c-n> <c-w>j
nnoremap <c-w>n <c-w>j
nnoremap e k|xnoremap e k|vnoremap e k|onoremap e k
nnoremap E K
nnoremap <c-e> <c-w>k
nnoremap <c-W>e <c-w>k
nnoremap i l|xnoremap i l|vnoremap i l|onoremap i l
nnoremap <c-i> <c-w>l
nnoremap <c-w>i <c-w>l
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
nnoremap ; :
nnoremap Q @
nnoremap <leader>i :bn<Return>
nnoremap <leader>h :bp<Return>
nnoremap <leader>d :bp\|bd #<Return>
nnoremap <leader>D :bd!<Return>
nnoremap <leader>p :CtrlP<Return>

inoremap <c-a> α
inoremap <c-w> ω
inoremap <c-\> λ

" Map EasyMotion to space
let g:EasyMotion_do_mapping = 0
nmap <Space> <Plug>(easymotion-s)

" Notes Directory
let g:notes_directories = ['~/.notes']

" NERDTree keymaps
let g:NERDTreeMapJumpFirstChild = "ge"
let g:NERDTreeMapJumpLastChild = "gn"
let g:NERDTreeMapToggleHidden = "H"
let g:NERDTreeMapOpenSplit = "S"
let g:NERDTreeMapOpenExpl = ""
let g:NERDTreeMouseMode = 2
let g:NERDTreeShowHidden = 1

" Open NERDTree automatically
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic Configuration
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Airline Configuration
let g:airline_theme='noctu'
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'

let s:zen = 0
function! ToggleZen()
    if s:zen  == 0
        let s:zen = 1
        set nonu
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        NERDTreeClose
    else
        let s:zen = 0
        set nu
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        NERDTree
    endif
endfunction

command! Zen call ToggleZen()
