set termguicolors
set background=dark
colorscheme spacemacs-theme
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

let g:haskell_indent_disable = 1

let g:deoplete#enable_at_startup = 1
set completeopt-=preview
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-5.0/lib/libclang.so"

let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-5.0/lib/clang"

