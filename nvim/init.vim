"Theme settings
set termguicolors
set background=dark
colorscheme nord "spacemacs-theme
syntax enable
"let g:airline_theme='bubblegum'
"hi MatchParen guifg=#68727c guibg=#292b2e 
let g:nord_italic = 1
highlight Conceal ctermbg=2E3440 guibg=2E3440

"Indention settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set autoindent
filetype plugin indent on

"Random UI settings
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw

"Search settings
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>

"Fold settings
set foldenable
set foldmethod=syntax
set foldlevelstart=10
set foldlevel=10
set sessionoptions+=folds
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent! loadview 
"autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
"autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

"Hasekell indent
let g:haskell_indent_disable = 1

"Rustfmt on save | disabled because is anyoing
"let g:rustfmt_autosave = 1

"Detect .tex as latex
let g:tex_flavor='latex'
"Detect .htex as latex
autocmd! BufRead,BufNewFile *.htex     setfiletype tex
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|writehaskell\|diagram'


"Set leader to space
let mapleader = "\<Space>"

"Pandoc settings
let g:pandoc#command#latex_engine = "pdflatex"
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = "Pandoc pdf"
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#conceal#use = 0

"Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"Split navigation
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"NERDTree
map <C-o> :NERDTreeToggle<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0

"FZF
let $FZF_DEFAULT_COMMAND = 'rg --files'
map <C-p> :FZF<CR>

"Directory settings
set noautochdir
