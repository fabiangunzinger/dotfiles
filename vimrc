" fabian gunzinger's vimrc.

" plugins (using vim-plug) {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'              
Plug 'junegunn/goyo.vim'
Plug 'sjl/gundo.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/seoul256.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'ivanov/vim-ipython'
Plug 'rakr/vim-one'
Plug 'jpalardy/vim-slime'

" Plug 'garbas/vim-snipmate'
Plug 'mg979/vim-visual-multi'
" Plug 'ycm-core/YouCompleteMe'
call plug#end()


" vim-slime  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"


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


" user interface {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=80                      " color 80th column
" set textwidth=80                        " break long lines
set wrap                            	" wrap long lines

set hidden                              " hide unloaded buffers
set laststatus=2			            " always show statusline
set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number				                " show line numers
set mouse=a
" set relativenumber                      " relative line numers
set ruler                           	" show curser position
set showcmd			                    " show partial command
set wildmenu                        	" turn wild menu on


" mappings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader mappings
" d distraction free writing
" g git
" n nerdtree
" p plugins
" s saving session
" t tabs
" u gundo tree
" v vimrc
" w writing file

" set leader
let mapleader=','

" distraction free writing
nnoremap <leader>d :Goyo<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>


" nerdtree
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nv :NERDTreeToggleVCS<cr>
nnoremap <leader>nf :NERDTreeFocus<cr>

" plugins
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>t<leader> :tabnext<cr>
" Open new tab with current buffer's path
map <leader>tp :tabedit <C-r>=expand("%:p:h")<cr>/

" save file
nmap <leader>w :w!<cr>

" save session
nnoremap <leader>s :mksession<cr>

" toggle gundo
nnoremap <leader>u :GundoToggle<cr>

" edit and source vimrc
map <leader>ve :vsp $MYVIMRC<cr>
map <leader>vs :w<cr>:source $MYVIMRC<cr>

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
map <leader><space> :nohlsearch<cr>


" colors and fonts {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                           " syntax highlighting
set background=dark
colorscheme solarized                   " custom colorscheme
" colorscheme one


" status bar colorscheme
let g:lightline = {'colorscheme': 'solarized'}
" tabs {{{1
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


" spelling {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle spell checker
map <leader>ss :setlocal spell!<cr>

" move to next word
map <leader>sn ]s                  

" move to previous word
map <leader>sp [s                  

" add word as good
map <leader>sa zg                  

" show suggestions for word
map <leader>ss z=                  


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

" file settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=1
" vim:foldmethod=marker foldlevel=0
