hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'paprika'

if has('nvim') || has('lua')
  lua require('paprika').load()
else
  echoerr 'paprika requires Vim compiled with +lua'
endif
