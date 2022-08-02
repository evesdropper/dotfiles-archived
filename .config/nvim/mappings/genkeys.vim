let mapleader = ","

" mappings
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap zz :w<CR>
inoremap <C-s> <Esc>:update<cr>gi

" Alternate way to quit
nnoremap <C-Q> :wq<CR>
nnoremap <C-S-Q> :q!<CR>
" Tabbing 
nnoremap <C-W> :bd<CR>
nnoremap <C-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Move lines up and down
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" for latex/markdown / rm's red bar to make latex look nicer
inoremap <M-z> <Esc>:set wrap! linebreak<cr>gi
inoremap <M-x> <Esc>:execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>gi
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
 
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NERDTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" commenting
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

