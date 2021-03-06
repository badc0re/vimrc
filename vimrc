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
"Plugin 'davidhalter/jedi-vim'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'chiedo/vim-case-convert'
"
call vundle#end()            
filetype plugin indent on    

"Leader key
"
let mapleader= "4"

"Remove trailing whitespace
"
autocmd BufWritePre *.py :%s/\s\+$//e

" NERDTree
"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowLineNumbers=0 
let NERDTreeIgnore = ['\.pyc$', '\.orig$']

" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8', 'python']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_shell = "/bin/zsh"

"YouCompleteMe
" 
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_python_binary_path = 'python'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_server_use_vim_stdout = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Jedi-complete
"let g:jedi#show_call_signatures = "1"
"let g:jedi#popup_select_first = 0
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

"Indentation
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1 

"Easymotion 
"
let g:EasyMotion_smartcase = 1

"  ===================COLOR THEME========================
"

"Indentation color
"
colorscheme ron
set ts=2 sw=2 et
filetype plugin on
syntax on
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=234

" ===================VIM SETTINGS======================= 
"
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
set t_Co=256
"set term=screen-256color
"map <leader>g <C-]> " goto definition

" ===================KEY MAPPING========================
"
set clipboard=unnamedplus
set noswapfile
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <F3> :set number<CR>
nnoremap <F4> :set nonumber<CR>
:imap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" save and quit
noremap <silent> <Leader>w :w<CR>
noremap <silent> <Leader>q :q<CR>
" remove hightlights
nnoremap <Leader><F3> :set hlsearch!<CR>
nnoremap <C-Left> :tabprevious<CR>
" clipboard
set clipboard=unnamedplus
set nocompatible
set backspace=2
" comment
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>
"nasm
au BufRead,BufNewFile *.asm set filetype=nasm
" ===================KEY GO-LANG========================
"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

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

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.cpp :call TrimWhiteSpace()
autocmd BufWritePre     *.hpp :call TrimWhiteSpace()

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ==================TRIED STUFF==========================
"
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
"

"Things to try:
"
"https://github.com/vim-scripts/dbext.vim
"https://github.com/klen/python-mode
