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

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"----------------------------------------------
" Language: Golang
"----------------------------------------------
" au FileType go set noexpandtab
" au FileType go set shiftwidth=4
" au FileType go set softtabstop=4
" au FileType go set tabstop=4

" Mappings
" au FileType go nmap <F9> :GoCoverageToggle -short<cr>
" au FileType go nmap <F10> :GoTest -short<cr>
" au FileType go nmap <F12> <Plug>(go-def)
" au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
" au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
" au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
" au FileType go nmap <leader>gt :GoDeclsDir<cr>
" au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
" au FileType go nmap <leader>gd <Plug>(go-def)
" au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
" au FileType go nmap <leader>gdh <Plug>(go-def-horizontal)
" au FileType go nmap <leader>gD <Plug>(go-doc)
" au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

" Run goimports when running gofmt
" let g:go_fmt_command = "goimports"

" Set neosnippet as snippet engine
" let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
" let g:go_list_type = "quickfix"

" gometalinter configuration
" let g:go_metalinter_command = ""
" let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_enabled = [
"     \ 'deadcode',
"     \ 'errcheck',
"     \ 'gas',
"     \ 'goconst',
"     \ 'gocyclo',
"     \ 'golint',
"     \ 'gosimple',
"     \ 'ineffassign',
"     \ 'vet',
"     \ 'vetshadow'
" \]

" Set whether the JSON tags should be snakecase or camelcase.
" let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
" let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" let g:neomake_go_gometalinter_maker = {
"   \ 'args': [
"   \   '--tests',
"   \   '--enable-gc',
"   \   '--concurrency=3',
"   \   '--fast',
"   \   '-D', 'aligncheck',
"   \   '-D', 'dupl',
"   \   '-D', 'gocyclo',
"   \   '-D', 'gotype',
"   \   '-E', 'errcheck',
"   \   '-E', 'misspell',
"   \   '-E', 'unused',
"   \   '%:p:h',
"   \ ],
"   \ 'append_file': 0,
"   \ 'errorformat':
"   \   '%E%f:%l:%c:%trror: %m,' .
"   \   '%W%f:%l:%c:%tarning: %m,' .
"   \   '%E%f:%l::%trror: %m,' .
"   \   '%W%f:%l::%tarning: %m'
"   \ }

set noshowmode
set number
