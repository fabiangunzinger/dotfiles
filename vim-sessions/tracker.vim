let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/remote
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 vm-setup.sh
badd +11 docs/notes/meeting_notes.md
badd +79 tracker/data/fable/client_main.py
badd +12 tracker/data/fable/tests/test_fable.py
badd +1 Makefile
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
badd +1 tracker/data/appdata.py
badd +99 tracker/data/fable/user_master.py
argglobal
%argdel
edit tracker/data/helpers.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=expr
setlocal fde=SimpylFold#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
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
