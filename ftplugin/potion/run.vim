if !exists("g:potion_command")
    let g:potion_command="potion"
endif

if !exists("g:potion_bytecode_size")
    let g:potion_bytecode_size = 15
endif

nnoremap <buffer> <silent>
       \ <localleader>e :w<CR>:call potion#run#PotionExecute()<CR>
nnoremap <buffer> <silent>
       \ <localleader>b :w<CR>:call potion#run#PotionShowByteCode()<CR>

