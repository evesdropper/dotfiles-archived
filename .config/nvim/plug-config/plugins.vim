" Plugins

call plug#begin(stdpath('config') . '/plugged')
Plug 'lervag/vimtex'
    let maplocalleader = ","
    "Plug 'KeitaNakamura/tex-conceal.vim'
"    set conceallevel=1
"    let g:tex_conceal='abdmg'
"    hi Conceal ctermbg=none
Plug 'sirver/ultisnips'
" I decided I might actually be okay with markdown for some quick non math
" intensive programming
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
    let maplocalleader = ","
    let g:mkdp_theme = 'dark'
    nmap <Leader>lv <Plug>MarkdownPreview
    nmap <M-s> <Plug>MarkdownPreviewStop
    nmap <C-p> <Plug>MarkdownPreviewToggle
Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Buffer Bar
Plug 'romgrk/barbar.nvim'
" Status Bar with Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File finding  
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'preservim/nerdtree'
" Git
Plug 'tpope/vim-fugitive'
    let maplocalleader = ","
Plug 'tpope/vim-rhubarb'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Sneak
Plug 'justinmk/vim-sneak'
" Surround 
Plug 'tpope/vim-surround'
" Themes
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" Commenting 
Plug 'tpope/vim-commentary'
call plug#end() 

" short configs - vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'latexmk'
let g:vimtex_compiler_engine = 'pdflatex'
" auto show PDF
function! ZathuraHook() dict abort
    if self.xwin_id <= 0 | return | endif
    silent call system('xdotool windowactivate ' . self.xwin_id . ' --sync')
    silent call system('xdotool windowraise ' . self.xwin_id)
endfunction
augroup vimrc_vimtex
    autocmd!
    autocmd User VimtexEventView call ZathuraHook()
augroup END
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
