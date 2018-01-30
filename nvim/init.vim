set termguicolors
set background=dark
colorscheme pencil
syntax enable
let g:airline_theme='bubblegum'


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on

set number
set showcmd
set cursorline
set wildmenu
set lazyredraw


set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>


set foldenable
set foldlevelstart=10

autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

"set autochdir



let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

