" Install vim-plug:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" LSP Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust basics: syntax, indent, :RustFmt
Plug 'rust-lang/rust.vim'

" Svelte syntax highlighting
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Plugins for general web dev
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'

" Git, for commiting
Plug 'tpope/vim-fugitive'

" Make comments with gcc 
Plug 'tpope/vim-commentary'

" Fuzzy file find; requires 'sudo apt install fzf'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'

" Gruvbox color scheme
Plug 'morhetz/gruvbox'

" Remember to run :PlugInstall after installing vim-plug

call plug#end()

" enable filetypes
filetype plugin on

" Use Gruvbox color scheme
syntax enable
set background=dark
colorscheme gruvbox

" Turn off the bell (both sound and visual)
set noerrorbells
set t_vb=

" Line numbers and relative numbers
set number
set relativenumber

" Better experience for tabs and indentation
set tabstop=4       " Number of spaces that a tab counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tabs
set autoindent      " Copy indent from the current line when starting a new line

" Enable changing the cursor shape
if &term =~ "xterm"
    let &t_SI = "\e[6 q"  " I-beam cursor in insert mode
    let &t_SR = "\e[4 q"  " Underline cursor in replace mode
    let &t_EI = "\e[2 q"  " Block cursor in normal mode
endif

" Enable mouse support
set mouse=a

" No changing of symbols
set nodigraph
set encoding=utf-8
set fileencoding=utf-8

" Highlight search results
set hlsearch
set incsearch

" Persistent undo (optional)
set undofile
set undodir=~/.vim/undodir

" Enable line wrapping (optional)
set wrap
set linebreak

" Set a status line (optional)
set laststatus=2
set ruler

" Disable auto-adding comments to new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcut for navigating buffer list
nnoremap <silent> <C-PageDown> :bprevious<CR>
nnoremap <silent> <C-PageUp> :bnext<CR>

" COC autocomplete behavior ------------------
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" COC LSP keymaps ------------------
" Go to definition / references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" FZF
" nnoremap <C-p> :Files<CR>

" Show git blame for current buffer
nnoremap <silent> gb :Git blame<CR>
