-- map localleader please
vim.g.maplocalleader = ","

-- zathura
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0

-- i am too lazy to make this lua
vim.cmd([[ 
function! ZathuraHook() abort
    " Get the viewer xwin_id
    let xwin_id = exists('b:vimtex.viewer.xwin_id')
            \ ? b:vimtex.viewer.xwin_id
            \ : 0
    if xwin_id <= 0 | return | endif

    silent call system('xdotool windowactivate ' . xwin_id . ' --sync')
    silent call system('xdotool windowraise ' . xwin_id)
endfunction

augroup vimrc_vimtex
    autocmd!
    autocmd User VimtexEventView call ZathuraHook()
augroup END
]])
