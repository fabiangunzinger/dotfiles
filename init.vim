" .vimrc, fabian gunzinger

" plugins {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" activate vim-plug
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'   " fuzzy search
Plug 'godlygeek/tabular'   " tabular formatting
Plug 'itchyny/lightline.vim'   " statusbar
Plug 'junegunn/goyo.vim'   " distraction free writing
Plug 'machakann/vim-highlightedyank'   " highlight yanked region
Plug 'mileszs/ack.vim'   " faster grep alternative
Plug 'nelstrom/vim-visual-star-search'   " make * search for visual selection
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
Plug 'psliwka/vim-smoothie'   " smooth scrolling
Plug 'jpalardy/vim-slime'   " repl interaction support
    let g:slime_target = "vimterminal"
Plug 'altercation/vim-colors-solarized'   " colorscheme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}   " syntax highlighting
Plug 'jeetsukumaran/vim-pythonsense'   " python text objects
Plug 'Vimjas/vim-python-pep8-indent'   " pep8 style indentation
Plug 'lervag/vimtex'   " latex support
call plug#end()

nnoremap <leader>pi :write<cr>:source $MYVIMRC<cr>:PlugInstall<cr>
nnoremap <leader>pc :write<cr>:source $MYVIMRC<cr>:PlugClean<cr>


" general {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on			            " enable filetype plugins
filetype indent on                      " enable filetype indent

" misc.
set history=5000                        " lines to remember
set encoding=utf8                       " standard encoding
set backspace=indent,eol,start          " powerful backspace in insert mode
set spelllang=en_gb                     " spell checker uses british english
set hidden                              " switch away from edited buffers
set laststatus=2			            " always show statusline
set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number                              " show line numers
set mouse=a                             " mouse support in all modes
set showcmd	                            " show partial command

" text wrapping
set wrap                            	" wrap long lines
set linebreak                           " don't break word
set nolist                              " list option breaks linebreak
set colorcolumn=80                      " color 80th column
set textwidth=80                        " wrap at 80th colomn

" splits
set splitright                          " new vertical split on the right
set splitbelow                          " new horizontal split below

" tab stops
set expandtab                           " tabs are spaces
set shiftwidth=4                        " spaces for autoindent
set tabstop=4                           " spaces per <tab> in file
set softtabstop=4                       " spaces per <tab> while editing

" python interpreter
" use dedicated virtual env as nvim intrpreter (:h python3_host_prog)
let g:python3_host_prog='/Users/fgu/miniconda3/envs/nvim/bin/python'

" search {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " case insensitive search...
set smartcase                           " ... except when capitals used
set hlsearch                            " highlight search results
set incsearch                           " incremental result highlight
set infercase                           " adapt change for autocomplete

" Ignore compiled files for filcard expansion and search
set wildignore=*.pyc,*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" turn off highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" colors and fonts {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                           " syntax highlighting
let python_highlight_all=1
set background=dark                     " dark background
colorscheme solarized                   " custom colorscheme

" vertical split color
highlight VertSplit guifg=Red guibg=Blue ctermfg=6 ctermbg=0

" remove split separator fill characters
set fillchars=""


" mappings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leave insert mode
inoremap jk <esc>

" abort (search) command
cnoremap jk <C-c>

" abort operator-pending command
onoremap jk <esc>

" make Y behave like C and D (see `h: Y`)
map Y y$

" move visual-line-wise
nnoremap j gj
nnoremap k gk

" conveniently switch buffer (list open ones and type `:b `
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>vb :ls<cr>:vert sb<space>

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
map <leader>ev :vsplit %%
map <leader>et :tabedit %%

" make and repeat substitution with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" distraction free writing
nnoremap <silent> <leader>w :Goyo<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>

" source vimrc
map <leader>sv :write<cr>:source $MYVIMRC<cr>zazz
map <leader>Sv :write<cr>:source $MYVIMRC<cr>

" open files
map <silent> <leader>fvr :edit $MYVIMRC<cr>
map <silent> <leader>fvv :vsplit $MYVIMRC<cr>
map <silent> <leader>fve :edit ~/dev/projects/blog/_posts/2021-03-27-vim-essentials.md<cr>
map <silent> <leader>fre :edit ~/dev/projects/blog/_posts/2021-08-26-regex-essentials.md<cr>
map <silent> <leader>fmf :edit ~/dev/projects/blog/_posts/2021-04-29-makefiles.md<cr>
map <silent> <leader>ffb :edit ~/dev/projects/dotfiles/latex/fabib.bib<cr>

" print markdown headings
nnoremap <leader>mh :g/^#<space><cr>
nnoremap <leader>mhh :g/^#<cr>

" run current file in python
nnoremap <leader>rp :w<cr>:!python %<cr>
nnoremap <leader>rpd :w<cr>:!python -m doctest %<cr>

" close buffer but not window split
" command Bd bp\|bd\#


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
