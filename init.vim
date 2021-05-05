" .vimrc, fabian gunzinger

" plugins {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" activate vim-plug
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'   " fuzzy search
Plug 'itchyny/lightline.vim'   " statusbar
Plug 'altercation/vim-colors-solarized'   " colorscheme
Plug 'tpope/vim-commentary'   " commenting
Plug 'tpope/vim-eunuch'   " unix shell commands
Plug 'tpope/vim-fugitive'   " git integration
Plug 'tpope/vim-obsession'   " session management
Plug 'tpope/vim-repeat'   " use . after plugin map
Plug 'tpope/vim-surround'   " surround shortcuts
Plug 'tpope/vim-unimpaired'   " complementary pairs of mappings
Plug 'tpope/vim-vinegar'   " complement to netrw file system navigation
Plug 'SirVer/ultisnips'   " snippets engine
Plug 'lervag/vimtex'   " latex support

" Plug 'hashivim/vim-terraform'
" Plug 'ivanov/vim-ipython'
" Plug 'jpalardy/vim-slime'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'mg979/vim-visual-multi'
" Plug 'mhinz/vim-startify'
" Plug 'mileszs/ack.vim'
" Plug 'nvie/vim-flake8'
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
" Plug 'lervag/vimtex'   " latex support
" Plug 'eslint/eslint' " js linter
" Plug 'pangloss/vim-javascript'   " better js indenting
" Plug 'rakr/vim-one'   " colorscheme
" Plug 'sheerun/vim-polyglot'
" Plug 'tmhedberg/SimpylFold'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'ervandew/supertab'   " make ultisnip and ycm compatible
call plug#end()

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

" general {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500                         " lines to remember
set encoding=utf8                       " standard encoding
filetype plugin on			            " enable filetype plugins
filetype indent on                      " enable filetype indent
set backspace=indent,eol,start          " more powerful backspace

set hidden                              " switch away from edited buffers
set laststatus=2			            " always show statusline
set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number				                " show line numers
set mouse=a                             " mouse support in all modes
set showcmd			                    " show partial command
set wildmenu                        	" turn wild menu on

" text wrapping
set wrap                            	" wrap long lines
set linebreak                           " don't break word
set nolist                              " list option breaks linebreak
set colorcolumn=80                      " color 80th column
set textwidth=80                        " wrap at 80th colomn

" tab stops
set expandtab                           " tabs are spaces
set shiftwidth=4                        " spaces for autoindent
set tabstop=4                           " spaces per <tab> in file
set softtabstop=4                       " spaces per <tab> while editing

" splits
set splitright                          " new vertical split on the right
set splitbelow                          " new horizontal split below

" Ignore compiled files for filcard expansion and search
set wildignore=*.pyc,*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" python interpreter
" following recommendation in h: python3_host_prog, I 
" created a separate virtual env for nvim and explicitly
" use that python version as nvim's interpreter.
let g:python3_host_prog='/Users/fgu/miniconda3/envs/nvim/bin/python'

" search {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " case insensitive search...
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

" vertical split color
highlight VertSplit guifg=Red guibg=Blue ctermfg=6 ctermbg=0

" remove split separator fill characters
set fillchars=""


" mappings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make Y behave like C and D (see `h: Y`)
map Y y$

" change windows 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
" Open new tab with current buffer's path
map <leader>tp :tabedit <C-r>=expand("%:p:h")<cr>/

" open files from same directory as current buffer
" ew is for open (edit) new file in window
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :edit %%
map <leader>es :split %%
map <leader>ev :vsplit %%
map <leader>et :tabedit %%

" distraction free writing
nnoremap <leader>df :Goyo<cr>

" toggle spell checker
map <leader>sc :setlocal spell!<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>

" edit and source vimrc
map <silent> <leader>ve :vsp $MYVIMRC<cr>
map <leader>vs :source $MYVIMRC<cr>

" more accessible escape
inoremap jk <esc>

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


" folding {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable                          " enable folding
" set foldmethod=indent                   " fold based on indent level
set foldlevelstart=99                   " open file with all folds open

" toggle fold under cursor
nnoremap <space> za


" snippets {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use tab for expansion and movement
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" open editor in vertical split 
let g:UltiSnipsEditSplit = "vertical"   

" edit snippets
nnoremap <leader>se :UltiSnipsEdit<cr>


" latex {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimtex configuration
let g:vimtex_view_method = 'skim'

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





" archive {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" writing mode
" custom settings for writing mode
" function! GoyoEnterSettings()
"     set background=light
"     colorscheme seoul256-light
" endfunction
" function! GoyoLeaveSettings()
"     set background=dark
"     colorscheme solarized
" endfunction
" autocmd! User GoyoEnter :call GoyoEnterSettings()
" autocmd! User GoyoLeave :call GoyoLeaveSettings()


" file settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=1
" vim:foldmethod=marker:foldlevel=0
