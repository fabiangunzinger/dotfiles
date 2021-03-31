" fabian gunzinger's vimrc.

" plugins {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" i'm using vim-plug for plugin management
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'              
" Plug 'garbas/vim-snipmate'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'   " statusbar
Plug 'ivanov/vim-ipython'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mg979/vim-visual-multi'
" Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'ncm2/ncm2'   " code autocomplete
" Plug 'roxma/nvim-yarp'   " ncm dependency
" Plug 'ncm2/ncm2-bufword'   " ncm completion source
" Plug 'ncm2/ncm2-path'   " ncm completion source
" Plug 'ncm2/ncm2-github'   " ncm completion source
" Plug 'ncm2/ncm2-jedi'   " ncm completion source
" Plug 'ncm2/ncm2-ultisnips'   " ncm completion source
" Plug 'gaalcaras/ncm-R'   " ncm completion source
" Plug 'oncomouse/ncm2-biblatex'   " ncm completion source

Plug 'lervag/vimtex'   " latex support
Plug 'altercation/vim-colors-solarized'   " colorscheme
Plug 'preservim/nerdtree'   " explore filetree

" Plug 'eslint/eslint' " js linter
Plug 'pangloss/vim-javascript'   " better js indenting

Plug 'rakr/vim-one'   " colorscheme
Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'   " snippets engine
Plug 'honza/vim-snippets'   " snippets for engine
" Plug 'ervandew/supertab'   " make ultisnip and ycm compatible
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'   " commenting
Plug 'tpope/vim-eunuch'   " unix shell commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'   " session management
Plug 'tpope/vim-surround'   " surround shortcuts
" Plug 'ycm-core/YouCompleteMe'
call plug#end()

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

" status bar {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['gitbranch', 'readonly', 'filename', 'modified'] ] 
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

" code completion {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" set completeopt=noinsert,menuone,noselect   " completion behaviour
" set shortmess+=c                        " suppress warning messages



" snippets {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open editor in vertical split 
let g:UltiSnipsEditSplit = "vertical"   

" use tab for expansion and movement
let g:UltiSnipsExpandTrigger = '<S-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" edit snippets
nnoremap <leader>se :UltiSnipsEdit<cr>


" general {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500                         " lines to remember
set encoding=utf8                       " standard encoding
filetype plugin on			            " enable filetype plugins
filetype indent on                      " enable filetype indent
set backspace=indent,eol,start          " more powerful backspace
let g:gundo_prefer_python3 = 1          " make gundo use python3

" Enable persistent undo (can undo changes from previous sessions)
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile

" Ignore compiled files for filcard expansion and search
set wildignore=*.pyc,*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Python settings
let g:python3_host_prog='/Users/fgu/miniconda3/bin/python'

" user interface {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text wrapping
set wrap                            	" wrap long lines
set linebreak                           " don't break word
set nolist                              " list option breaks linebreak
set colorcolumn=80                      " color 80th column
set textwidth=80                        " wrap at 80th colomn

set clipboard=unnamed                   " allow copy/paste from system
set hidden                              " hide unloaded buffers
set laststatus=2			            " always show statusline
set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number				                " show line numers
set relativenumber                    " relative line numers
set mouse=a
set ruler                           	" show curser position
set showcmd			                    " show partial command
set wildmenu                        	" turn wild menu on

" splits
set splitright                          " new vertical split on the right
set splitbelow                          " new horizontal split below

" buffers {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delete current buffer wihtout closing window (by moving to previous)
" command Bd bp\|bd \#


" mappings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader mappings
" d distraction free writing
" g git
" n nerdtree
" p plugins
" t tabs
" u gundo tree
" v vimrc
" w writing file

" set leader
let mapleader=','

" cycle through numbering options
nnoremap <silent> <leader>r : call CycleNumbering()<cr>

" distraction free writing
nnoremap <leader>df :Goyo<cr>

" toggle spell checker
map <leader>sc :setlocal spell!<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>

" nerdtree
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nv :NERDTreeToggleVCS<cr>
nnoremap <leader>nf :NERDTreeFocus<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
" Open new tab with current buffer's path
map <leader>tp :tabedit <C-r>=expand("%:p:h")<cr>/

" save file
nmap <leader>w :w!<cr>

" toggle gundo
nnoremap <leader>gu :GundoToggle<cr>

" edit and source vimrc
map <silent> <leader>ve :vsp $MYVIMRC<cr>
map <leader>vs :source $MYVIMRC<cr>

" more accessible escape
inoremap jk <esc>

" move down and up by visual line
nnoremap j gj
nnoremap k gk

" change windows 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" bash-like commandline shortcuts
cnoremap <C-A> <home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>


" sessions {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_dir = '~/.vim/vim-sessions/'
" list *.vim files and then delete pattern so i can starty typing
let g:files_list = '*.vim<c-d><bs><bs><bs><bs><bs>'

" save session (override existing)
exec 'nnoremap <leader>ss :Obsession' . g:session_dir . g:files_list

" restore session (auto tracks changes if exited with !qa)
exec 'nnoremap <leader>sr :source' . g:session_dir . g:files_list


" git {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GitLazyPush()
    call inputsave()
    let msg = input("Commit message: ")
    call inputrestore()
    :Git add --all
    :execute ":Git commit -m ".'"'.msg.'"'
    :Git push   
endfunction


" search {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " case insensitive search
set smartcase                           " ... except when capitals used
set hlsearch                            " highlight search results
set incsearch                           " incremental result highlight

" turn off highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" colors and fonts {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                           " syntax highlighting
let python_highlight_all=1
set background=dark
colorscheme solarized                   " custom colorscheme
" colorscheme one

" vertical split color
highlight VertSplit guifg=Red guibg=Blue ctermfg=6 ctermbg=0

" remove split separator fill characters
set fillchars=""


" tab stops {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                           " tabs are spaces
set shiftwidth=4                        " spaces for autoindent
set tabstop=4                           " spaces per <tab> in file
set softtabstop=4                       " spaces per <tab> while editing


" folding {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable                          " enable folding
" set foldmethod=indent                   " fold based on indent level
set foldlevelstart=99                   " open file with all folds open

" toggle fold under cursor
nnoremap <space> za


" writing mode {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom settings for writing mode
function! GoyoEnterSettings()
    set background=light
    colorscheme seoul256-light
endfunction

function! GoyoLeaveSettings()
    set background=dark
    colorscheme solarized
endfunction

autocmd! User GoyoEnter :call GoyoEnterSettings()
autocmd! User GoyoLeave :call GoyoLeaveSettings()


" nerdtree {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" helpers {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CycleNumbering()
    if exists('+relativenumber')
        execute {
                    \ '00': 'set relativenumber   | set number',
                    \ '01': 'set norelativenumber | set number',
                    \ '10': 'set norelativenumber | set nonumber',
                    \ '11': 'set norelativenumber | set number'}[&number . &relativenumber]
    else
        " No relative numbering, toggle numbers on and off
        set number!<cr>
    endif
endfunction

" file settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=1
" vim:foldmethod=marker:foldlevel=0
