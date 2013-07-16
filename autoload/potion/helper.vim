" Helper functions for the potion plugin

" Switch to the given winnr
function! potion#helper#ActivateWin(nr) " {{{
    silent execute a:nr . "wincmd w"
endfunction " }}}

" Switches to a loaded buffer's window if it's active, otherwise it will open a
" new split and load the buffer into that win
function! potion#helper#ActivateBuffer(nr, command) " {{{
    if !bufexists(a:nr)
        return 0
    end

    if bufloaded(a:nr)
        call potion#helper#ActivateWin(bufwinnr(a:nr))
    else
        execute a:command . " " . bufname(a:nr)
    endif
endfunction " }}}

