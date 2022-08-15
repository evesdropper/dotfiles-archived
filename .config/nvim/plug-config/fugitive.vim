" Show commits for every source line
nnoremap <Leader>gb :Git blame<CR>  " git blame

nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Git commit -v -q<CR>
nnoremap <Leader>gt :Git commit -v -q %:p<CR>

" Add the entire file to the staging area
nnoremap <Leader>gaf :Gw<CR>     " git add file 
