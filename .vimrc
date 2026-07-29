" Start the plugin section (specify a directory for downloads)
call plug#begin('~/.vim/plugged')

" Add your plugins here (using their GitHub repository names)
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-pencil'
Plug 'junegunn/limelight.vim'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'preservim/vim-colors-pencil'

" End the plugin section
call plug#end()

set smoothscroll
set wrap
set linebreak
set spell
set spell spelllang=fr
set smartcase
set confirm
syntax on
set relativenumber
set number
set showmatch
set encoding=utf-8

" Activation du thème
set termguicolors
colorscheme pencil
set background=dark

" Active Goyo pour les fichiers markdown
au Filetype markdown Goyo 80

" Changement du curseur dans le mode Insert et conservation du block dans le
" mode normal
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
