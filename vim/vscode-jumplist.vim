
" VIM jumplist is used now
" nnoremap <silent> <C-o> :<C-u>call VSCodeNotify("workbench.action.navigateBack")<CR>
" nnoremap <silent> <C-i> :<C-u>call VSCodeNotify("workbench.action.navigateForward")<CR>
" nnoremap <silent> <Tab> :<C-u>call VSCodeNotify("workbench.action.navigateForward")<CR>

function! s:jumpToMark() abort
    let g:isJumping = 1
    normal! `
    let g:isJumping = 0
endfunction

function! s:jump(forward) abort
    let g:isJumping = 1
    exe a:forward ? "normal! 1\<C-i>" : "normal! \<C-o>"
    let g:isJumping = 0
endfunction

function! s:clearJumplist() abort
    if exists("w:vscode_clearjumps") && w:vscode_clearjumps
        let w:vscode_clearjumps = 0
        clearjumps
    endif
endfunction

augroup VscodeJumplist
    autocmd!
    autocmd WinEnter * call <SID>clearJumplist()
augroup END


onoremap ` <Cmd>call <SID>jumpToMark()<CR>
nnoremap <silent> <C-o> :<C-u>call <SID>jump(0)<CR>
nnoremap <silent> <C-i> :<C-u>call <SID>jump(1)<CR>
nnoremap <silent> <Tab> :<C-u>call <SID>jump(1)<CR>

