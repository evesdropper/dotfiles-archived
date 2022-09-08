
" General Settings
syntax enable                           " Enables syntax highlighting
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			         " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4 softtabstop=4             " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
" Line Sets
set number                              " Line numbers
set exrc
set hidden
set errorbells
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=4                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
" set autochdir                           " Your working directory will always be thesame as your working directory
" Scroll and column sets
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
" Search and File Sets
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set shellslash
" Spell Check
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" keybinds
let mapleader = ","

" mappings
" I hate escape more than anything else
inoremap jk <Esc>
" Alternate way to save
nnoremap zz :w<CR>
inoremap <C-s> <Esc>:update<cr>gi

" Tabbing
nnoremap <C-W> :bd<CR>
nnoremap <C-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>

" Move lines up and down
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

call plug#begin()
" Status Bar with Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
    let maplocalleader = ","
Plug 'tpope/vim-rhubarb'
Plug 'tomasiser/vim-code-dark'
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" Commenting
Plug 'tpope/vim-commentary'
call plug#end()

" colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
try
  colorscheme codedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode
