call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'

call plug#end()

source ~/.vimrc

filetype plugin indent on
set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Call autocomplete after dot
au filetype go inoremap <buffer> . .<C-x><C-o>

nnoremap <F10> :NERDTreeToggle<CR>
map  :Commentary<CR>
