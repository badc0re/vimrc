" ===================PLUGINS========================
"VUNDLE
"
set nocompatible              
filetype off           
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()  
"
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
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
Plugin 'Lokaltog/vim-easymotion'
"
call vundle#end()            
filetype plugin indent on    

" NERDTree
"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowLineNumbers=0 
let NERDTreeIgnore = ['\.pyc$', '\.orig$']

" Syntastic
"
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8']
let g:syntastic_aggregate_errors = 1
"let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

"YouCompleteMe
" 
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']

"Indentation
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1 

"Easymotion 
"
let g:EasyMotion_smartcase = 1

"  ===================COLOR THEME========================
"
"badwolf theme
"
colorscheme badwolf

"Indentation color
"
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=234

" ===================VIM SETTINGS======================= 

set tags=$VIRTUAL_ENV/tags,~/tags;/
autocmd BufEnter * :set hlsearch 	"autostart highlight search
set expandtab           		" enter spaces when tab is pressed
set textwidth=120       		" break lines when line length increases
set tabstop=4           		" use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        		" number of spaces to use for auto indent
set autoindent          		" copy indent from current line when starting a new line
set ruler               		" show line and column number
set number

" ===================KEY MAPPING========================
"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F3> :set number<CR>
nnoremap <F4> :set nonumber<CR>
:imap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" ==================FUNCTIONS============================
"
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"Tried stuff
"Plugin 'davidhalter/jedi-vim'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'myusuf3/numbers.vim'
"Plugin 'Yggdroot/indentLine' 
"Plugin 'morhetz/gruvbox' 
"Plugin 'ggreer/the_silver_searcher'
"Plugin 'rking/ag.vim'
