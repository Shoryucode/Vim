execute pathogen#infect()

"Don't use vi settings. unnecessary, if you start up gVim to begin with.
set nocompatible

"Appearance
if has('gui_running')

		"Line wrap(number of cols)
		set textwidth=100
		"Number of lines
		set lines=50
		"Number of columns
		set columns=95
		"Enable mouse
		set mouse=a
endif

"Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"Normal backspace behavior
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"Switch syntax highlightning on
syntax on

"Enable syntax processing
syntax enable

"Show line numbers
set number

"Always show current position
set ruler

"Height of the command bar
set cmdheight=2

"Number of visual spaces per TAB
set tabstop=4

"When indenting
set shiftwidth=4

"Enable smart-tabs
set smarttab

"Enable smart-indent
set smartindent

"Highlight all search results
set hlsearch

"Always case-insensitive
set ignorecase

"No backup files
set nobackup
set nowritebackup

"Show command in bottom bar
set showcmd

"Highlight current line
set cursorline

"Visual autocomplete for command menu
set wildmenu

"Load filetyoe-specific indent files
filetype indent on
filetype plugin on

"Highlight matching {[()]}
set showmatch

"Redraw only when we need
set lazyredraw

"Set how many lines of history gVim has to remember
set history =666

"Enable highlightning on
syntax on

"Status Line
set laststatus=2

"Fast saving
nmap <leader>w :w!<cr>

"sudo saving
command W w !sudo tee % > /dev/null

"English
let $LANG='en'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Hide buffer when not used
set hid


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""                      """""""""""""""""""
""""""""""""""" PLUGIN CONFIGURATION """""""""""""""""""
"""""""""""""""                      """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"SOLARIZED
set background=light
colorscheme solarized

"delimitMate
let delimitMate_expand_cr = 1



"indent lines
let g:indentLine_char = '│'

"better-CSS-syntax
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

""""""""""""""""""""""""""""""""""""
" => Take care of indents for Java "
""""""""""""""""""""""""""""""""""""
set si
"Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

""""""""""""""""""""""""""""""
" => JavaScript section
""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
 
"concealing characters
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

"Zen-coding
let g:user_zen_mode='a'

"bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

"MRU plugin
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"CTRL-P
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20

"Grep-Vim
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"Nerd-Tree
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

"Surround-Vim
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"Vim-Airline
let g:airline_theme="luna"

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes']
