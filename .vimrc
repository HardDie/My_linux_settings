set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set incsearch
set hlsearch

" Always show statusline
set laststatus=2

" Show file path
set statusline+=%F

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax on

" Setup line number
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE

" Plugin manager
execute pathogen#infect()
filetype plugin indent on

set cscopeprg=gtags-cscope

" Show tab and space
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

" Add NerdTree shortcut
map <C-o> :NERDTreeToggle<CR>

" set background=dark
" color delek
color koehler
" color zellner

" Setup buffer copy
vmap y :'<,'> w! /tmp/vimtmp<CR>
vmap x :'<,'> w! /tmp/vimtmp<CR>dd<CR>
nmap p :r /tmp/vimtmp<CR>
