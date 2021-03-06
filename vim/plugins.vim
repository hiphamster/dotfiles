""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-commentary settings
autocmd FileType sql set commentstring=--\ %s
autocmd FileType vim set commentstring=\"\ %s


" tasklist plugin
map <leader>v <Plug>TaskList


" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1


" Don't conceal things like "->" with their Unicode representation
let g:no_rust_conceal = 1


" Hide .pyc in NetRW
let g:netrw_listhide='.*\.pyc\$'


" Strip trailing whitespace - The Plugin
nmap <leader><space> :call whitespace#strip_trailing()<CR>


" Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"


" Tabularize
" nmap <leader>a= :Tabularize /=<CR>
" vmap <leader>a= :Tabularize /=<CR>
" nmap <leader>a: :Tabularize /:\zs<CR>
" vmap <leader>a: :Tabularize /:\zs<CR>
" nmap <leader>a, :Tabularize /,\zs<CR>
" vmap <leader>a, :Tabularize /,\zs<CR>


" Syntastic
let g:syntastic_python_checkers=['flake8', 'pylama']
let g:syntastic_python_flake8_args='--ignore=E501,E401,E221,E241'
let g:syntastic_python_pylama_args='--ignore E501,E401,E221,E241'

let g:syntastic_javascript_checkers=['jshint']

let g:syntastic_css_checkers=['csslint']

let g:syntastic_html_checkers=[] " ['validator', 'w3']
" Let syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
" If multiple checkers are defined, aggregate their output
let g:syntastic_aggregate_errors = 1


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" vim-test
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" let test#strategy = "basic"
" make test commands execute using dispatch.vim
" let test#strategy = "dispatch"
" Use this for Neovim
" let test#strategy = "neovim"
" Sends test commands to Terminal (useful in MacVim GUI).
" let test#strategy = "terminal"
" Sends test commands to iTerm2 >= 2.9 (useful in MacVim GUI).
" let test#strategy = "iterm"

" Set sticky cli options
" let test#ruby#minitest#options = '--verbose'

" Set executable
" let test#ruby#rspec#executable = 'foreman run rspec'

" vim-test defaults to the first available test runner. The setting below
" foces a specific one
" Runners available are 'pytest', 'nose', 'djangotest' and 'djangonose'
" let test#python#runner = 'pytest'


" jekyll.vim
map <leader>jb  :JekyllBuild<CR>
map <leader>jn  :JekyllPost<CR>
map <leader>jl  :JekyllList<CR>
map <leader>jc  :JekyllCommit<CR>
map <leader>jp  :JekyllPublish<CR>


" vim-airline
" Only load the specified extensions
" let g:airline_extensions = ['branch', 'tabline']
" enable/disable automatic population of the `g:airline_symbols` dictionary with powerline symbols.
" let g:airline_powerline_fonts=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>m :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>o :CtrlPMixed<CR>
" nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :CtrlPTag<CR>


" Let CtrlP use a cache
let g:ctrlp_use_caching = 1


" Keep cache across sessions
let g:ctrlp_clear_cache_on_exit = 1


" Custom caching dir
let g:ctrlp_cache_dir = $HOME.'/.ctrlp-cache'


" Up the number of files ctrlp is allowed to scan
let g:ctrlp_max_files = 50000


" Only update after typing has stopped
" let g:ctrlp_lazy_update = 1


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
      \ },
      \ 'fallback': 'ag %s --files-with-matches --nocolor -g ""'
    \ }
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepping & searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
