" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'reasonml-editor/vim-reason-plus'

" Language Server
Plug 'neovim/nvim-lsp'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }

" Auto Complete
Plug 'ervandew/supertab'
Plug 'chrisbra/unicode.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Documentation Viewer
Plug 'Shougo/echodoc.vim'

" Project local configuration
Plug 'embear/vim-localvimrc'

" Autoformatting
Plug 'sbdchd/neoformat'

" Latex file editing
Plug 'lervag/vimtex'

call plug#end()
" }}}

" Vim {{{
" Enable unicode
set encoding=utf-8

" Enable syntax highlighting
syntax on

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

" Syntax Highlighting {{{
silent! colorscheme noctu
highlight Comment cterm=italic

" Lsp
hi LspDiagnosticsError ctermfg=1
hi LspDiagnosticsWarning ctermfg=3
hi LspDiagnosticInformation ctermfg=7 cterm=italic
hi LspDiagnosticHint ctermfg=2 cterm=italic
hi LspReferenceText ctermfg=7 cterm=italic
hi LspReferenceRead ctermfg=7 cterm=italic
hi LspReferenceWrite ctermfg=7 cterm=italic

" Fix filetype associations
augroup filetypedetect
    au! BufRead,BufNewFile *.cppm       setfiletype cpp
augroup END
" }}}

" Keymaps {{{
mapclear
let mapleader=","

" Colemak: Movement keys
noremap n j
noremap e k
noremap i l

" Colemak: Move faster by holding shift
noremap H 10h
noremap N 10j
noremap E 10k
noremap I 10l

" Colemak: Switch panes using ctrl-{h,n,e,i}
nnoremap <c-h> <c-w>h
nnoremap <c-n> <c-w>j
nnoremap <c-e> <c-w>k
nnoremap <c-i> <c-w>l
nnoremap <c-w>n <c-w>j
nnoremap <c-w>e <c-w>k
nnoremap <c-w>i <c-w>l

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

" Colemak: Map m to merge lines since N is now used to move faster
nnoremap m J

" Colemak: Map b to set (book)mark since m is now used to merge lines
nnoremap b m

" Shift U for redo to match u for undo
nnoremap U <c-r>

" Shift Q to replay a macro to match q for record macro
nnoremap Q @

" Press enter to save
nnoremap <Return> :w<Return>

" Buffer management
nnoremap <leader>f <cmd>Vex<Return>
nnoremap <leader>i :bn<Return>
nnoremap <leader>h :bp<Return>
nnoremap <leader>d :bp\|bd #<Return>
nnoremap <leader>D :bd!<Return>

" Ctrl-P like search using FZF
nnoremap <leader>p :FZF<Return>

" When in diff mode use leader o to accept our copy
noremap <leader>o :diffput<Return>:diffupdate<Return>

" When in diff mode use leader t to accept their copy
noremap <leader>t :diffget<Return>:diffupdate<Return>

nnoremap <silent> gb <C-o>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
" }}}

" Rainbow {{{
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
  \     ],
  \   },
  \ } }
let g:rainbow_active = 1
" }}}

" Netrw {{{
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_fastbrowse = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25


augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> i l
    noremap <buffer> I 10l
    setl bufhidden=wipe
endfunction
" }}}

" FZF {{{
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
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 2
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" UltiSnips {{{
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
" }}}

" localvimrc {{{
let g:localvimrc_persistent = 1
" }}}

" Neoformat {{{
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

let g:neoformat_enabled_javascript = []
" }}}

" Vimtex {{{
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_enabled = 0
" }}}

" Source init.lua {{{
lua require 'init'.init()
" }}}

" vim: foldmethod=marker
