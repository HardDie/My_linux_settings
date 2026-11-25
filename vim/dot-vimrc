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

" Human autocomplete mode
set wildmode=longest,list
set wildignorecase

" Tab size 4 spaces
set tabstop=4
set shiftwidth=4

let s:is_mac = has('mac') || has('macunix')
let s:is_wayland = !empty($WAYLAND_DISPLAY) && executable('wl-copy')
let s:is_x11 = !empty($DISPLAY) && executable('xclip')

function CopyToClipboard() range
  let l:text = shellescape(join(getline(a:firstline, a:lastline), "\n"))

  if s:is_mac
    let l:cmd = 'echo -nE ' . l:text . ' | pbcopy'
  elseif s:is_wayland
    let l:cmd = 'echo -nE ' . l:text . ' | wl-copy'
  elseif s:is_x11
    let l:cmd = 'echo -nE ' . l:text . ' | xclip -selection clipboard'
  else
    echomsg 'No supported clipboard utility found'
    return
  endif

  call system(l:cmd)
endfunction

function! PasteFromClipboard()
  if s:is_mac
    let l:cmd = 'pbpaste'
  elseif s:is_wayland
    let l:cmd = 'wl-paste'
  elseif s:is_x11
    let l:cmd = 'xclip -o -selection clipboard'
  else
    echomsg 'No supported clipboard utility found'
    return
  endif

  let l:content = system(l:cmd)
  if v:shell_error != 0
    echomsg 'Clipboard paste failed'
    return
  endif

  put =l:content
endfunction

" Setup buffer copy/paste
vnoremap y :call CopyToClipboard()<CR>
noremap x :call CopyToClipboard()<CR>:'<,'> d<CR>
nnoremap <silent> p :call PasteFromClipboard()<CR>

vmap <C-l> :'<,'>norm i//<CR>
vmap <S-l> :'<,'>norm xx<CR>

command! FindTags call Find_tags()
fun! Find_tags()
  " set global variable tags
  let &tags = system("~/.vim/find_near_tags.sh")
  " print variable: set tags?
endfun

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
