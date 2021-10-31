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

"Set leader to space
let mapleader = " "

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
"autocmd BufWinEnter *.* silent! loadview 
"autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
"autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

"Treesitter setttings
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
}
EOF

highlight link TSError Normal

"Vertical column
"let &colorcolumn="81,".join(range(120,999),",")

"Hasekell indent
let g:haskell_indent_disable = 1

"Rustfmt on save | disabled because is anyoing
"let g:rustfmt_autosave = 1

"Detect .tex as latex
let g:tex_flavor='latex'
"Detect .htex as latex
autocmd! BufRead,BufNewFile *.htex     setfiletype tex
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|writehaskell\|diagram'

"Pandoc settings
let g:pandoc#command#latex_engine = "pdflatex"
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = "Pandoc pdf"
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ["haskell", "diagram=haskell", "diagram-haskell=haskell", "tex", "tikz=tex"]
set conceallevel=0

"Vimtex settings
let g:vimtex_view_method = "zathura"
let g:vimtex_format_enabled = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"Split navigation
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"NERDTree
map <leader>o :NERDTreeToggle<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0

"FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'CursorLine'],
  \ 'hl':      ['fg', 'Operator'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'border':  ['bg', 'CursorLine'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


let $FZF_DEFAULT_COMMAND = 'rg --files'
map <C-p> :FZF --preview bat\ --color=always\ {}<CR>

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

command -nargs=1 Rg :call fzf#run(fzf#wrap({'sink': 'e', 'source': 'rg --column --line-number --no-heading --color=always <args>', 'options': ['--ansi', '--delimiter', ':', '--nth', '4..', '--preview', 'bat --color=always -r (math max \(0,(echo {} | cut -d: -f2)-15\)): -H (echo {} | cut -d: -f2) (echo {} | cut -d: -f1)']}))

"Directory settings
set noautochdir

"Statusline
set laststatus=2
set statusline=%#Line#\ %f\ %5*%=%#Line#\ %l,\ %c\ 

