"highlight cComment ctermfg=Green guifg=Green
syn match cDefine "#define\s\s*"

"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction        gui=NONE guifg=#B5A1FF ctermfg=green cterm=bold

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
"syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
syn match       cLogicalOperator  display "="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="
" C misc
syn match       cDelimOperator    display "[)(}{\]\[]"
syn match       cPuncOperator     display "[,:?;.]"

" Math Operator
hi cMathOperator            guifg=#3effe2 ctermfg=lightcyan
hi cPointerOperator         guifg=#3EFFE2 ctermfg=lightcyan
hi cLogicalOperator         guifg=#3EFFE2 ctermfg=lightcyan
hi cBinaryOperator          guifg=#3EFFE2 ctermfg=lightcyan
hi cBinaryOperatorError     guifg=#3EFFE2 ctermfg=lightcyan
hi cLogicalOperator         guifg=#3EFFE2 ctermfg=lightcyan
hi cLogicalOperatorError    guifg=#3EFFE2 ctermfg=lightcyan
hi cDelimOperator           guifg=#3EFFE2 ctermfg=red
hi cPuncOperator            guifg=#3EFFE2 ctermfg=lightcyan

