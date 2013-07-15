nnoremap <buffer> <localleader>b :w<CR>:call <SID>PotionShowByteCode()<CR>

let g:potion_command="potion"
let g:potion_bytecode_size = 15

" Switch to the given winnr
function! s:ActivateWin(nr) " {{{
    silent execute a:nr . "wincmd w"
endfunction " }}}

" Switches to a loaded buffer's window if it's active, otherwise it will open a
" new split and load the buffer into that win
function! s:ActivateBuffer(nr, command) " {{{
    if !bufexists(a:nr)
        return 0
    end

    if bufloaded(a:nr)
        call s:ActivateWin(bufwinnr(a:nr))
    else
        execute a:command . " " . bufname(a:nr)
    endif
endfunction

" Opens a new buffer displaying the file's bytecode.
function! s:PotionShowByteCode() " {{{
    redir => bytecode
        silent execute "!" . g:potion_command . " -c -V "
        \                  . bufname("%") . " 2\>&1"
    redir END

    let current_win = winnr()
    let new_window  = "rightbelow " . g:potion_bytecode_size . "split"

    if exists("t:potion_bytecode_buffer")
        call s:ActivateBuffer(t:potion_bytecode_buffer, new_window)
    else
        execute new_window . " __Potion_Bytecode__"
        let t:potion_bytecode_buffer = bufnr("%")
    endif

    " Fail safe, we don't want to accidently wipe the wrong buffer
    if winnr() ==? bufwinnr(t:potion_bytecode_buffer) 
        normal! ggdG
        setlocal filetype=potion_bytecode
        setlocal buftype=nofile

        call append(0, split(bytecode, '\v\n'))
        normal! gg

        execute current_win . "wincmd w"
    endif
endfunction " }}}
