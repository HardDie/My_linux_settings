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
vmap x :'<,'> w! /tmp/vimtmp<CR>:'<,'> d<CR>
nmap p :r /tmp/vimtmp<CR>

vmap <C-l> :'<,'>norm i//<CR>
vmap <S-l> :'<,'>norm xx<CR>

" Snippets

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
