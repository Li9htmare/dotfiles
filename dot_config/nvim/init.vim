" vim: filetype=vim

if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    ! curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'lukas-reineke/indent-blankline.nvim'
let g:indent_blankline_filetype_exclude = ['help']

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
call plug#end()

set clipboard=unnamedplus

set number
set relativenumber

set colorcolumn=120

set ruler

set cinoptions=(1s

set lazyredraw

set laststatus=2
set showcmd

set incsearch
set ignorecase
set smartcase

set scrolloff=5

set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«

set splitbelow
set splitright

set background=dark

colorscheme gruvbox

let g:airline_powerline_fonts = 1

nnoremap <silent> <Esc> :nohlsearch<CR>

let mapleader = ' '

nnoremap <Leader>/ :Rg

nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

nnoremap <Leader>ff :Files<CR>

nnoremap <Leader>w <C-W>
nnoremap <Leader>ww :Windows<CR>

vnoremap <C-c> "+y
vnoremap < <gv
vnoremap > >gv
