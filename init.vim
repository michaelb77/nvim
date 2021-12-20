" +------------------------------------------------------------------------+ 
" |          __ __ _ _  _____  _   __   __  _  _   _  _ __ __ 			       | 
" |         |  V  | | |/ / __|`.\/' _/ |  \| || \ / || |  V  |             |
" |         | \_/ | |   <| _|    `._`. | | ' |`\ V /'| | \_/ |             |
" |         |_| |_|_|_|\_\___|   |___/ |_|\__|  \_/  |_|_| |_|             |
" |                                                                        |
" |                                                                        |
" | Personal NVIM configuration file of Michel Bédard <mbdard77@gmail.com> |
" |                                                                        |                       
" +------------------------------------------------------------------------+

" +------------------------------------------------------------------------+
" | General Settings   													                           |
" +------------------------------------------------------------------------+
set expandtab " Convert tabs into spaces.
set shiftwidth=4
set tabstop=4
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

" +------------------------------------------------------------------------+
" | Key maps         													                             |
" +------------------------------------------------------------------------+

let $VIMCONFIG = fnamemodify(expand("$VIM"), ':h:h') . '\config'  " Get the path equivalent to $VIM\..\..\config
let &rtp .= ',' . $VIMCONFIG              " Add custom runtime path
let $MYVIMRC = $VIMCONFIG . '\init.vim'         " Set $MYVIMRC to point to the init.vim file
let $MYGVIMRC = $VIMCONFIG . '\ginit.vim'       " Set $MYGVIMRC to point to the ginit.vim file
exec 'source ' . $MYVIMRC           | " Source the init.vim file

let mapleader = "\<space>"
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>

" +------------------------------------------------------------------------+
" | Plugins 															                                 |
" +------------------------------------------------------------------------+
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('C:/Users/Michel/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
call plug#end()

doautocmd User PlugLoaded


" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
