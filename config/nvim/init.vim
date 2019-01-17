" vim: foldmethod=marker

" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" File browser
Plug 'scrooloose/nerdtree'

" Syntax highlighting
Plug 'noahfrederick/vim-noctu'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/SyntaxAttr.vim'

" Status Line
Plug 'vim-airline/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Languages
Plug 'rust-lang/rust.vim'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }

" Auto Complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'chrisbra/unicode.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Documentation Viewer
Plug 'Shougo/echodoc.vim'

call plug#end()

"}}}

" Vim Settings {{{

" Enable syntax highlighting
syntax on
silent! colorscheme noctu
highlight Comment cterm=italic

" Keep buffers open
set hidden

" Better command completion
set wildmenu
set wildmode=list:longest,full
set showcmd
set cmdheight=2

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

" Add command for setting tab width
set expandtab
function! SetTab(n)
  let &shiftwidth=a:n
  let &tabstop=a:n
  let &softtabstop=a:n
endfunction
command! -nargs=1 Tab call SetTab(<args>)

" Use 2 space tabs
call SetTab(2)

" Always display status line
set laststatus=2

" Ask about unsaved changes
set confirm

" No bell
set visualbell
set t_vb=

" Enable mouse support
set mouse=a

" Display cursor position
set ruler

" Display line numbers
set number

" Use system clipboard
set clipboard=unnamed

" Store swap and backup files in ~/.local/share/nvim
silent !mkdir -p ~/.local/share/nvim/swap > /dev/null 2>&1
set dir=~/.local/share/nvim/swap//,.
silent !mkdir -p ~/.local/share/nvim/backup > /dev/null 2>&1
set backupdir=~/.local/share/nvim/backup//,.

" Always Show Sign Column
augroup sign_group
    au BufWinEnter * sign define empty_sign
    au BufWinEnter * exe "sign place 1337 line=1 name=empty_sign buffer=" . bufnr('%')
augroup END

" }}}

" Keymaps {{{

mapclear
let mapleader=","

" Colemak: Movement keys
nnoremap n j|xnoremap n j|vnoremap n j|onoremap n j
nnoremap e k|xnoremap e k|vnoremap e k|onoremap e k
nnoremap i l|xnoremap i l|vnoremap i l|onoremap i l

" Colemak: Switch panes using ctrl-{h,n,e,i}
nnoremap <c-h> <c-w>h
nnoremap <c-n> <c-w>j
nnoremap <c-e> <c-w>k
nnoremap <c-i> <c-w>l
nnoremap <c-w>n <c-w>j
nnoremap <c-w>e <c-w>k
nnoremap <c-w>i <c-w>l

" On OSX, ctrl-h is remmapped to backspace
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ 'Darwin\n'
    nnoremap <bs> <c-w>h
  endif
endif

" Colemak: Use r for 'inside' operations insted since i is now a movement key
onoremap r i

" Colemak: Use s for insert since i is now a movement key
nnoremap s i
nnoremap S I

" Colemak: Set t to append so that it matches s
nnoremap t a
nnoremap T A

" Colemak: Remap j to t since j is not used and t has been remapped
nnoremap j t
nnoremap J T

" Colemak: Use k for searching since n is now a movement key
nnoremap k n
nnoremap K N

" Colemak: Move faster by holding shift
nnoremap H 10h|xnoremap H 10h|vnoremap H 10h|onoremap H 10h
nnoremap N 10j|xnoremap N 10j|vnoremap N 10j|onoremap N 10j
nnoremap E 10k|xnoremap E 10k|vnoremap E 10k|onoremap E 10k
nnoremap I 10l|xnoremap I 10l|vnoremap I 10l|onoremap I 10l

" Colemak: Map m to merge lines since J is now used to move faster
nnoremap m J

" Colemak: Map b to set (book)mark since m is now used to merge lines
nnoremap b m

" Shift U for redo to match u for undo
nnoremap U <c-r>

" Shift Q to replay a macro to match q for record macro
nnoremap Q @

" Buffer management
nnoremap <leader>i :bn<Return>
nnoremap <leader>h :bp<Return>
nnoremap <leader>d :bp\|bd #<Return>
nnoremap <leader>D :bd!<Return>

" Ctrl-P like search using FZF
nnoremap <leader>p :FZF<Return>

" Clear search using leader s
nnoremap <leader>s :let @/ = ""<Return>

" When in diff mode use leader o to accept our copy
nnoremap <leader>o :diffput<Return>:diffupdate<Return>
xnoremap <leader>o :diffput<Return>:diffupdate<Return>

" When in diff mode use leader t to accept their copy
nnoremap <leader>t :diffget<Return>:diffupdate<Return>
xnoremap <leader>t :diffget<Return>:diffupdate<Return>

" }}}

" Plugin Configuration {{{

" Rainbow Configuration
let g:rainbow_conf = {
  \ 'guifgs': [6, 1],
  \ 'ctermfgs': [6, 1],
  \ 'operators': '_,_',
  \ 'parentheses': [
  \   'start=/(/ end=/)/ fold',
  \   'start=/\[/ end=/\]/ fold',
  \   'start=/{/ end=/}/ fold'
  \ ],
  \ 'separately': {
  \   '*': {},
  \   'cpp': {
  \     'parentheses': [
  \       'start=/(/ end=/)/ fold',
  \       'start=/\[/ end=/\]/ fold',
  \       'start=/{/ end=/}/ fold',
  \       'start=/</ end=/>/ fold'
  \     ],
  \   },
  \ } }
let g:rainbow_active = 1

" NERDTree Configuration
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

" FZF Configuration
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 2

" SuperTab Configuration
let g:SuperTabDefaultCompletionType = "<c-n>"

" UltiSnips Configuration
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

" Language Server Configuration
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls'],
  \ 'rust': ['rls'] }
au BufEnter *.py,*.rs LanguageClientStart
let g:LanguageClient_hoverPreview = 'Never'

" Deoplete Settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
set completeopt=menuone,noinsert,noselect

" }}}
