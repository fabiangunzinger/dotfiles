" .vimrc, fabian gunzinger

" plugins {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" activate vim-plug
call plug#begin()
Plug 'alfredodeza/pytest.vim'   " pytest support
Plug 'ggVGc/vim-fuzzysearch'   " fuzzy search
    let g:fuzzysearch_prompt = '/'
    let g:fuzzysearch_match_spaces = 1
Plug 'godlygeek/tabular'   " tabular formatting
Plug 'plasticboy/vim-markdown'   " markdown support
Plug 'hashivim/vim-terraform'   " terraform commands and syntax highlighting
Plug 'jremmen/vim-ripgrep'   " search
    let g:rg_command = 'rg --vimgrep -S'   " user smartcase by default
Plug 'itchyny/lightline.vim'   " statusbar
Plug 'junegunn/goyo.vim'   " distraction free writing
Plug 'junegunn/fzf.vim'   " fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy search
Plug 'machakann/vim-highlightedyank'   " highlight yanked region
Plug 'mileszs/ack.vim'   " faster grep alternative
Plug 'nelstrom/vim-visual-star-search'   " make * search for visual selection
Plug 'stefandtw/quickfix-reflector.vim'   " use quickfix for bulk change/replace
Plug 'SirVer/ultisnips'   " snippets engine
Plug 'honza/vim-snippets'   " snippets
Plug 'tpope/vim-abolish'   " powerful substitution and case conversions
Plug 'tpope/vim-commentary'   " commenting
Plug 'tpope/vim-eunuch'   " unix shell commands
Plug 'tpope/vim-fugitive'   " git integration
Plug 'tpope/vim-obsession'   " session management
Plug 'tpope/vim-repeat'   " use . after plugin map
Plug 'tpope/vim-surround'   " surround shortcuts
Plug 'tpope/vim-unimpaired'   " complementary pairs of mappings
Plug 'tpope/vim-vinegar'   " complement to netrw file system navigation
Plug 'wincent/command-t'   " fuzzy file finder
Plug 'psliwka/vim-smoothie'   " smooth scrolling
" Plug 'jpalardy/vim-slime'   " repl interaction support
    " let g:slime_target = "vimterminal"
Plug 'altercation/vim-colors-solarized'   " colorscheme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}   " syntax highlighting

Plug 'psf/black', { 'branch': 'stable' }   " black python formatting
Plug 'jeetsukumaran/vim-pythonsense'   " python text objects
Plug 'Vimjas/vim-python-pep8-indent'   " pep8 style indentation

Plug 'lervag/vimtex'   " latex support
call plug#end()

" Use `:PlugInstall` and `:PlugClean` as needed.


" general {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype detection
filetype plugin on			            " enable filetype plugins
filetype indent on                      " enable filetype indent

" misc.
set history=5000                        " lines to remember
set encoding=utf8                       " standard encoding
set backspace=indent,eol,start          " powerful backspace in insert mode
set spelllang=en_gb                     " spell checker uses british english
set hidden                              " switch away from edited buffers
set laststatus=2			            " always show statusline
" set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number                              " show line numers
set mouse=a                             " mouse support in all modes
set showcmd	                            " show partial command

" text wrapping
set wrap                            	" wrap long lines
set linebreak                           " don't break word
set nolist                              " list option breaks linebreak
" set colorcolumn=79                      " color last column
set textwidth=79                        " wrap text at specified column

" splits
set splitright                          " new vertical split on the right
set splitbelow                          " new horizontal split below

" tab stops
set expandtab                           " tabs are spaces
set shiftwidth=4                        " spaces for autoindent
set tabstop=4                           " spaces per <tab> in file
set softtabstop=4                       " spaces per <tab> while editing

" colors and fonts
syntax enable                           " syntax highlighting
set background=dark                     " dark background
colorscheme solarized                   " custom colorscheme
let python_highlight_all=1

" python interpreter
" use dedicated virtual env as nvim intrpreter (:h python3_host_prog)
let g:python3_host_prog='/Users/fgu/miniconda3/envs/nvim/bin/python'

" remove vertical split column highlight
" only fillchar vert default | is shows
highlight VertSplit ctermbg=NONE


" search {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " case insensitive search...
set smartcase                           " ... except when capitals used
set hlsearch                            " highlight search results
set incsearch                           " incremental result highlight
set infercase                           " adapt change for autocomplete

" Ignore compiled files for filcard expansion and search
set wildignore=*.pyc,*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" netrw settings
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 30


" mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" letters to keep free
" letter    | purpose
" t,b       | command-t search

" ~~~ new and experimental ~~~

" change windows quickly
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" turn off highlighting
noremap <nowait><leader><leader> :nohlsearch<cr>

" easily open and close quickfix window
nnoremap <silent><leader>cc :cclose<cr>
nnoremap <silent><leader>co :copen<cr>

" delete to end of line in insert mode
inoremap <c-l> <c-o>D


" ~~~ permanent ~~~

let mapleader = ','

" leave insert mode
inoremap jk <esc>

" exit terminal mode
tnoremap jk <c-\><c-n>

" abort (search) command
cnoremap jk <C-c>

" abort operator-pending command
onoremap jk <esc>

" make Y behave like C and D (see `h: Y`)
map Y y$

" write buffer
nnoremap <leader>w :w<cr>

" edit alternate file
nnoremap <silent><leader>a :e#<cr>

" move visual-line-wise
nnoremap j gj
nnoremap k gk

" open files from same directory as current buffer
" ew is for open (edit) new file in window
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :edit %%
map <leader>ev :vsplit %%
map <leader>et :tabedit %%

" make and repeat substitution with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" switch textwrap on and off (following unimpaired mappings)
nnoremap [ot :set textwidth=80<cr>
nnoremap ]ot :set textwidth=0<cr>

" print markdown headings
nnoremap <leader>mh :g/^#<space><cr>
nnoremap <leader>mhh :g/^#<cr>

" line numbers
nnoremap <silent> <leader>n :setlocal number!<cr>
nnoremap <silent> <leader>nr :setlocal relativenumber!<cr>

" distraction free writing
nnoremap <silent> <leader>dw :Goyo<cr>

" source vimrc
map <silent> <leader>Sv :write<cr>:source $MYVIMRC<cr>zazz
map <silent> <leader>sv :write<cr>:source $MYVIMRC<cr>

" open files
map <silent><leader>fvr :edit $MYVIMRC<cr>
map <silent><leader>fvvr :vsplit $MYVIMRC<cr>
map <silent><leader>fve :edit ~/dev/projects/blog/_posts/2021-03-27-vim.md<cr>
map <silent><leader>fre :edit ~/dev/projects/blog/_posts/2021-09-11-regex.md<cr>
map <silent><leader>fmf :edit ~/dev/projects/blog/_posts/2021-04-29-makefiles.md<cr>
map <silent><leader>ffb :edit ~/dev/projects/dotfiles/latex/fabib.bib<cr>
map <silent><leader>fbr :edit ~/dev/projects/dotfiles/.bashrc<cr>
map <silent><leader>fli :edit ~/dev/projects/blog/_posts/2021-02-08-linux.md<cr>

" run current file in python
nnoremap <leader>rp :w<cr>:!python %<cr>
nnoremap <leader>rpm :w<cr>:!python -m %<cr>
nnoremap <leader>rpd :w<cr>:!python -m doctest %<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>
" below doesn't work, as it creates a conflict with pushed commit if pushed
" already. So I need to pull first and merge, then push.
" nnoremap <leader>gam :Git add --all \| Git commit --amend --no-edit<cr>

" pytest
nnoremap <silent><leader>uff :Pytest file<cr>
nnoremap <silent><leader>uc :Pytest class<cr>
nnoremap <silent><leader>uf :Pytest function<cr>
nnoremap <silent><leader>um :Pytest method<cr>
nnoremap <silent><leader>un :Pytest next<cr>
nnoremap <silent><leader>up :Pytest previous<cr>
nnoremap <silent><leader>us :Pytest session<cr>
nnoremap <silent><leader>ufa :Pytest fails<cr>
"pytest
nnoremap <silent><leader>fo :Black<cr>

" semshi
nnoremap <silent> <leader>gu :Semshi goto unresolved<cr>
nnoremap <silent> <leader>ge :Semshi goto error<cr>

" close buffer but not window
nnoremap Bd :bp\|bd #<cr>

" quick formatting
" nnoremap <silent> <leader>tp gqap<cr>

" command-t
" nnoremap <c-cr> :CommandTOpen vs
" let g:CommandTCancelMap=['<c-c>', 'jk']



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

" ultisnip settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit = "vertical"   

" edit snippets
nnoremap <leader>es :UltiSnipsEdit<cr>
nnoremap <leader>esp :e /Users/fgu/.config/nvim/plugged/vim-snippets/UltiSnips/python.snippets<cr>
nnoremap <leader>est :e /Users/fgu/.config/nvim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>

" latex {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use skim as editor
let g:vimtex_view_method = 'skim'   " use skim as editor

" use neovim-remote as compiler
" installation info: https://github.com/lervag/vimtex/issues/1327
let g:vimtex_compiler_progname = $HOME.'/miniconda3/envs/nvim/bin/nvr' 

" markdown {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" disable ge command to keep it free for default movement behaviour
map <Plug> <Plug>Markdown_EditUrlUnderCursor

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
