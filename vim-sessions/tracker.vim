let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/remote_projects
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
set stal=2
tabnew
tabnew
tabrewind
edit vm-setup.sh
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt docs/notes/aws.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 12 - ((11 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 013|
tabnext
edit tracker/data/fable/merchant_hierarchy.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 80 + 68) / 136)
exe '2resize ' . ((&lines * 28 + 29) / 59)
exe 'vert 2resize ' . ((&columns * 55 + 68) / 136)
exe '3resize ' . ((&lines * 27 + 29) / 59)
exe 'vert 3resize ' . ((&columns * 55 + 68) / 136)
argglobal
balt tracker/data/fable/fable.py
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 26 - ((25 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 027|
wincmd w
argglobal
if bufexists("tracker/data/fable/tests/test_fable.py") | buffer tracker/data/fable/tests/test_fable.py | else | edit tracker/data/fable/tests/test_fable.py | endif
balt Makefile
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 27 - ((26 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 025|
wincmd w
argglobal
if bufexists("Makefile") | buffer Makefile | else | edit Makefile | endif
balt tracker/data/fable/fable.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 46 - ((22 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 46
normal! 04|
wincmd w
exe 'vert 1resize ' . ((&columns * 80 + 68) / 136)
exe '2resize ' . ((&lines * 28 + 29) / 59)
exe 'vert 2resize ' . ((&columns * 55 + 68) / 136)
exe '3resize ' . ((&lines * 27 + 29) / 59)
exe 'vert 3resize ' . ((&columns * 55 + 68) / 136)
tabnext
edit docs/notes/meeting_notes.md
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
exe 'vert 1resize ' . ((&columns * 80 + 68) / 136)
exe 'vert 2resize ' . ((&columns * 55 + 68) / 136)
argglobal
balt docs/notes/meeting_notes.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0215|
wincmd w
argglobal
if bufexists("docs/notes/aws.md") | buffer docs/notes/aws.md | else | edit docs/notes/aws.md | endif
balt docs/notes/meeting_notes.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 80 + 68) / 136)
exe 'vert 2resize ' . ((&columns * 55 + 68) / 136)
tabnext 2
set stal=1
badd +1 vm-setup.sh
badd +25 tracker/data/fable/fable.py
badd +1 docs/notes/meeting_notes.md
badd +1 docs/notes/aws.md
badd +1 tracker/data/fable/tests/test_fable.py
badd +16 Makefile
badd +29 infra/tte-vm.tf
badd +1 tracker/data/fable/client_main.py
badd +1 tracker/data/config.py
badd +1 tracker/data/ons/ons.py
badd +17 tracker/data/ons/tests/test_ons.py
badd +26 tracker/data/fable/merchant_hierarchy.py
badd +56 tracker/data/helpers.py
badd +1 infra/terraform.tfstate.backup
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
