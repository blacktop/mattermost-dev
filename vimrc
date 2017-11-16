let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
silent! colorscheme tender

" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'tender' }

set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

set noshowmode
set number
