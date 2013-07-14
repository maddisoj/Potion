if exists("b:current_syntax")
    finish
endif

" Keywords ------------------------------------------------------------------{{{

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

" }}}

" Functions -----------------------------------------------------------------{{{

syntax keyword potionFunction print join string

" }}}

" Comments ------------------------------------------------------------------{{{

syntax match potionComment "\v#.*$"

" }}}

" Operators -----------------------------------------------------------------{{{

syntax match potionOperator "\v\?"
syntax match potionOperator "\v:"
syntax match potionOperator "\v\="
syntax match potionOperator "\v/?\."
syntax match potionOperator "\v\*\=?"
syntax match potionOperator "\v/\=?"
syntax match potionOperator "\v\+\=?"
syntax match potionOperator "\v-\=?"

" }}}

" Numbers -------------------------------------------------------------------{{{

syntax match potionNumber "\v\d+"                   " Numbers
syntax match potionNumber "\v\d+\.\d+"              " Floats
syntax match potionNumber "\v0x\w+"                 " Hexidecimal
syntax match potionNumber "\v\d*\.?\d+e[\+-]+\d+"   " Standard Notation

" }}}

" Strings -------------------------------------------------------------------{{{

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/

" Links ---------------------------------------------------------------------{{{

highlight link potionKeyword Keyword 
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number
highlight link potionString String

" }}}

let b:current_syntax = "potion"
