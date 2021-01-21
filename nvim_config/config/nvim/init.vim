let mapleader=" "

" line number
" ====
set number
set relativenumber
set cursorline

" syntax
" ====
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
""if  filetype == "R"
    ""inoremap < <- <ESC>i
    ""inoremap > -> <ESC>i
""endif

" indent
" ====
set autoindent
set cindent

" tabkey
" ====
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" appearance
" ====
let &t_ut=''
set laststatus=2

" wrap
" ====
set wrap

" editor
" ====
set showcmd
set wildmenu
" s split 
" r right 
" l left 
" u up
" d down
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sd :set splitbelow<CR>:split<CR>
map su :set nosplitbelow<CR>:split<CR>
" change screen
map <LEADER>l <C-w>h
map <LEADER>r <C-w>r
map <LEADER>u <C-w>k
map <LEADER>d <C-w>j
" screen size
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize -5<CR>
map <LEADER><right> :vertical resize +5<CR>
" 's' by default is used to delete current character and into the insert mode
" but I DONOT need it, so I remapped it
map s <nop>
map S :w<CR>
" tab page
map tn :tabe<CR>
map tl :+tabnext<CR>
map tr :-tabnext<CR>
map tc :tabclose<CR>

" open file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" backspace
set backspace=indent,eol,start

" execute dir
set autochdir

" mouse
set mouse=a

" backup
" ====
set nobackup
set nowritebackup

" encoding
" ====
set encoding=utf-8

" search
" ====
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

" Plugins
" ====
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Coc
" ====
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-clangd',
    \'coc-css',
    \'coc-go',
    \'coc-julia',
    \'coc-rust-analyzer',
    \'coc-r-lsp',
    \'coc-python',
    \'coc-cmake',
    \'coc-emmet',
    \'coc-vimlsp',
    \'coc-tsserver',
    \'coc-xml',
    \'coc-toml',
    \'coc-highlight',
    \'coc-yaml',
    \'coc-phpls'
\]

set updatetime=250
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-o> coc#refresh()

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

