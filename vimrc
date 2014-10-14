
" ===================PLUGINS========================

"VUNDLE
"
set nocompatible              
filetype off           
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()  
"
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim' 

" All ofstr/vim-nerdtree-tabs your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on    

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 
" NERDTree
"
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowLineNumbers=0

" Syntstic
"
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8']
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs=1

"YouCompleteMe
"
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']

"Indentation
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" VIM CONFIGURATION 
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror 
let NERDTreeIgnore = ['\.pyc$', '\.orig$'] 
set number

"  ===================COLOR THEME========================
"
"GRUVBOX theme
colorscheme badwolf

"Indentation color
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=234

" ===================VIM SETTINGS=======================
 set expandtab           " enter spaces when tab is pressed
 set textwidth=120       " break lines when line length increases
 set tabstop=4           " use 4 spaces to represent tab
 set softtabstop=4
 set shiftwidth=4        " number of spaces to use for auto indent
 set autoindent          " copy indent from current line when starting a new line
 set ruler                           " show line and column number
" ===================KEY MAPPING========================
"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F3> :set number<CR>
nnoremap <F4> :set nonumber<CR>
:imap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc> 
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" ==================FUNCTIONS============================
"
" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

