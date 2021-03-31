let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/remote_projects
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 vm-setup.sh
badd +11 docs/notes/meeting_notes.md
badd +79 tracker/data/fable/client_main.py
badd +12 tracker/data/fable/tests/test_fable.py
badd +40 Makefile
badd +1 docs/notes/aws.md
badd +48 tracker/data/fable/merchant_hierarchy.py
badd +1 tracker/data/fable/fable.py
badd +29 infra/tte-vm.tf
badd +1 tracker/data/config.py
badd +81 tracker/data/ons/ons.py
badd +17 tracker/data/ons/tests/test_ons.py
badd +86 tracker/data/helpers.py
badd +1 infra/terraform.tfstate.backup
badd +1 tracker/data/mdb/mdb.py
badd +105 tracker/data/spending.py
badd +1 tracker/data/tester.py
badd +107 tracker/data/database.py
badd +1 consumption.py
badd +1 appdata.py
badd +21 tracker/data/appdata.py
badd +99 tracker/data/fable/user_master.py
argglobal
%argdel
set stal=2
edit tracker/data/fable/fable.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 83 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 154 + 119) / 238)
argglobal
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
75
normal! zo
let s:l = 103 - ((18 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
103
normal! 0
wincmd w
argglobal
if bufexists("tracker/data/appdata.py") | buffer tracker/data/appdata.py | else | edit tracker/data/appdata.py | endif
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
10
normal! zo
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 83 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 154 + 119) / 238)
tabedit tracker/data/mdb/mdb.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 201 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 36 + 119) / 238)
argglobal
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
39
normal! zo
let s:l = 3 - ((2 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 09|
wincmd w
argglobal
if bufexists("tracker/data/helpers.py") | buffer tracker/data/helpers.py | else | edit tracker/data/helpers.py | endif
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 76 - ((8 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
76
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 201 + 119) / 238)
exe 'vert 2resize ' . ((&columns * 36 + 119) / 238)
tabedit Makefile
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 27 - ((19 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 05|
tabedit docs/notes/aws.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 157 - ((26 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
157
normal! 095|
tabnext 1
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOS
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
