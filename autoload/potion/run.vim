" Functions for things to do with executing potion

" Executes the current potion file
function! potion#run#PotionExecute() " {{{
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction " }}}

" Opens a new buffer displaying the file's bytecode.
function! potion#run#PotionShowByteCode() " {{{
    redir => bytecode
        silent execute "!" . g:potion_command . " -c -V "
        \                  . bufname("%") . " 2\>&1"
    redir END

    let current_win = winnr()
    let new_window  = "rightbelow " . g:potion_bytecode_size . "split"

    if exists("t:potion_bytecode_buffer")
        call potion#helper#ActivateBuffer(t:potion_bytecode_buffer, new_window)
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

