set t_Co=256
set incsearch
set hlsearch

" Display max width column
set colorcolumn=81

" Setup line number
set number

" Show tab and space
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

" Set tab as 4 spaces
set tabstop=4

" Human autocomplete mode
set wildmode=longest,list
set wildignorecase

" Setup buffer copy
vmap y :'<,'> w! /tmp/vimtmp<CR>
vmap x :'<,'> w! /tmp/vimtmp<CR>:'<,'> d<CR>
nmap p :r /tmp/vimtmp<CR>

vmap <C-l> :'<,'>norm i//<CR>
vmap <S-l> :'<,'>norm xx<CR>

command! FindTags call Find_tags()
fun! Find_tags()
  " set global variable tags
  let &tags = system("~/.vim/find_near_tags.sh")
  " print variable: set tags?
endfun

command! Gofmt % ! gofmt
command! Clang % ! clang-format
command! ReloadCfg so $HOME/.vimrc

" ----
" Colors setup
" ----

" Colors
syntax on
color koehler
hi User1 ctermfg=255 ctermbg=31 cterm=bold
hi User2 ctermfg=31 ctermbg=232
hi User3 ctermfg=245 ctermbg=232
hi User4 ctermbg=232 ctermfg=237
hi User5 ctermbg=237 ctermfg=245
hi User6 ctermbg=237 ctermfg=7
hi User7 ctermbg=7 ctermfg=232 cterm=bold
hi User8 ctermfg=22 ctermbg=118 cterm=bold
hi User9 ctermfg=118 ctermbg=31 cterm=bold
hi C1 ctermfg=232 ctermbg=31
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

" --- Top line ---

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  return bufname(buflist[tabpagewinnr(a:n) - 1])
endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#C1#%1*'
    else
      let s .= '%3* '
    endif

    " number of pane
    let s .= ' ' . (i+1) . ' '
    " filename
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i + 1 == tabpagenr()
      let s .= '%2*'
    else
      let s .= ' '
    endif
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%3*'

  return s
endfunction

set showtabline=1
set tabline=%!MyTabLine()

" --- Bottom line ---

" Always show statusline
set laststatus=2

" Statusline
set statusline=
set statusline+=%{ChangeColors()}
set statusline+=%8*
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%9*
set statusline+=%1*\ 
set statusline+=%F%{ReadOnly()}%{Modified()} " Show file path
set statusline+=\ %2*
set statusline+=%= " Left/Rigth separator
set statusline+=%3*
set statusline+=%y " Show filetype
set statusline+=\ %3*\ 
set statusline+=%{ShowFileSize()} " Show filesize
set statusline+=\ %4*%5*\ 
set statusline+=%l/%L(%p%%) " Show cursor line position
set statusline+=\ %6*%7*\ 
set statusline+=%c\  " Show cursor column position


" Stautsline functions
let g:currentmode={
    \ 'n'      : 'NORMAL ',
    \ 'i'      : 'INSERT ',
    \ 'v'      : 'VISUAL ',
    \ 'V'      : 'VISUAL ',
    \ ''     : 'VISUAL ',
    \ 'R'      : 'REPLACE ',
    \ 'c'      : 'NORMAL ',
    \
    \ 'no'     : 'N·Operator Pending ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'Rv'     : 'V·Replace ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}

function! ReadOnly()
  if &readonly || !&modifiable
    return ' '
  else
    return ''
endfunction

function! Modified()
  if &modified
    return ' [+]'
  else
    return ''
endfunction

function! ShowFileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ChangeColors()
  if (mode() =~# '\v(n|c)')
    exe 'hi! User8 ctermfg=22 ctermbg=118 cterm=bold'
    exe 'hi! User9 ctermfg=118 ctermbg=31 cterm=bold'
  elseif (mode() =~# '\v(i)')
    exe 'hi! User8 ctermfg=31 ctermbg=255 cterm=bold'
    exe 'hi! User9 ctermfg=255 ctermbg=31 cterm=bold'
  elseif (mode() =~# '\v(v|V|)')
    exe 'hi! User8 ctermfg=238 ctermbg=208 cterm=bold'
    exe 'hi! User9 ctermfg=208 ctermbg=31 cterm=bold'
  elseif (mode() =~# '\v(R)')
    exe 'hi! User8 ctermfg=255 ctermbg=160 cterm=bold'
    exe 'hi! User9 ctermfg=160 ctermbg=31 cterm=bold'
  else
    exe 'hi! User8 ctermfg=232 ctermbg=196 cterm=bold'
    exe 'hi! User9 ctermfg=196 ctermbg=31 cterm=bold'
  endif
  return ''
endfunction

" ----
" Snippets
" ----

fun! Stddbg()
  r ! echo '\#define __D_INIT__'
  r ! echo '\#include "/home/extern/debug_header.h" /* DEBUG */'
endfun

fun! Kerndbg()
  r ! echo '/* DEBUG */'
  r ! echo '\#define D_ARGS const char* func, int line, const char* file'
  r ! echo '\#define D_INFO __FUNCTION__, __LINE__, __FILE__'
  r ! echo 'enum{L_RAW=0,L_DEBUG=64,L_EXTRA=256,S_TR_ENT=128|1,S_TR_EXT=128|2,S_TR_ERR=128|3};'
  r ! echo 'void dtrace(D_ARGS, int opt, const char *format, ...) {'
  r ! echo 'void print_information(D_ARGS){dtrace(D_INFO,L_RAW," \\x1b[33m[\%s():\%d] - \%s\\x1B[0m\\n",func,line,file);}'
  r ! echo 'void print_indent(int o){static int indent=0,i;if(o==S_TR_EXT||o==S_TR_ERR){if(indent)indent--;}for(i=0;i<indent;i++){dtrace(D_INFO,L_RAW,"\\x1B[36m|  \\x1B[0m");}'
  r ! echo 'if(o==S_TR_ENT)indent++;'
  r ! echo '}'
  r ! echo 'const char *get_prefix(int o) {'
  r ! echo 'if(o==S_TR_ENT)return"\\x1B[32mENT\\x1B[0m";if(o==S_TR_EXT)return"\\x1B[35mEXT\\x1B[0m";if(o==S_TR_ERR)return"\\x1B[31mERR\\x1B[0m";if(o==L_DEBUG)return"DEBUG: ";return"NaN";'
  r ! echo '}'
  r ! echo 'if (opt\!=L_RAW){print_indent(opt);printk("\%s",get_prefix(opt));}'
  r ! echo 'va_list a;va_start(a,format);vprintk(format,a);va_end(a);'
  r ! echo 'if (opt\!=L_RAW){print_information(func,line,file);}'
  r ! echo '}'
  r ! echo '/* DEBUG */'
endfun

fun! Dprint()
  r ! echo 'dtrace(D_INFO, L_DEBUG, ""); /* DEBUG */'
endfun

fun! Log_in()
  r ! echo 'dtrace(D_INFO, S_TR_ENT, ""); /* DEBUG */'
endfun

fun! Log_out()
  r ! echo 'dtrace(D_INFO, S_TR_EXT, ""); /* DEBUG */'
endfun

fun! Log_err()
  r ! echo 'dtrace(D_INFO, S_TR_ERR, ""); /* DEBUG */'
endfun

